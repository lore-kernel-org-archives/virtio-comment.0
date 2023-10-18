Return-Path: <virtio-comment-return-7818-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FB4CDB482
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 14:54:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CF9D1749F1
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 14:54:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3D449868B4
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 14:54:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 882D99868A7; Wed, 18 Oct 2023 14:54:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 77CF09868A8
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 14:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697640896; x=1698245696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEPCWa/zfCWpZuip10/ur8Aqjw0PKOjjXDqiGWP0IRI=;
        b=h8F3DC2an+bZEZJnrndqfriKbM8IWQIU5YJq/BK6GlhacouEMXF8asYGqu6x/8rICN
         aV92WPbNp7QD4vm1xcmchJ5z3RE4OdGVVGR8PseA6Jkrxflxl0gm/wtHHBS9PXtla1yi
         jGc6SFRh771W1AUmPEWChUoZK6PLwYicReZsmv1FWEog/oWpEp/K1idHDr9L2WwTnYGY
         aoBjWgpyh1swD7LFFllEYYcnIMWqNfD+KIFQdN8FokY+heO2wNRfOQMytMvaUAtiKuUA
         BS16QkQxuiPoqsKq2NuQPo0Ct3Qf9r76dFOYMbtnx68tkKoJtVcHip4pFTuNqqx6Oq5S
         V+3Q==
X-Gm-Message-State: AOJu0YyT9T+/74I3Kb70xOBSMR06eg8wGyuEr+FJgKByfaVZnqXU8N9X
	BdTPM/YiNhdXsGCUhBr+VkoDPQ==
X-Google-Smtp-Source: AGHT+IFjtfw3VvKXgp3MbJAOTmMaVzPGlBV7vQZ93zRZsJyMD5GG0sIvQ1IoHdU54xMwoI81PL03+g==
X-Received: by 2002:adf:f349:0:b0:32d:c0c9:f661 with SMTP id e9-20020adff349000000b0032dc0c9f661mr5356277wrp.51.1697640896209;
        Wed, 18 Oct 2023 07:54:56 -0700 (PDT)
Date: Wed, 18 Oct 2023 15:55:01 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Tina Zhang <tina.zhang@intel.com>
Cc: virtio-comment@lists.oasis-open.org, vivek.gautam@arm.com,
	seb@rivosinc.com, sameo@rivosinc.com, eric.auger@redhat.com,
	kevin.tian@intel.com, "Kumar, Sanjay K" <sanjay.k.kumar@intel.com>
Message-ID: <20231018145501.GB1229555@myrica>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
 <20231006160947.2227396-8-jean-philippe@linaro.org>
 <b905a036-199c-47b7-ab51-4c31f39193a1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b905a036-199c-47b7-ab51-4c31f39193a1@intel.com>
Subject: [virtio-comment] Re: [PATCH v2 5/9] virtio-iommu: Add VT-d IO page table

Hi Tina,

Thank you for the review

On Wed, Oct 11, 2023 at 07:32:01PM +0800, Tina Zhang wrote:
> Resend the reply and CC virtio-comment list.
> 
> Hi,
> 
> On 10/7/23 00:09, Jean-Philippe Brucker wrote:
> > From: Tina Zhang <tina.zhang@intel.com>
> > 
> > Allow a driver of a device behind virtio-iommu to detect support for
> > VT-d IO page table.
> > 
> > The driver detects support for VT-d IO page table format in a PROBE
> > request and sends an ATTACH_TABLE request with a pointer to the first
> > stage page translation table.
> > 
> > The definition of first stage page translation table ATTACH_TABLE
> > request references the fields defined in VT-d scalable-mode PASID table
> > entry.
> > * attributes defined in ATTACH_TABLE request:
> >    FSPTPTR got from pgtbl_addr field.
> >    SRE/EAFE/WPE defined in pgtbl_flags field.
> >    FSPM calculated through addr_width field.
> >    PASID got from pasid field.
> > 
> > * attributes not defined in ATTACH_TABLE request, as their
> >    configurations need to be decided by host:
> >    Memory type features, PAT/EMTE/CD/PGSNP/PWSNP.
> >    Snoop Behavior, PGSNP/PWSNP.
> > 
> > Support for any new attributes could easily be added by adding flags to
> > the PROBE property and fields in the ATTACH_TABLE config.
> > 
> > Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> > [JPB: moved to pgtable-intel.tex, rework formatting]
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >   device-types/iommu/description.tex   |  3 +
> >   device-types/iommu/pgtable-intel.tex | 98 ++++++++++++++++++++++++++++
> >   introduction.tex                     |  3 +
> >   3 files changed, 104 insertions(+)
> >   create mode 100644 device-types/iommu/pgtable-intel.tex
> > 
> > diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
> > index c057cdf..a4eb492 100644
> > --- a/device-types/iommu/description.tex
> > +++ b/device-types/iommu/description.tex
> > @@ -407,6 +407,7 @@ \subsubsection{ATTACH_TABLE request}\label{ref:Device Types / IOMMU Device / Dev
> >   };
> >   #define VIRTIO_IOMMU_ATTACH_TABLE_ARM_SMMU3       1
> > +#define VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT        2
> >   \end{lstlisting}
> >   Attach an endpoint to a domain, in the same way as an ATTACH
> > @@ -1009,6 +1010,7 @@ \subsubsection{PROBE properties}\label{sec:Device Types / IOMMU Device / Device
> >   \begin{lstlisting}
> >   #define VIRTIO_IOMMU_PROBE_T_RESV_MEM       1
> >   #define VIRTIO_IOMMU_PROBE_T_HW_ARM_SMMU3   2
> > +#define VIRTIO_IOMMU_PROBE_T_HW_INTEL_VTD   3
> >   \end{lstlisting}
> >   \paragraph{Property RESV_MEM}\label{sec:Device Types / IOMMU Device / Device operations / PROBE properties / RESVMEM}
> > @@ -1160,3 +1162,4 @@ \subsubsection{Fault reporting}\label{sec:Device Types / IOMMU Device / Device o
> >   \subsection{Acceleration}\label{sec:Device Types / IOMMU Device / Acceleration}
> >   \input{device-types/iommu/pgtable-arm}
> > +\input{device-types/iommu/pgtable-intel}
> > diff --git a/device-types/iommu/pgtable-intel.tex b/device-types/iommu/pgtable-intel.tex
> > new file mode 100644
> > index 0000000..90a3410
> > --- /dev/null
> > +++ b/device-types/iommu/pgtable-intel.tex
> > @@ -0,0 +1,98 @@
> > +\subsubsection{Intel VT-d tables}\label{sec:Device Types / IOMMU Device / Acceleration / Intel}
> > +
> > +Attach first-level translation tables in the format described by
> > +the \hyperref[intro:VT-Directed-IO]{Intel Virtualization
> > +Technology for Directed I/O specification}.
> > +
> > +\paragraph{PROBE property for VT-d page tables}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / PROBE}
> > +
> > +The PROBE property VIRTIO_IOMMU_PROBE_T_HW_INTEL_VTD provides
> > +information about an Intel VT-d IOMMU.
> > +
> > +\begin{lstlisting}
> > +struct virtio_iommu_probe_hw_intel_vtd {
> > +  struct virtio_iommu_probe_property head;
> > +  u8   reserved[4];
> > +  le64 cap_reg;
> > +  le64 ecap_reg;
> > +};
> > +
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_RWBF        (1 << 4)
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_SAGAW_SHIFT 8
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_SAGAW_MASK  0x1f
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_MGAW_SHIFT  16
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_MGAW_MASK   0x1f
> The size of MGAW is 6 bits. So, it should be:
> #define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_MGAW_MASK   0x3f

Good catch, thanks

> 
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_ZLR         (1 << 22)
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_FL1GP       (1 << 56)
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_5LP         (1 << 60)
> > +
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_SC         (1 << 7)
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_MTS        (1 << 25)
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_EAFS       (1 << 34)
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_PSS_SHIFT  35
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_PSS_MASK   0x1f
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_SMTS       (1 << 43)
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_VCS        (1 << 44)
> I don't think we need VCS defined here any more. In the old design, VCS was
> used as a channel for guest asking host to allocate a PASID for it. In the
> current design, we drop this and let host mediate guest PASIDs when
> necessary (which is agnostic to guest viommu driver). So basically, there
> are two cases:
> 1) For device assignment of I/O device, the PASIDs of the device are managed
> by guest. Host doesn't need to do any mediation.
> 2) For I/O Device sharing case, one device is used by multiple guests. So we
> cannot let one guest directly manage the PASIDs of that device. In this
> case, with the help of virtualization, host can trap the guest's first DMA
> access requiring a PASID and assign a host-side PASID for it. Guest viommu
> driver doesn't need to know the host-side PASID value.

Makes sense, I'll drop VCS

> 
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_SMPWC      (1 << 48)
> > +\end{lstlisting}
> I think two more definitions are needed:
> #define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_NEST    (1 << 26)
> #define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_FSTS    (1 << 47)
> 
> The ECAP_NEST tells if VT-d hardware supports nested translations.
> The ECAP_FSTS tells if VT-d hardware supports PASID granular translation
> type of first-stage.

It doesn't hurt to add them. Would the guest behave differently if NEST or
FSTS is set or clear?  I didn't add them because I assumed NEST is a
prerequisite for supporting guest page tables, and it requires FSTS. 

More generally there are several ways we could describe these registers in
the specification:

(1) Don't describe any fields.
(2) Describe only fields that directly influence the configuration of
    ATTACH_TABLE and INVALIDATE.
(3) Describe fields related in any way to page table support.
(4) Describe all fields.

(1) is the easiest from a spec point of view. I tried doing (2) to ease
writing driver and device code, but without explaining in detail what the
fields mean because I think that's best left to the hardware
specification. (3) would include NEST, FSTS and possibly others. (4)
wouldn't really be useful, we may as well do (1).

Maybe (3) is better. This way the device can use this description to
sanitize the registers before passing them to the guest, and the values
read by the guest still make sense. Because if we only describe (2), and
then the device decides to only provide those bits and clear everything
else, then it may be confusing for the driver to find NEST and FSTS clear
in the cap registers. Should it then even attach tables?  Maybe in the
future there will be a use-case for presenting NEST and FSTS clear to the
guest.

> > +
> > +\todo{check that these are necessary and sufficient to support
> > +page table assignement in scalable mode.}
> The cap_reg & ecap_reg expose VT-d hardware capability to guest. And it's
> expected to have virtio-iommu working with VT-d IO page table when the
> platform hardware at least has the capability of nested-translation (i.e.,
> hardware must have scalable mode support and first-stage translation support
> and second-stage translation support.). So, we only pick definitions of the
> bits from VT-d spec which are related to the first-stage page table and the
> basic capability of nested-translation.
> 
> > +\todo{Need to support non-PASID assignment? non-scalable?}
> I didn't see any difference between the non-PASID assignment case and the
> PASID assignment case, in terms of virtio-iommu support VT-d. Any ideas?

No, I don't remember what I meant by this... I think non-PASID (for
requests-without-PASID) is already supported in this draft.

> 
> The non-scalable doesn't seem so interesting right now. Any thoughts about
> it?

Agree, if needed it could be added later.

> 
> > +
> > +\begin{description}
> > +  \item[\field{cap_reg}] Capability Register.
> > +  \item[\field{ecap_reg}] Extended Capability Register.
> > +\end{description}
> > +
> > +\paragraph{ATTACH_TABLE request for VT-d page table}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / ATTACH_TABLE}
> > +
> > +Attach a single set of page tables to an endpoint.
> > +
> > +\begin{lstlisting}
> > +/* Vt-d I/O Page Table Descriptor */
> > +struct virtio_iommu_req_attach_table_intel {
> > +  struct virtio_iommu_req_head          head;
> > +  le32                                  domain;
> > +  le32                                  endpoint;
> > +  u8                                    format;
> > +  u8                                    reserved[7];
> > +  le32                                  pasid;
> > +  le64                                  pgtbl_addr;
> > +  le64                                  pgtbl_flags;
> > +  le32                                  addr_width;
> > +  u8                                    reserved[80];
> > +  struct virtio_iommu_req_tail          tail;
> > +};
> > +
> > +/* Intel VT-d stage-1 page table entry attributes */
> > +#define	VIRTIO_IOMMU_HW_INTEL_VTD_SRE             0x01
> > +#define	VIRTIO_IOMMU_HW_INTEL_VTD_EAFE            0x02
> > +#define	VIRTIO_IOMMU_HW_INTEL_VTD_WPE             0x40
> > +#define	VIRTIO_IOMMU_HW_INTEL_VTD_LAST            0x80
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +  \item[\field{format}] VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT.
> > +  \item[\field{pasid}] Process Address Space Identifier.
> > +    \todo{don't we need to allocate these with alloc/free
> > +    commands to the host?}
> No, we don't need guest viommu driver to explicitly ask host's help for
> guest PASID alloc/free now. In the current design, guest viommu driver
> doesn't need to know the host-side PASID.

Ok, that makes the interface simpler

Thanks,
Jean

> 
> Regards,
> -Tina
> 
> > +  \item[\field{pgtbl_addr}] Stage-1 page table base address.
> > +  \item[\field{pgtbl_flags}] Stage-1 page table entry attributes:
> > +    \begin{description}
> > +      \item{SRE} Supervisor request,
> > +      \item{EAFE} Extended access enable,
> > +      \item{WPE} Write protect enable.
> > +    \end{description}
> > +  \item[\field{pat}] Page attribute table data to compute
> > +    effective memory type.
> > +  \item[\field{addr_width}] The address width of the untranslated
> > +    addresses that are subjected to the stage-1 page table.
> > +\end{description}
> > +
> > +\paragraph{INVALIDATE request for VT-d page table}\label{sec:Device Types / IOMMU Device / Acceleration / Intel / INVALIDATE}
> > +
> > +Supported values for field \field{scope} are
> > +VIRTIO_IOMMU_INVAL_S_PASID and VIRTIO_IOMMU_INVAL_S_ADDRESS.
> > +The only supported value for field \field{caches} is
> > +VIRTIO_IOMMU_INVAL_C_TLB. Field \field{id} is not used.
> > diff --git a/introduction.tex b/introduction.tex
> > index 636fb1b..d0d5086 100644
> > --- a/introduction.tex
> > +++ b/introduction.tex
> > @@ -104,6 +104,9 @@ \section{Normative References}\label{sec:Normative References}
> >   	\phantomsection\label{intro:SMMUv3}\textbf{[SMMUv3]} &
> >   	Arm System Memory Management Unit version 3
> >   	\newline\url{https://developer.arm.com/documentation/ihi0070/latest} \\
> > +	\phantomsection\label{intro:VT-Directed-IO}\textbf{[VT-Directed-IO]} &
> > +	Intel Virtualization Technology for Directed I/O
> > +	\newline\url{https://cdrdv2.intel.com/v1/dl/getContent/671081} \\
> >   	\phantomsection\label{intro:rfc2784}\textbf{[RFC2784]} &
> >       Generic Routing Encapsulation. This protocol is only specified for IPv4 and used as either the payload or delivery protocol.

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

