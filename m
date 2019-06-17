Return-Path: virtio-comment-return-743-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 56609984341
	for <virtio-comment@lists.oasis-open.org>; Mon, 17 Jun 2019 02:37:10 +0000 (UTC)
Date: Sun, 16 Jun 2019 22:37:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190616222843-mutt-send-email-mst@kernel.org>
References: <20190616120137.7835-1-ybettan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190616120137.7835-1-ybettan@redhat.com>
Subject: [virtio-comment] Re: [PATCH] Introducing virtio-increment-edu.
To: Yoni Bettan <ybettan@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, ehabkost@redhat.com, ailan@redhat.com, aadam@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun, Jun 16, 2019 at 03:01:37PM +0300, Yoni Bettan wrote:
> The main goal is to create an educational example to be used as template or
> guideline for contributors when they wish to create a new virtio
> device and to document "the right way" to do so.
> 
> The device functionality is simple as possible so contributors can have
> their focus on the virtio protocol rather on the device functionality to
> give them an "easy start".
> 
> It consists of several parts:
> 
>     1. The device specification
>         * this patch content
> 
>     2. The device implementation for Qemu-KVM hypervisor
>         * it will hopefully be added to the Qemu project
>         * for now it can be found at https://github.com/ybettan/qemu/blob/\
>                 virtio/hw/virtio/virtio-example.c
> 
>     3. The device driver for linux
>         * it will hopefully be added to linux
>         * for now it can be found at https://github.com/ybettan/\
>                 QemuDeviceDrivers/blob/master/virtio/virtio_example_driver.c
> 
>     4. A blog on virtio
>         * introducing the virtio concept
>         * gives some motivation for virtio-devices to be used
>         * bring extra documentation on "how to write":
>             - device specification
>             - device implementation
>             - device driver for linux
>         * it can be found at https://howtovms.wordpress.com
> 
> Signed-off-by: Yoni Bettan <ybettan@redhat.com>
> ---
> 
> 
> Here are some questions I would like to here your opinion on:
> 
>     * do you think such device should be included in the virtio-specification ?

Not necessarily. But I think it's a good excercise and lessons
learned can be added to a spec section explaining how to do this
and what are the common mistakes to avoid.

>     * do you think the documentation for the whole process (spec->device->driver)
>       should be blog (current state) or a github repository so others can
>       contribute to it ?
> 
>     * how does the virtio-ID should be chosen for this device ?
>         - specification says:
>             # "PCI Device ID 0x1000 through 0x107F inclusive is a virtio device"
>             # "The PCI Device ID is calculated by adding 0x1040 to the Virtio
>                Device ID"
>             # under "what device number":
>               "Meanwhile for experimental drivers, use 65535 and work backwards"
>         - those conditions doesn't fit together
> 
> 
>  conformance.tex          | 16 +++++++++++
>  content.tex              |  1 +
>  virtio-increment-edu.tex | 62 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 79 insertions(+)
>  create mode 100644 virtio-increment-edu.tex



> diff --git a/conformance.tex b/conformance.tex
> index 42f702a..66f401a 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -183,6 +183,14 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{drivernormative:Device Types / Socket Device / Device Operation / Device Events}
>  \end{itemize}
>  
> +\conformance{\subsection}{Increment-edu Driver Conformance}\label{sec:Conformance / Driver Conformance / Increment-edu Driver Conformance}
> +
> +An Increment-edu driver MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{drivernormative:Device Types / Increment-edu Device / Device Operation}
> +\end{itemize}
> +
>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
>  
>  A device MUST conform to the following normative statements:
> @@ -336,6 +344,14 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{devicenormative:Device Types / Socket Device / Device Operation / Receive and Transmit}
>  \end{itemize}
>  
> +\conformance{\subsection}{Increment-edu Device Conformance}\label{sec:Conformance / Device Conformance / Increment-edu Device Conformance}
> +
> +An Increment-edu device MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{devicenormative:Device Types / Increment-edu Device / Device Operation}
> +\end{itemize}
> +
>  \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
>  A conformant implementation MUST be either transitional or
>  non-transitional, see \ref{intro:Legacy
> diff --git a/content.tex b/content.tex
> index 193b6e1..be154db 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -5594,6 +5594,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  \input{virtio-input.tex}
>  \input{virtio-crypto.tex}
>  \input{virtio-vsock.tex}
> +\input{virtio-increment-edu.tex}
>  
>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  
> diff --git a/virtio-increment-edu.tex b/virtio-increment-edu.tex
> new file mode 100644
> index 0000000..59fc44a
> --- /dev/null
> +++ b/virtio-increment-edu.tex
> @@ -0,0 +1,62 @@
> +\section{Increment-edu Device}\label{sec:Device Types / Increment-edu Device}
> +
> +The virtio Increment-edu device is a simple virtual incremental device that
> +increment the number represented by its input by 1.
> +Read and write requests are placed in the queue, and serviced
> +(probably out of order) by the device.
> +The main purpose of this device is to be used as a reference for new contributors
> +if they wish to create a new virtio device, therefore, it contains minimum
> +functionality and mostly describe the building blocks of the virtio-protocol.
> +
> +\subsection{Device ID}\label{sec:Device Types / Increment-edu Device / Device ID}
> +  21
> +
> +\subsection{Virtqueues}\label{sec:Device Types / Increment-edu Device / Virtqueues}
> +\begin{description}
> +\item[0] requestq
> +\end{description}
> +
> +\subsection{Feature bits}\label{sec:Device Types / Increment-edu Device / Feature bits}
> +
> +None currently defined.
> +
> +\subsection{Device configuration layout}\label{sec:Device Types / Increment-edu Device / Device configuration layout}
> +
> +None currently defined.
> +
> +\subsection{Device Initialization}\label{sec:Device Types / Increment-edu Device / Device Initialization}
> +
> +\begin{enumerate}
> +\item The virtqueue is initialized
> +\end{enumerate}
> +
> +\subsection{Device Operation}\label{sec:Device Types / Increment-edu Device / Device Operation}
> +
> +When the driver need computation, it places a request that consist of both
> +input and output elements into the queue.
> +The first element is used as an input for the device and contain a 4 bytes
> +integer, and the second is given for the device to fill the result in it as a
> +4 bytes integer indeed.

So this is a problem. Elements are phys contigious chunks. Devices
normally should not make raming requirements thus should not
discuss elements at all.
Saying it's a single element requires 4 bytes a contigious.

What you should say is that driver makes a buffer available.
Buffer consists of 4 device-readable bytes followed by 4
device-writeable bytes.




> +
> +Both the input and the output are in little-endian bytes order.

I'd use a struct to describe the format.

> +
> +The device is increasing this integer by 1, meaning the LSB will be
> +increased by 1 and if needed the carry will be carried to the next byte.
> +
> +If the device get a number that is out of the range of a 4 bytes integer only
> +the lower bytes that fit the size of a 4 bytes integer will represent the input
> +and the upper bytes will be ignored.
> +If the result is out of range then only the lower bytes will be written as
> +result as well.
> +
> +\drivernormative{\subsubsection}{Device Operation}{Device Types / Increment-edu Device / Device Operation}
> +
> +The driver MUST place the 2 elements in the same request (buffer) in order to
> +make a request atomically handled by the device, the first element contains the
> +input and should be read-only and the second should be write-only.
> +
> +\devicenormative{\subsubsection}{Device Operation}{Device Types / Increment-edu Device / Device Operation}
> +
> +The device MUST place the result inside the output element allocated by the
> +driver.


I would describe the behaviour, overflow and such here.

> +
> -- 
> 2.21.0


so as described this can be used by driver to test hypervisor
latency I guess? Can we tweak this so hypervisor can test
guest latency too? That would be a bit more useful ...


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

