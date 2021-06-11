Return-Path: virtio-comment-return-1900-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 08FBE986649
	for <virtio-comment@lists.oasis-open.org>; Fri, 11 Jun 2021 04:26:00 +0000 (UTC)
Date: Fri, 11 Jun 2021 09:55:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20210611042556.uetnbqc4cpolpjlq@vireshk-i7>
References: <111a00fa282a181c391f5566fd674dc59abb55b5.1623151932.git.viresh.kumar@linaro.org>
 <CACRpkdZBB4QGadppUYW9Ga4x2ydNxD-iZWZhXWeLVCivqnEsvw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdZBB4QGadppUYW9Ga4x2ydNxD-iZWZhXWeLVCivqnEsvw@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH V3] virtio-gpio: Add the device specification
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Walleij <linus.walleij@linaro.org>
Cc: virtio-comment@lists.oasis-open.org, Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 10-06-21, 23:45, Linus Walleij wrote:
> Hi Viresh!
> 
> I'm not any expert with virtio but I know a few things about GPIO.

And I am an expert at none of those :)

> On Tue, Jun 8, 2021 at 1:32 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > +\subsection{Feature bits}\label{sec:Device Types / GPIO Device / Feature bits}
> > +
> > +\begin{description}
> > +\item[VIRTIO_GPIO_F_IRQ (0)] The device supports interrupts on GPIO lines.
> > +\end{description}
> 
> How many bits are these?

From code, I see this to be 64. And from spec this is what I see:

Feature bits are allocated as follows:

0 to 23
        Feature bits for the specific device type
24 to 37
        Feature bits reserved for extensions to the queue and feature negotiation mechanisms
38 and above
        Feature bits reserved for future extensions.

I guess only 24 are for us here ? But that should be enough, isn't it
?

> Features I can already see will sooner or later be requested are:
> 
> - Setting and getting several GPIO lines at the same time
>   (reflecing get/set_multiple() in the GPIO subsystem)
> 
> - Line configuration, i.e. all these +/-:
>   (include/linux/pinctrl/pinconf-generic.h)
>         PIN_CONFIG_BIAS_BUS_HOLD,
>         PIN_CONFIG_BIAS_DISABLE,
>         PIN_CONFIG_BIAS_HIGH_IMPEDANCE,
>         PIN_CONFIG_BIAS_PULL_DOWN,
>         PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
>         PIN_CONFIG_BIAS_PULL_UP,
>         PIN_CONFIG_DRIVE_OPEN_DRAIN,
>         PIN_CONFIG_DRIVE_OPEN_SOURCE,
>         PIN_CONFIG_DRIVE_PUSH_PULL,
>         PIN_CONFIG_DRIVE_STRENGTH,
>         PIN_CONFIG_DRIVE_STRENGTH_UA,
>         PIN_CONFIG_INPUT_DEBOUNCE,
>         PIN_CONFIG_INPUT_ENABLE,
>         PIN_CONFIG_INPUT_SCHMITT,
>         PIN_CONFIG_INPUT_SCHMITT_ENABLE,
>         PIN_CONFIG_MODE_LOW_POWER,
>         PIN_CONFIG_MODE_PWM,
>         PIN_CONFIG_OUTPUT_ENABLE,
>         PIN_CONFIG_OUTPUT,
>         PIN_CONFIG_PERSIST_STATE,
>         PIN_CONFIG_POWER_SOURCE,
>         PIN_CONFIG_SLEEP_HARDWARE_STATE,
>         PIN_CONFIG_SLEW_RATE,
>         PIN_CONFIG_SKEW_DELAY,
> 
> People always want features. So there better be lots of bits
> to signal this or that feature, plus the requirement that all other
> bits MUST be zero for now.

I think that is already implied by the specification in general. If
the protocol doesn't use any feature bits, those bits must be zero.

> > +\item[\field{gpio_names}] is a stream of \field{ngpio} null-terminated strings,
> > +    where each string corresponds to a GPIO line.
> 
> Add:
> "each and every name MUST be unique for this GPIO Device and
> names MUST not be NULL"

Sure.

> IMO else you will get problems.
> Example: "gpio0", "gpio1", "gpio2"  ... "gpioN" is fine.
> More descriptive names can be used but they MUST be unique.
> 
> > +#define VIRTIO_GPIO_REQ_ACTIVATE                0x01
> > +#define VIRTIO_GPIO_REQ_DEACTIVATE              0x02
> > +#define VIRTIO_GPIO_REQ_GET_DIRECTION           0x03
> > +#define VIRTIO_GPIO_REQ_DIRECTION_IN            0x04
> > +#define VIRTIO_GPIO_REQ_DIRECTION_OUT           0x05
> > +#define VIRTIO_GPIO_REQ_GET_VALUE               0x06
> > +#define VIRTIO_GPIO_REQ_SET_VALUE               0x07
> > +#define VIRTIO_GPIO_REQ_IRQ_TYPE                0x08
> > +#define VIRTIO_GPIO_REQ_IRQ_MASK                0x09
> > +#define VIRTIO_GPIO_REQ_IRQ_UNMASK              0x0a
> > +#define VIRTIO_GPIO_IRQ_EVENT                   0x0b
> 
> As per review of the Linux driver I think a VIRTIO_GPIO_REQ_ACK
> message should exist with the semantics that the host MUST not
> send any new VIRTIO_GPIO_IRQ_EVENT:s for the same IRQ
> (other IRQs are fine) until it has recieved a VIRTIO_GPIO_REQ_ACK
> back for the IRQ (the IRQ number must be passed with the ACK).

Actually if you look at the specification, it is already there. I did
add that the guest needs to send a response message back on the
"interrupt" virtqueue to make end of the message initiated at host.

I just didn't use it in kernel driver :)

> This makes things
> feasible for transport to the other operating system, otherwise
> the recieveing OS must essentially hold local IRQs disabled
> until it gets a chance to send VIRTIO_GPIO_REQ_IRQ_MASK
> to mask this IRQ.

Yes, I will make this completely synchronous. Only one at a time.

-- 
viresh

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

