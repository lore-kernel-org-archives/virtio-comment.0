Return-Path: <virtio-comment-return-2334-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1A70E9862B5
	for <virtio-comment@lists.oasis-open.org>; Mon,  8 Nov 2021 12:54:35 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20211105201105.2977-2-tstark@linux.microsoft.com>
References: <20211105201105.2977-1-tstark@linux.microsoft.com>
 <20211105201105.2977-2-tstark@linux.microsoft.com>
Date: Mon, 08 Nov 2021 13:54:27 +0100
Message-ID: <87wnlivmd8.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v4 1/1] virtio-pmem: Support describing
 pmem as shared memory region
Content-Type: text/plain
To: tstark@linux.microsoft.com, virtio-comment@lists.oasis-open.org
Cc: grahamwo@microsoft.com, benhill@microsoft.com, tstark@microsoft.com, pankaj.gupta.linux@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Nov 05 2021, tstark@linux.microsoft.com wrote:

> From: Taylor Stark <tstark@microsoft.com>
>
> Update the virtio-pmem spec to add support for describing the pmem region as a
> shared memory window. This is required to support virtio-pmem in Hyper-V, since
> Hyper-V only allows PCI devices to operate on memory ranges defined via BARs.
> When using the virtio PCI transport, shared memory regions are described via
> PCI BARs.
>
> Signed-off-by: Taylor Stark <tstark@microsoft.com>
> ---
>  conformance.tex | 14 ++++++++++++--
>  virtio-pmem.tex | 34 +++++++++++++++++++++++++++++-----
>  2 files changed, 41 insertions(+), 7 deletions(-)

(...)

> @@ -41,17 +44,38 @@ \subsection{Device configuration layout}\label{sec:Device Types / PMEM Device /
>  \item[\field{size}] contains the length of this address range.
>  \end{description}

I wonder whether we should also amend the description of the config
space fields to "contains (...), if VIRTIO_PMEM_F_SHMEM_REGION has not
been negotiated". But maybe that is not really needed.

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

Otherwise, looks good to me.


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

