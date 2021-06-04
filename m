Return-Path: virtio-comment-return-1882-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 53117986575
	for <virtio-comment@lists.oasis-open.org>; Fri,  4 Jun 2021 12:25:43 +0000 (UTC)
References: <e687cd6bdafe1ad13205d99989163299649e20c9.1622794175.git.viresh.kumar@linaro.org>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <db7ad3b4-36b5-1988-8f9a-b50a7e820150@metux.net>
Date: Fri, 4 Jun 2021 14:25:39 +0200
MIME-Version: 1.0
In-Reply-To: <e687cd6bdafe1ad13205d99989163299649e20c9.1622794175.git.viresh.kumar@linaro.org>
Subject: Re: [virtio-comment] [PATCH V2] virtio-gpio: add the device
 specification
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: quoted-printable
To: Viresh Kumar <viresh.kumar@linaro.org>, virtio-comment@lists.oasis-open.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 04.06.21 10:09, Viresh Kumar wrote:

Hi,

> virtio-gpio is a virtual GPIO controller. It provides a way to flexibly
> communicate with the host GPIO controllers from the guest.
>=20
> This patch adds the specification for it.

thanks for your input :)

<snip>

> +\begin{lstlisting}
> +struct virtio_gpio_config {
> +    char name[32];
> +    u16 ngpio;
> +    u16 padding;
> +    u32 gpio_names_size;
> +    char gpio_names[0];
> +} __attribute__((packed));
> +\end{lstlisting}

oh no, please don't change the structs. the original one was:

struct virtio_gpio_config {
         __u8    version;
         __u8    reserved0;
         __u16   num_gpios;
         __u32   names_size;
         __u8    reserved1[24];
         __u8    name[32];
};

The version is vital - we need an upgrade path for future extensions.
(eg. bulk operations)

And the paddings / reserved space should remain for simplicity in
addressing. Think of pure hw implementations (eg. fpga based host)

> +\begin{description}
> +\item[\field{name}] is a null-terminated string that represents the name=
 of the
> +    GPIO controller.

Please also add that unused chars shall be zero. And it's allowed to use
the full 32 bytes (w/o trailing zero). Host needs to do bound checks
anyways.

> +\subsection{Device Operation}\label{sec:Device Types / GPIO Device / Dev=
ice Operation}
> +
> +The operations of a virtio GPIO device are almost always driven by the g=
uest.
> +The guest initiates one of the requests from \field{VIRTIO_GPIO_REQ_*} o=
n the
> +\field{command} virtqueue and the host responds synchronously on the sam=
e
> +virtqueue with a response message. The host initiates an operation
> +(\field{VIRTIO_GPIO_IRQ_EVENT}) only for reporting the detection of an i=
nterrupt
> +on a GPIO line and uses the \field{interrupt} virtqueue for the same.
> +
> +\begin{lstlisting}
> +/* GPIO request types */
> +#define VIRTIO_GPIO_REQ_ACTIVATE                0x01
> +#define VIRTIO_GPIO_REQ_DEACTIVATE              0x02
> +#define VIRTIO_GPIO_REQ_GET_DIRECTION           0x03
> +#define VIRTIO_GPIO_REQ_DIRECTION_IN            0x04
> +#define VIRTIO_GPIO_REQ_DIRECTION_OUT           0x05
> +#define VIRTIO_GPIO_REQ_GET_VALUE               0x06
> +#define VIRTIO_GPIO_REQ_SET_VALUE               0x07
> +#define VIRTIO_GPIO_REQ_IRQ_TYPE                0x08
> +#define VIRTIO_GPIO_REQ_IRQ_MASK                0x09
> +#define VIRTIO_GPIO_REQ_IRQ_UNMASK              0x0a
> +#define VIRTIO_GPIO_IRQ_EVENT                   0x0b
> +\end{lstlisting}

Did you miss VIRTIO_GPIO_MSG_REPLY mask ?

This is important to differenciate between request and response. In real
hardware it's a matter of just a few gates. We only have one queue for
request and response.

> +\subsubsection{Device Operation: Request Queue}\label{sec:Device Types /=
 GPIO Device / Device Operation: Request Queue}
> +
> +The communication between the host and the guest take place using a pair=
 of
> +request and response messages. The virtio GPIO specification defines two=
 request
> +and two response layouts. The particular request/response pair used for =
each
> +GPIO request type is specific later in the request specific sections.
> +
> +Supported request and response types:
> +
> +\begin{lstlisting}
> +/* Virtio GPIO Request */
> +struct virtio_gpio_request {
> +        u16 type;
> +        u16 gpio;

why not calling it "pin" ?

> +        u8 data;
> +} __attribute__((packed));
> +
> +/* Virtio GPIO Response */
> +struct virtio_gpio_response {
> +        u8 status;
> +        u8 data;
> +};
> +\end{lstlisting}

Please don't change that. I've got hard reasons for having one frame
layout for both directions: simplicity, especially for pure hardware
implementation. Saves a lot of gates that way. HW only needs one
physical buffer (eg. register memory) for request/response (another
one for interrupt). It only changes some register bits when necessary
and then hands back to the bus IO unit. No additional, request type
specific copying and transformation necessary.

(when doing the same via an serial link, it wouldn't take much more
than some latches and shift registers)

> +/* Possible values of the status field */
> +#define VIRTIO_GPIO_STATUS_OK                   0x0
> +#define VIRTIO_GPIO_STATUS_ERR                  0x1
> +\end{lstlisting}

Do we really need an explicit error reporting ?
I just don't recall any real gpio hardware that does this.

> +\subsubsection{Device Operation: Get Direction}\label{sec:Device Types /=
 GPIO Device / Device Operation / Get Direction }
> +
> +The \field{VIRTIO_GPIO_REQ_GET_DIRECTION} request is initiated by the gu=
est to

Instead of "guest" we should call it "device", since virtio is also
meant for real hardware devices.

> +\subsubsection{Device Operation: IRQ Type}\label{sec:Device Types / GPIO=
 Device / Device Operation / IRQ Type }
> +
> +The \field{VIRTIO_GPIO_REQ_IRQ_TYPE} request is initiated by the guest t=
o
> +request the host to set the IRQ trigger type (one of
> +\field{VIRTIO_GPIO_IRQ_TYPE_*}) for a GPIO line configured for input. Th=
e guest
> +sends the \field{struct virtio_gpio_request} to the host, with the IRQ t=
rigger
> +type set in the \field{data} field, and the host responds with \field{st=
ruct
> +virtio_gpio_response}. The responds doesn't use the \field{data} field.
> +
> +\subsubsection{Device Operation: IRQ Mask}\label{sec:Device Types / GPIO=
 Device / Device Operation / IRQ Mask }
> +
> +The \field{VIRTIO_GPIO_REQ_IRQ_MASK} request is initiated by the guest t=
o
> +request the host to mask the specified GPIO line for interrupts. The gue=
st sends
> +the \field{struct virtio_gpio_request} to the host, and the host respond=
s with
> +\field{struct virtio_gpio_response}. Neither the request, nor the respon=
se uses
> +the \field{data} field.

Note that not all hw does support IRQs. Some only per bank, others per
line. hmm, we should add some flags for that in the device config space.

> +\devicenormative{\subsubsection}{Device Operation}{Device Types / GPIO D=
evice / Device Operation}
> +
> +A device MUST set the \field{status} field to \field{VIRTIO_GPIO_STATUS_=
OK} for
> +all successful requests.

Actually I wonder which HW does report errors and what errors that=20
exactly could be.


--mtx

--=20
---
Hinweis: unverschl=C3=BCsselte E-Mails k=C3=B6nnen leicht abgeh=C3=B6rt und=
 manipuliert
werden ! F=C3=BCr eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schl=C3=BCssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

