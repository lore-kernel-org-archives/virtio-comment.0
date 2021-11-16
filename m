Return-Path: <virtio-comment-return-2353-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 252B0986410
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Nov 2021 00:31:57 +0000 (UTC)
MIME-Version: 1.0
References: <20211110185555.190-1-tstark@linux.microsoft.com> <20211110185555.190-2-tstark@linux.microsoft.com>
In-Reply-To: <20211110185555.190-2-tstark@linux.microsoft.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Tue, 16 Nov 2021 01:31:44 +0100
Message-ID: <CAM9Jb+hm7ppARHsHsWyMKjDB1VYx2O=qD06m7UsyXapQ3gvu3A@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH v5 1/1] virtio-pmem: Support describing pmem as shared
 memory region
Content-Type: text/plain; charset="UTF-8"
To: Taylor Stark <tstark@linux.microsoft.com>
Cc: virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, tstark@microsoft.com
List-ID: <virtio-comment.lists.oasis-open.org>

> Update the virtio-pmem spec to add support for describing the pmem region as a
> shared memory window. This is required to support virtio-pmem in Hyper-V, since
> Hyper-V only allows PCI devices to operate on memory ranges defined via BARs.
> When using the virtio PCI transport, shared memory regions are described via
> PCI BARs.
>
> Signed-off-by: Taylor Stark <tstark@microsoft.com>
> ---
>  conformance.tex | 14 ++++++++++++--
>  virtio-pmem.tex | 40 +++++++++++++++++++++++++++++++++-------
>  2 files changed, 45 insertions(+), 9 deletions(-)
>
> diff --git a/conformance.tex b/conformance.tex
> index 80547db..d9f2b45 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -31,8 +31,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \ref{sec:Conformance / Driver Conformance / Sound Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / Memory Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conformance},
> -\ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance} or
> -\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance}.
> +\ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance} or
> +\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}.
>
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>    \end{itemize}
> @@ -314,6 +315,14 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{drivernormative:Device Types / GPIO Device / eventq Operation}
>  \end{itemize}
>
> +\conformance{\subsection}{PMEM Driver Conformance}\label{sec:Conformance / Driver Conformance / PMEM Driver Conformance}
> +
> +A PMEM driver MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{drivernormative:Device Types / PMEM Device / Device Initialization}
> +\end{itemize}
> +
>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
>
>  A device MUST conform to the following normative statements:
> @@ -578,6 +587,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  A PMEM device MUST conform to the following normative statements:
>
>  \begin{itemize}
> +\item \ref{devicenormative:Device Types / PMEM Device / Device Initialization}
>  \item \ref{devicenormative:Device Types / PMEM Device / Device Operation / Virtqueue flush}
>  \item \ref{devicenormative:Device Types / PMEM Device / Device Operation / Virtqueue return}
>  \end{itemize}
> diff --git a/virtio-pmem.tex b/virtio-pmem.tex
> index 93ab3c1..384eaa3 100644
> --- a/virtio-pmem.tex
> +++ b/virtio-pmem.tex
> @@ -24,7 +24,10 @@ \subsection{Virtqueues}\label{sec:Device Types / PMEM Device / Virtqueues}
>
>  \subsection{Feature bits}\label{sec:Device Types / PMEM Device / Feature bits}
>
> -There are currently no feature bits defined for this device.
> +\begin{description}
> +\item[VIRTIO_PMEM_F_SHMEM_REGION (0)] The guest physical address range will be
> +indicated as a shared memory region.
> +\end{description}
>
>  \subsection{Device configuration layout}\label{sec:Device Types / PMEM Device / Device configuration layout}
>
> @@ -36,22 +39,45 @@ \subsection{Device configuration layout}\label{sec:Device Types / PMEM Device /
>  \end{lstlisting}
>
>  \begin{description}
> -\item[\field{start}] contains the physical address of the first byte of the persistent memory region.
> +\item[\field{start}] contains the physical address of the first byte of the
> +persistent memory region, if VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated.
>
> -\item[\field{size}] contains the length of this address range.
> +\item[\field{size}] contains the length of this address range, if
> +VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated.
>  \end{description}
>
> +\subsection{Device Initialization}\label{sec:Device Types / PMEM Device / Device Initialization}
> +
> +The device indicates the guest physical address to the driver in one of two ways:
>  \begin{enumerate}
> -\item Driver vpmem start is read from \field{start}.
> -\item Driver vpmem end is read from \field{size}.
> +\item As a guest absolute address, using virtio_pmem_config.
> +\item As a shared memory region.
>  \end{enumerate}
>
> -\subsection{Driver Initialization}\label{sec:Device Types / PMEM Driver / Driver Initialization}
> -
>  The driver determines the start address and size of the persistent memory region in preparation for reading or writing data.
>
>  The driver initializes req_vq in preparation for making flush requests.
>
> +\devicenormative{\subsubsection}{Device Initialization}{Device Types / PMEM Device / Device Initialization}
> +
> +If VIRTIO_PMEM_F_SHMEM_REGION has been negotiated, the device MUST indicate the
> +guest physical address as a shared memory region. The device MUST use shared
> +memory region ID 0. The device SHOULD set \field{start} and \field{size} to zero.
> +
> +If VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated, the device MUST indicate
> +the guest physical address as a guest absolute address. The device MUST set
> +\field{start} to the absolute address and \field{size} to the size of the
> +address range, in bytes.
> +
> +\drivernormative{\subsubsection}{Device Initialization}{Device Types / PMEM Device / Device Initialization}
> +
> +If VIRTIO_PMEM_F_SHMEM_REGION has been negotiated, the driver MUST query
> +shared memory ID 0 for the physical address ranges, and MUST NOT use
> +\field{start} or \field{stop}.
> +
> +If VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated, the driver MUST read the
> +physical address ranges from \field{start} and \field{stop}.
> +
>  \subsection{Driver Operations}\label{sec:Device Types / PMEM Driver / Driver Operation / Request Queues}
>
>  Requests have the following format:

Looks good to me.

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

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

