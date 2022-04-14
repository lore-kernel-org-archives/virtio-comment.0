Return-Path: <virtio-return-3690-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio@lists.oasis-open.org>
List-Post: <mailto:virtio@lists.oasis-open.org>
List-Help: <mailto:virtio-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-subscribe@lists.oasis-open.org>
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220412083059.86367-1-cohuck@redhat.com>
References: <20220412083059.86367-1-cohuck@redhat.com>
Date: Thu, 14 Apr 2022 11:11:06 +0200
Message-ID: <87pmlk81xx.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio] Re: [PATCH] iommu: offered -> negotiated
Content-Type: text/plain
To: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Apr 12 2022, Cornelia Huck <cohuck@redhat.com> wrote:

Hmm... it seems the original proposal had been too buried (or I actually
fat-fingered things in my patch).

What do we do now? Revert, and re-apply a new patch after perhaps some
further discussion? (Would likely be for 1.3, though. Maybe also vote,
as this does not seem to be as straightforward as I thought.)

> All those clauses actually apply whenever the feature is negotiated,
> not merely offered. Rename to clarify things.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  virtio-iommu.tex | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/virtio-iommu.tex b/virtio-iommu.tex
> index f8cbe8895f0d..efe1000ac2d2 100644
> --- a/virtio-iommu.tex
> +++ b/virtio-iommu.tex
> @@ -232,22 +232,22 @@ \subsection{Device operations}\label{sec:Device Types / IOMMU Device / Device op
>    Creating mappings aligned on large page sizes can improve performance
>    since they require fewer page table and TLB entries.
>  
> -\item If the VIRTIO_IOMMU_F_DOMAIN_RANGE feature is offered,
> +\item If the VIRTIO_IOMMU_F_DOMAIN_RANGE feature is negotiated,
>    \field{domain_range} describes the values supported in a \field{domain}
> -  field. If the feature is not offered, any \field{domain} value is valid.
> +  field. If the feature is not negotiated, any \field{domain} value is valid.
>  
> -\item If the VIRTIO_IOMMU_F_INPUT_RANGE feature is offered,
> +\item If the VIRTIO_IOMMU_F_INPUT_RANGE feature is negotiated,
>    \field{input_range} contains the virtual address range that the IOMMU is
>    able to translate. Any mapping request to virtual addresses outside of
>    this range fails.
>  
> -  If the feature is not offered, virtual mappings span over the whole
> +  If the feature is not negotiated, virtual mappings span over the whole
>    64-bit address space (\texttt{start = 0, end = 0xffffffff ffffffff})
>  \end{itemize}
>  
>  An endpoint is in bypass mode if:
>  \begin{itemize}
> -  \item the VIRTIO_IOMMU_F_BYPASS_CONFIG feature is offered and:
> +  \item the VIRTIO_IOMMU_F_BYPASS_CONFIG feature is negotiated and:
>      \begin{itemize}
>        \item config field \field{bypass} is 1 and the endpoint is
>          not attached to a domain. This applies even if the driver
> -- 
> 2.34.1


---------------------------------------------------------------------
To unsubscribe from this mail list, you must leave the OASIS TC that 
generates this mail.  Follow this link to all your TCs in OASIS at:
https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php 

