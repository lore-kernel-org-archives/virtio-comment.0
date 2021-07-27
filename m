Return-Path: <virtio-comment-return-2076-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 944699863B2
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Jul 2021 15:07:01 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20210727042907.24315-2-tstark@linux.microsoft.com>
References: <20210727042907.24315-1-tstark@linux.microsoft.com>
 <20210727042907.24315-2-tstark@linux.microsoft.com>
Date: Tue, 27 Jul 2021 17:06:43 +0200
Message-ID: <87fsvz4wzg.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v2 1/1] virtio-pmem: Support describing pmem as shared
 memory region
Content-Type: text/plain
To: tstark@linux.microsoft.com, virtio-comment@lists.oasis-open.org
Cc: grahamwo@microsoft.com, benhill@microsoft.com, mst@redhat.com, pankaj.gupta@ionos.com, tstark@microsoft.com, david@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jul 26 2021, tstark@linux.microsoft.com wrote:

> @@ -50,12 +53,29 @@ \subsection{Device Initialization}\label{sec:Device Types / PMEM Device / Device
>  File backed memory SHOULD be memory mapped to guest address space with SHARED
>  memory mapping.
>  
> +If VIRTIO_PMEM_F_SHMEM_REGION has been negotiated, the device MUST indicate the
> +guest physical address as a shared memory region. The device MUST use shared
> +memory region ID 0. The device SHOULD set \field{start} and \field{size} to zero.
> +
> +If VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated, the device MUST indicate
> +the guest physical address as a guest absolute address. The device MUST set
> +\field{start} to the absolute address and \field{size} to the size of the
> +address range, in bytes.
> +
>  \subsection{Driver Initialization}\label{sec:Device Types / PMEM Driver / Driver Initialization}
>  
>  Driver hotplugs the physical memory and registers associated
>  region with the pmem API. Also, configures a flush callback
>  function with the corresponding region.
>  
> +\drivernormative{\subsubsection}{Driver Initialization}{Device Types / PMEM Driver / Driver Initialization}
> +
> +The driver SHOULD query the physical address ranges where the pmem was mapped.

Isn't the driver quite useless if it doesn't discover where the pmem can
be found? I'm not sure we need that sentence.

> +If VIRTIO_PMEM_F_SHMEM_REGION has been negotiated, the driver SHOULD query
> +shared memory ID 0 for the physical address ranges and MUST NOT use \field{start}
> +or \field{size}. Else, the driver SHOULD read the physical address ranges from
> +\field{start} and \field{size}.

'SHOULD' is probably not the right way to specify this. What about the
following:

"In order to discover the physical address ranges where the pmem was
mapped:

If VIRTIO_PMEM_F_SHMEM_REGION has been negotiated, the driver MUST query
shared memory ID 0 for the physical address ranges, and MUST NOT use
\field{start} or \field{stop}.

If VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated, the driver MUST
read the physical address ranges from \field{start} and \field{stop}."

> +
>  \drivernormative{\subsubsection}{Driver Initialization: Filesystem direct access}{Device Types / PMEM Driver / Driver Initialization / Direct access}
>  
>  Driver SHOULD enable filesystem direct access operations for


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

