class Backlight extends Service {
    // every subclass of GObject.Object has to register itself
    static {
        // takes three arguments
        // the class itself
        // an object defining the signals
        // an object defining its properties
        Service.register(
            this,
            {
                // 'name-of-signal': [type as a string from GObject.TYPE_<type>],
                'brightness-changed': ['float'],
            },
            {
                // 'kebab-cased-name': [type as a string from GObject.TYPE_<type>, 'r' | 'w' | 'rw']
                // 'r' means readable
                // 'w' means writable
                // guess what 'rw' means
                'brightness': ['float', 'rw'],
            },
        );
    }

    // this Service assumes only one device with backlight
    #interface = Utils.exec("sh -c 'ls -w1 /sys/class/backlight | head -1'");

    // # prefix means private in JS
    #brightness = 0;
    #max = Number(Utils.exec('brightnessctl max'));

    // the getter has to be in snake_case
    get brightness() {
        return this.#brightness;
    }

    // the setter has to be in snake_case too
    set brightness(percent) {
        if (percent < 0)
            percent = 0;

        if (percent > 1)
            percent = 1;

        Utils.execAsync(`brightnessctl set ${percent * 100}% -q`);
        // the file monitor will handle the rest
    }

    constructor() {
        super();

        // setup monitor
        const backlight = `/sys/class/backlight/${this.#interface}/brightness`;
        Utils.monitorFile(backlight, () => this.#onChange());

        // initialize
        this.#onChange();
    }

    #onChange() {
        this.#brightness = Number(Utils.exec('brightnessctl get')) / this.#max;

        // signals have to be explicitly emitted
        this.emit('changed'); // emits "changed"
        this.notify('brightness'); // emits "notify::brightness"

        // or use Service.changed(propName: string) which does the above two
        // this.changed('brightness');

        // emit brightness-changed with the percent as a parameter
        this.emit('brightness-changed', this.#brightness);
    }

    // overwriting the connect method, let's you
    // change the default event that widgets connect to
    connect(event = 'brightness-changed', callback) {
        return super.connect(event, callback);
    }
}

// the singleton instance
const service = new Backlight;

// export to use in other modules
export default service;
