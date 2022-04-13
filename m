Return-Path: <pasic@linux.ibm.com>
Date: Wed, 13 Apr 2022 14:51:41 +0200
From: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [virtio] [PATCH] iommu: offered -> negotiated
Message-ID: <20220413145141.3ec976d0.pasic@linux.ibm.com>
In-Reply-To: <20220412083059.86367-1-cohuck@redhat.com>
References: <20220412083059.86367-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, 12 Apr 2022 10:30:59 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> All those clauses actually apply whenever the feature is negotiated,

Not sure "only apply" or "also apply". If it is also apply, then
we are actually making a change that imposes further requirements
on the driver.

> not merely offered. Rename to clarify things.

I'm not sure this is a mere clarification. I'm pretty sure, to
me it was not clear that 'offered' actually means 'negotiated'
in this context.

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

Here 'offered' might actually make sense. With offered, doing
an early config space access on domain_range is permissible, if not
then the driver should not read domain_range before features are fully
negotiated.

One could implement the device in a way, that when it offers the feature,
it just presents the value.

>    \field{domain_range} describes the values supported in a \field{domain}
> -  field. If the feature is not offered, any \field{domain} value is valid.
> +  field. If the feature is not negotiated, any \field{domain} value is valid.

Let's be very careful here! The new version does not make sense to me
while the old one does. Here is why:

Whether the feature F_DOMAIN_RANGE is offered or not is under the control
of the device. So it is completely sane to say: if the device supports
any value it I guess can decide to not offer the feature, or to write 
le32_min and le_32_max into the corresponding fields. BTW are those
fields really signed?

But the interesting case is, what if the device does not support
arbitrary values, for domain, but let us say just the values 0, 1, 2, 3?

With the new version the driver can just decide to not negotiate 
F_DOMAIN_RANGE, and then because the feature is not negotiated, any
domain value is valid according to the above. The only way out of that
is, to say that the device should fail feature negotiation if the
feature was offered, but not accepted, and there are invalid domain
values.

What I'm trying to say is: the old version was more straight forward to
me, and if we do insist on sticking to the new version, we should
probably spell out that the device is expected to fail feature
negotiation if this feature is not accepted by the driver.

>  
> -\item If the VIRTIO_IOMMU_F_INPUT_RANGE feature is offered,
> +\item If the VIRTIO_IOMMU_F_INPUT_RANGE feature is negotiated,

This one is similar I guess.

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

Again makes no sense...

>      \begin{itemize}
>        \item config field \field{bypass} is 1 and the endpoint is
>          not attached to a domain. This applies even if the driver

... the rest of the sentence goes "does not accept the
VIRTIO_IOMMU_F_BYPASS_CONFIG feature". If the feature was negotiated,
then the device has offered it and the driver has accepted it by
definition!

Regards,
Halil

