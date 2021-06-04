Return-Path: virtio-comment-return-1883-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D362F986575
	for <virtio-comment@lists.oasis-open.org>; Fri,  4 Jun 2021 12:59:07 +0000 (UTC)
MIME-Version: 1.0
References: <e687cd6bdafe1ad13205d99989163299649e20c9.1622794175.git.viresh.kumar@linaro.org>
 <db7ad3b4-36b5-1988-8f9a-b50a7e820150@metux.net>
In-Reply-To: <db7ad3b4-36b5-1988-8f9a-b50a7e820150@metux.net>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 4 Jun 2021 18:28:54 +0530
Message-ID: <CAKohpomU=0nO+yyywniZmLegvWSz9WdSf4jVwR=Z2J_XXoh8iA@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH V2] virtio-gpio: add the device specification
Content-Type: text/plain; charset="UTF-8"
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: virtio-comment@lists.oasis-open.org, Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 4 Jun 2021 at 17:55, Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 04.06.21 10:09, Viresh Kumar wrote:
\\> > +\begin{lstlisting}
> > +struct virtio_gpio_config {
> > +    char name[32];
> > +    u16 ngpio;
> > +    u16 padding;
> > +    u32 gpio_names_size;
> > +    char gpio_names[0];
> > +} __attribute__((packed));
> > +\end{lstlisting}
>
> oh no, please don't change the structs. the original one was:
>
> struct virtio_gpio_config {
>          __u8    version;
>          __u8    reserved0;
>          __u16   num_gpios;
>          __u32   names_size;
>          __u8    reserved1[24];
>          __u8    name[32];
> };
>
> The version is vital - we need an upgrade path for future extensions.
> (eg. bulk operations)

I did wonder about how versioning works in general for virtio and couldn't find
much for any device specification there.

Does anyone know how we handle different versions of the spec? Or is it left
for the individual protocols, GPIO in this case ?

Sure I will add it back, just wanted to get this disucussion going.

> And the paddings / reserved space should remain for simplicity in
> addressing. Think of pure hw implementations (eg. fpga based host)

How does that help actually ?  Maybe I am missing the FPGA kind of
background to see what you are able to se here.

Keeping the config without any unwanted padding (where doesn't
really optimize access) is useful for efficient access. For example I
would like to
read/write the entire config in just one go, lets say in Linux. But
this extra padding of
24 bytes in your structure makes it inefficient. I don't see similar
stuff (or maybe I missed
it) for other protocols and so it may be helpful if you can share some
of the benefits.

> > +\begin{description}
> > +\item[\field{name}] is a null-terminated string that represents the name of the
> > +    GPIO controller.
>
> Please also add that unused chars shall be zero.

Right

> And it's allowed to use
> the full 32 bytes (w/o trailing zero). Host needs to do bound checks
> anyways.

Why is that important, I rather think it should be null-terminated. 31
characters are more
than sufficient for the name?

> > +\subsection{Device Operation}\label{sec:Device Types / GPIO Device / Device Operation}
> > +
> > +The operations of a virtio GPIO device are almost always driven by the guest.
> > +The guest initiates one of the requests from \field{VIRTIO_GPIO_REQ_*} on the
> > +\field{command} virtqueue and the host responds synchronously on the same
> > +virtqueue with a response message. The host initiates an operation
> > +(\field{VIRTIO_GPIO_IRQ_EVENT}) only for reporting the detection of an interrupt
> > +on a GPIO line and uses the \field{interrupt} virtqueue for the same.
> > +
> > +\begin{lstlisting}
> > +/* GPIO request types */
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
> > +\end{lstlisting}
>
> Did you miss VIRTIO_GPIO_MSG_REPLY mask ?

I felt it isn't required.

> This is important to differenciate between request and response. In real
> hardware it's a matter of just a few gates. We only have one queue for
> request and response.

This specification is a bit different from the one you sent earlier.
In this one, what
I propose is that we use only 1 vq for any synchronous transfers.

i.e. guest will send a request (like set direction), and host will reply on the
same vq with a response. This happens on the "command" vq. There is no
need of a REQ/RESPONSE type here then. The response is there for the last
sent request only.

> > +\subsubsection{Device Operation: Request Queue}\label{sec:Device Types / GPIO Device / Device Operation: Request Queue}
> > +
> > +The communication between the host and the guest take place using a pair of
> > +request and response messages. The virtio GPIO specification defines two request
> > +and two response layouts. The particular request/response pair used for each
> > +GPIO request type is specific later in the request specific sections.
> > +
> > +Supported request and response types:
> > +
> > +\begin{lstlisting}
> > +/* Virtio GPIO Request */
> > +struct virtio_gpio_request {
> > +        u16 type;
> > +        u16 gpio;
>
> why not calling it "pin" ?

It is more like a nomenclature to call a gpio line or gpio pin as "gpio" and so
I used it.

Also I looked at another specification while doing so [1], which few kernel
developers including Greg KH, which was developed for Google's project ARA.

It is already part of Linux as well.

> > +        u8 data;
> > +} __attribute__((packed));
> > +
> > +/* Virtio GPIO Response */
> > +struct virtio_gpio_response {
> > +        u8 status;
> > +        u8 data;
> > +};
> > +\end{lstlisting}
>
> Please don't change that. I've got hard reasons for having one frame
> layout for both directions: simplicity, especially for pure hardware
> implementation. Saves a lot of gates that way. HW only needs one
> physical buffer (eg. register memory) for request/response (another
> one for interrupt). It only changes some register bits when necessary
> and then hands back to the bus IO unit. No additional, request type
> specific copying and transformation necessary.

Hmm, I understand what you are saying here, but I feel that the specification
should just do the right thing and do only what is necessary.

Adding two more fields for (size doesn't matter), like GPIO and Type in
response looks fishy to me, because the response doesn't need that.

I understand it will make it a bit inefficient in your case, but adding those
may make it inefficient for other use cases. The specificaiton should be
OS and hardware independent and should do just the right thing.

Maybe I am wrong here.

Does anyone from virtio side have a say in this kind of situation ?
Is this how we write virtio spec in general ?

> (when doing the same via an serial link, it wouldn't take much more
> than some latches and shift registers)
>
> > +/* Possible values of the status field */
> > +#define VIRTIO_GPIO_STATUS_OK                   0x0
> > +#define VIRTIO_GPIO_STATUS_ERR                  0x1
> > +\end{lstlisting}
>
> Do we really need an explicit error reporting ?
> I just don't recall any real gpio hardware that does this.

Yes. This isn't about hardware really, but software. This protocol is required
to establish connection between two operating systems, guests/hosts and they
need to know if something failed or not. Like in Linux you will be rqeuired to
propagate if changing the diretion passed or not.

> > +\subsubsection{Device Operation: Get Direction}\label{sec:Device Types / GPIO Device / Device Operation / Get Direction }
> > +
> > +The \field{VIRTIO_GPIO_REQ_GET_DIRECTION} request is initiated by the guest to
>
> Instead of "guest" we should call it "device", since virtio is also
> meant for real hardware devices.

Sure.

> > +\subsubsection{Device Operation: IRQ Type}\label{sec:Device Types / GPIO Device / Device Operation / IRQ Type }
> > +
> > +The \field{VIRTIO_GPIO_REQ_IRQ_TYPE} request is initiated by the guest to
> > +request the host to set the IRQ trigger type (one of
> > +\field{VIRTIO_GPIO_IRQ_TYPE_*}) for a GPIO line configured for input. The guest
> > +sends the \field{struct virtio_gpio_request} to the host, with the IRQ trigger
> > +type set in the \field{data} field, and the host responds with \field{struct
> > +virtio_gpio_response}. The responds doesn't use the \field{data} field.
> > +
> > +\subsubsection{Device Operation: IRQ Mask}\label{sec:Device Types / GPIO Device / Device Operation / IRQ Mask }
> > +
> > +The \field{VIRTIO_GPIO_REQ_IRQ_MASK} request is initiated by the guest to
> > +request the host to mask the specified GPIO line for interrupts. The guest sends
> > +the \field{struct virtio_gpio_request} to the host, and the host responds with
> > +\field{struct virtio_gpio_response}. Neither the request, nor the response uses
> > +the \field{data} field.
>
> Note that not all hw does support IRQs. Some only per bank, others per
> line. hmm, we should add some flags for that in the device config space.

Yes, I will add something for that then.

> > +\devicenormative{\subsubsection}{Device Operation}{Device Types / GPIO Device / Device Operation}
> > +
> > +A device MUST set the \field{status} field to \field{VIRTIO_GPIO_STATUS_OK} for
> > +all successful requests.
>
> Actually I wonder which HW does report errors and what errors that
> exactly could be.

Hardware doesn't, but we need here for software.

Thanks for your feedback Enrico.

--
Viresh

[1]  https://github.com/projectara/greybus-spec/blob/master/source/bridged_phy.rst#gpio-protocol

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

