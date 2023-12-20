Return-Path: <virtio-comment-return-8827-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3BFC3DA6E
	for <virtio-comment@archiver.kernel.org>; Wed, 20 Dec 2023 11:51:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1D905673A8
	for <virtio-comment@archiver.kernel.org>; Wed, 20 Dec 2023 11:51:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0088E986572
	for <virtio-comment@archiver.kernel.org>; Wed, 20 Dec 2023 11:51:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DBBF2986546; Wed, 20 Dec 2023 11:51:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CB3C7986547
	for <virtio-comment@lists.oasis-open.org>; Wed, 20 Dec 2023 11:51:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2658469"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="2658469"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="866950105"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="866950105"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFQcj+ZIB3KYif7OKKOprCqNUx5g4RuGa27OezY5xh7TTgKiHqFJaj0PzW7HtZaTa2LfPTopP1CovTlOuP9klirWx3solWorOFAci3js4I8LPCmyvTCbrCABEVCPCY5DYJ52BAQFd13Qgnna9y0rJQR+N7afOE47exJidEnzlZPSFbxPtA/p/lgjvlU4yS/gImYmph9BFqCO/6D1EShabZ5EXzs8AFWkiFdl8ik5exJXf7xyriSIJ53GjQjK6ePSb02qTZTZlKAKsfdgF2tNij6zlG8UG9GJz2pEAQbSBt91TCW1oxoMjbnmL6+WN8JNJHsUI10AfLNwe/tXkqASog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1a86o19QTt/uXeGPMZkPcHAZvFOQmFqT6DGKGBbOolY=;
 b=TYjd1Udfx8KepnN7SwdgdNORkZgSvDpLRfKwbNIkR/XcNoSVK0rHpy+uB4pZdUdku5fWruIRcxlAY7SIL5VJyjyyR5mpgF1PkZBtJKXf205YUCc3ac4uoR4hpRY5hJwM/+dtL606eevO9gT3Oy20ac0jnSOkbLNAh41K25su3GTc3SxvzXjRRypE2XblPAJZOkab3h/soc3w92aPCvPmOI9wruNeee6qmMiBLSfGx7Bo3vcQV6Jp6bcXnGgCxyQplg6hA3xm5Regkrf8kuxuODziirxWZg/b8Y+Mv3CBww1wbD2F0v5p4uArywXiGJpP8N+1qItdV/wf4hKQbdif0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: "vivek.gautam@arm.com" <vivek.gautam@arm.com>, "seb@rivosinc.com"
	<seb@rivosinc.com>, "sameo@rivosinc.com" <sameo@rivosinc.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "Tian, Kevin"
	<kevin.tian@intel.com>
Thread-Topic: [PATCH v2 5/9] virtio-iommu: Add VT-d IO page table
Thread-Index: AQHZ+HA2y7+OH7ENvkmIEGyfAOUl8bCvvwQAgAKQopA=
Date: Wed, 20 Dec 2023 11:51:15 +0000
Message-ID: <MW5PR11MB58814C8B5011405E4FD616368996A@MW5PR11MB5881.namprd11.prod.outlook.com>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
 <20231006160947.2227396-8-jean-philippe@linaro.org>
 <20231218173052.GA255425@myrica>
In-Reply-To: <20231218173052.GA255425@myrica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5881:EE_|DS7PR11MB6104:EE_
x-ms-office365-filtering-correlation-id: 1c1ef496-604f-4c64-eaaf-08dc0151f8de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mz7l3GPaPo4ezpQCjqaEKtqoxXT8HEz8rv7Ld6tLuOI+CvZr9vm2Tk7H/XBjwbeen3un7WvOdsMVaOtA9vFnp/L2c/tFjT2E6vLWpXMFsFQCEvLBxw5o6EI6IH15B7cSOrDxaMSV362INDJVNvMO22TLepj792qLKphLmZGnTngOg0jPHGEGawCxGWByxtV7TjwAo24Z7r0nrZTfea2TVfrQ0UZd4WCH6uDoMc1ORytdFhu7UDaxTC2GSviLm6zxc9klCKgq1iyOKN6fKAHIYyfkG4CkyWt1dmshR8ELbdG+vyf8maijlQdlzLmIB6yoQFnMKH7r69lnD44svUwBfjsUH4W+iIASMAaNHiVYLbxdY5oqeihEFltI7dHs509QeTBTL8QVi/vA5wh22PblTKr/FB4tiEonFl7MPt0L3attM/BSOh5fZ520tLKRSLOrU53wZOXgj+DR5BTn8QsZ58hNFhMcuDl6Zxw4nb3Bl0UOThmUGpv5DVeu1+TI05zksobKA5Yj2n22hD3vydmrSIVxpUbONypBPJ/gctVH5Z8B2GEpDmwY2ToN3h+6wFBPAY3y9CuJHsFYD+vcEKs/0ILw9iPpRFSRBzGvUISZR0qjx3PWtgl3XkWiheqXOvAsQovlcjM1XETGl8/5pj7mew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5881.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(39860400002)(346002)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(55016003)(71200400001)(53546011)(26005)(107886003)(7696005)(9686003)(6506007)(122000001)(38100700002)(33656002)(38070700009)(86362001)(41300700001)(8676002)(110136005)(4326008)(8936002)(30864003)(5660300002)(82960400001)(83380400001)(478600001)(76116006)(2906002)(66556008)(316002)(66476007)(66946007)(52536014)(64756008)(54906003)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pO5YyeuGHVLTtLRhayLbha3CEcLQAoQjNR12ehvNWAh6d4wm0xSAMc00fcDP?=
 =?us-ascii?Q?+ReiLRxB7evAfnFoTgQt4QnHUSXSLmu6wQoTKF7vfwdB7NqL8oCyALntyBOy?=
 =?us-ascii?Q?jLA31R5DDiWkEO1ATKfi27NOYZVqdZu5hWOjrJ0d2Ocl03jQKi2bHl3matxZ?=
 =?us-ascii?Q?UWIsm3tDMYdCJEzgf3/jpD2kfaTVdc77NP3j+qaNC20tX9b7qq2d7lABC1UH?=
 =?us-ascii?Q?R312ENstChFc+1SdhdtoKe6d05lrsemg99rQ0b3xZx/+6wwoQuAEAGS4PsFL?=
 =?us-ascii?Q?KC/uNNVXGgDDXJIh/oHuFcP7sal85g663U2q5hoO/tncLeX5KfV7Jlz+3GKj?=
 =?us-ascii?Q?XAmoVbfNvFGMoCAYyOKbIq4z2rCyQ0LcG/c8r+YQfDYumea3J+pTFfkiA2nM?=
 =?us-ascii?Q?WA7yfDOTTcgg/EWHYA2Rvbi3X7pXSlwvzJxZwVIFIE7dMNkTLlYisQX1bKbR?=
 =?us-ascii?Q?uACyyaUWiIbdFeWhZTQtD1nyo2cY2dnUhePVWSDFIRBL+wYoeeVb0jotnOWi?=
 =?us-ascii?Q?n/xNHhWLM44yr+PXHFUmZcc4SKIRdn/m4j0EbEwkxFuU9JtrjjUhzpRBELYk?=
 =?us-ascii?Q?YgVNQaaJGyNma9hwC1X0W5dQ7lglgK4fowU/4VxTSCbia0izFcapJgS2t3HW?=
 =?us-ascii?Q?a4HRR/s0//SgsWMZ24zzI9mbQW3aznJyzkOdfIi1bjlYgPwvgRHI9Cqx8sw+?=
 =?us-ascii?Q?QY+7LJwUNbSk6Mk9XZ3rULLdx/oKi7bnLYL4O0SAlVw8i+RYqDB14Ws2V7Pz?=
 =?us-ascii?Q?6pWRLq2hKshgHNScBLh8XNkzkA9Y2RsrhGaqfpTIUIgySqhk9JlI571FmmdL?=
 =?us-ascii?Q?px2Y+UkJbI1UgUEBT6l6zgrSqm2GKreKC3NpQejklNIeARgGylRtuqD2dQJH?=
 =?us-ascii?Q?i3/f5VPg+qBap7ahXBc+gi0yBtWG35Wt1vCs34CTCcxNDXZlwphgbUyylcq/?=
 =?us-ascii?Q?jtntC235n5xSG4BkVOyKBIV3M/JPkJufqb1GaBjKe5oRjnv1q6yYmPYYIEI6?=
 =?us-ascii?Q?EkYZGWmvnYNCI83QI3j0v/Md5zMzlZT4FVFm4tuouGzHO9VjQjdISr2o8FGg?=
 =?us-ascii?Q?EZk5v1BnbOIe5snhuPSJG2qytl74B5fXqbwI4lA43q7nETTOIJptaHDjOQBQ?=
 =?us-ascii?Q?X6EfRQEU0kN0WzBGab1o0dc/OZ1F+lcOEWAGBFs1e8LirtzL97wyHCVql2pS?=
 =?us-ascii?Q?bvpdUpJfo7hzC69GmmYPI2ddwa8LLOSG7wZeEUX0mHiqv680+o+M3bwgZ8GV?=
 =?us-ascii?Q?eQoyK4FQe06E5I5V+4CtFEd8/Ng0wZ/uetfQDdwd/y90D6k/EYZomt+E5882?=
 =?us-ascii?Q?k8DenpZhNO5DuGsuafIrqx//MRO3Evsou67LJ6UfiFWO19gXpEdUjd84dQ+S?=
 =?us-ascii?Q?2sjZppSPffvXP9qBR3lFGCNbayFpjOfvFB6zRY9S5oresG4nM7Z2Qxt7Kc5g?=
 =?us-ascii?Q?7FUuN5Pi7zRxjlVjwP4j/8i5eL1W/iDkqgL+rhuxG9kMQqY/+Y+iI8VBp0wh?=
 =?us-ascii?Q?QZ1/rGhVKBIbaGs5Oy5tDfbz3knkxYM5R3oXzaMYuVZ8bCmZIZDgx9G1ceUC?=
 =?us-ascii?Q?Y2LqUgPncG+ZcP+duAwpppZZK04nAD5mnKIanz9w?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5881.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1ef496-604f-4c64-eaaf-08dc0151f8de
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 11:51:15.8508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RyJiQc53Aix+nfhEe84x8GPuLT+Nk6hTIYMV/jL3im1Zw/Ia0V2XZYfg0esNvW6BMQcPxX4loX9l8ewlDBjh3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6104
X-OriginatorOrg: intel.com
Subject: [virtio-comment] RE: [PATCH v2 5/9] virtio-iommu: Add VT-d IO page table

Hi Jean,

> -----Original Message-----
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Sent: Tuesday, December 19, 2023 1:31 AM
> To: virtio-comment@lists.oasis-open.org; Zhang, Tina
> <tina.zhang@intel.com>
> Cc: vivek.gautam@arm.com; seb@rivosinc.com; sameo@rivosinc.com;
> eric.auger@redhat.com; Tian, Kevin <kevin.tian@intel.com>
> Subject: Re: [PATCH v2 5/9] virtio-iommu: Add VT-d IO page table
>=20
> Hi Tina,
>=20
> On Fri, Oct 06, 2023 at 05:09:45PM +0100, Jean-Philippe Brucker wrote:
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
> > request references the fields defined in VT-d scalable-mode PASID
> > table entry.
> > * attributes defined in ATTACH_TABLE request:
> >   FSPTPTR got from pgtbl_addr field.
> >   SRE/EAFE/WPE defined in pgtbl_flags field.
> >   FSPM calculated through addr_width field.
> >   PASID got from pasid field.
> >
> > * attributes not defined in ATTACH_TABLE request, as their
> >   configurations need to be decided by host:
> >   Memory type features, PAT/EMTE/CD/PGSNP/PWSNP.
> >   Snoop Behavior, PGSNP/PWSNP.
>=20
> While reworking this patch I've been wondering about some of these fields=
.
> The host is in charge of configuring them, but does the guest need to kno=
w
> what was configured in order to properly fill the page tables?
>=20
> These fields in the Scalable-Mode Context Entry:
>=20
> * RID_PASID: if RPS is supported, the guest needs to know which PASID
>   table entry is chosen by the host for non-pasid DMA. Should we just
>   assume the host configures it as zero for now, and that ECAP_REG.RPS is
>   always zero?
We probably shouldn't have such assumption. I think we need to add this RID=
_PASID field to align with VT-d spec.

>=20
>   If you think there won't ever be a need to support RID_PASID that's fin=
e,
>   but we should think carefully because adding support afterwards is a lo=
t
>   more work than adding a rid_pasid field now to
>   virtio_iommu_probe_hw_intel_vtd (later we'd need a new negotiation
>   mechanism to ensure the guest is aware of the new rid_pasid).
>=20
> * RID_PRIV: similarly to RID_PASID, do we assume a default of 0?  It's
>   also more difficult to add that support afterwards, so maybe we can add
>   a flag to virtio_iommu_probe_hw_intel_vtd now.
Yes, RID_PRIV is also needed.

>=20
> And these in PASID table entry:
>=20
> * PAT: does the guest need to know how the host configures PAT in order t=
o
>   know what to write in PAT, PWT and PCD in page tables entries?  Or
>   should we pass guest PAT configuration in attach_table?
We don't have concrete case about how to use this feature in guest today. N=
ot sure if Kevin has comments for the questions.

Anyway, it seems we could have two options here:
1) Add PAT related fields to virtio_iommu_req_attach_table_intel and expose=
 the feature via virtio_iommu_probe_hw_intel_vtd.
We'd better understand how to use this feature in guest before supporting i=
t. Otherwise, we may need some change in feature.
2) Revisit this PAT support in feature.
It seems we need a way to support afterwards anyway (hope we can figure out=
 an easy way for this), as vendors' specs may have updates in feature.

>=20
> * CD, PGSNP, PWSNP: also feels like the guest should know about them, so
>   it can maintain coherency appropriately. I haven't looked at the detail=
s
>   for Intel, but for example if an Arm SMMU doesn't access page tables
>   coherently with the CPUs (maybe similarly to PWSNP=3D=3D0), the CPU nee=
ds to
>   perform extra cache clean to make sure that page table updates are
>   written back to memory and accessible by the IOMMU.
For snooping memory access, PWSNP is needed. Agree to add PWSNP field to vi=
rtio_iommu_probe_hw_intel_vtd and add a flag to virtio_iommu_req_attach_tab=
le_intel.

PGSNP might not be needed. Because according to VT-d spec, the snoop behavi=
or of accessing final page by untranslated request can also be decided by S=
S.leaf.SNP. But I think it's OK to add it as a flag.

CD has relationship with PAT/EMTE which are for deciding memory type. We ne=
ed to know how to use them in guest.

Thanks,
-Tina

>=20
> Do you think there is anything to be done about those?  We could either
> provide host values in virtio_iommu_probe_hw_intel_vtd, or allow the gues=
t
> to configure them in virtio_iommu_req_attach_table_intel.
>=20
> Thanks,
> Jean
>=20
> >
> > Support for any new attributes could easily be added by adding flags
> > to the PROBE property and fields in the ATTACH_TABLE config.
> >
> > Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> > [JPB: moved to pgtable-intel.tex, rework formatting]
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  device-types/iommu/description.tex   |  3 +
> >  device-types/iommu/pgtable-intel.tex | 98
> ++++++++++++++++++++++++++++
> >  introduction.tex                     |  3 +
> >  3 files changed, 104 insertions(+)
> >  create mode 100644 device-types/iommu/pgtable-intel.tex
> >
> > diff --git a/device-types/iommu/description.tex
> > b/device-types/iommu/description.tex
> > index c057cdf..a4eb492 100644
> > --- a/device-types/iommu/description.tex
> > +++ b/device-types/iommu/description.tex
> > @@ -407,6 +407,7 @@ \subsubsection{ATTACH_TABLE
> > request}\label{ref:Device Types / IOMMU Device / Dev  };
> >
> >  #define VIRTIO_IOMMU_ATTACH_TABLE_ARM_SMMU3       1
> > +#define VIRTIO_IOMMU_ATTACH_TABLE_INTEL_PT        2
> >  \end{lstlisting}
> >
> >  Attach an endpoint to a domain, in the same way as an ATTACH @@
> > -1009,6 +1010,7 @@ \subsubsection{PROBE properties}\label{sec:Device
> > Types / IOMMU Device / Device  \begin{lstlisting}
> >  #define VIRTIO_IOMMU_PROBE_T_RESV_MEM       1
> >  #define VIRTIO_IOMMU_PROBE_T_HW_ARM_SMMU3   2
> > +#define VIRTIO_IOMMU_PROBE_T_HW_INTEL_VTD   3
> >  \end{lstlisting}
> >
> >  \paragraph{Property RESV_MEM}\label{sec:Device Types / IOMMU Device
> /
> > Device operations / PROBE properties / RESVMEM} @@ -1160,3 +1162,4
> @@
> > \subsubsection{Fault reporting}\label{sec:Device Types / IOMMU Device
> > / Device o  \subsection{Acceleration}\label{sec:Device Types / IOMMU
> > Device / Acceleration}
> >
> >  \input{device-types/iommu/pgtable-arm}
> > +\input{device-types/iommu/pgtable-intel}
> > diff --git a/device-types/iommu/pgtable-intel.tex
> > b/device-types/iommu/pgtable-intel.tex
> > new file mode 100644
> > index 0000000..90a3410
> > --- /dev/null
> > +++ b/device-types/iommu/pgtable-intel.tex
> > @@ -0,0 +1,98 @@
> > +\subsubsection{Intel VT-d tables}\label{sec:Device Types / IOMMU
> > +Device / Acceleration / Intel}
> > +
> > +Attach first-level translation tables in the format described by the
> > +\hyperref[intro:VT-Directed-IO]{Intel Virtualization Technology for
> > +Directed I/O specification}.
> > +
> > +\paragraph{PROBE property for VT-d page tables}\label{sec:Device
> > +Types / IOMMU Device / Acceleration / Intel / PROBE}
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
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_SAGAW_SHIFT 8 #define
> > +VIRTIO_IOMMU_HW_INTEL_VTD_CAP_SAGAW_MASK  0x1f #define
> > +VIRTIO_IOMMU_HW_INTEL_VTD_CAP_MGAW_SHIFT  16
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_CAP_MGAW_MASK   0x1f
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
> > +#define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_SMPWC      (1 << 48)
> > +\end{lstlisting}
> > +
> > +\todo{check that these are necessary and sufficient to support page
> > +table assignement in scalable mode.} \todo{Need to support non-PASID
> > +assignment? non-scalable?}
> > +
> > +\begin{description}
> > +  \item[\field{cap_reg}] Capability Register.
> > +  \item[\field{ecap_reg}] Extended Capability Register.
> > +\end{description}
> > +
> > +\paragraph{ATTACH_TABLE request for VT-d page table}\label{sec:Device
> > +Types / IOMMU Device / Acceleration / Intel / ATTACH_TABLE}
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
> > +\paragraph{INVALIDATE request for VT-d page table}\label{sec:Device
> > +Types / IOMMU Device / Acceleration / Intel / INVALIDATE}
> > +
> > +Supported values for field \field{scope} are
> > +VIRTIO_IOMMU_INVAL_S_PASID and VIRTIO_IOMMU_INVAL_S_ADDRESS.
> > +The only supported value for field \field{caches} is
> > +VIRTIO_IOMMU_INVAL_C_TLB. Field \field{id} is not used.
> > diff --git a/introduction.tex b/introduction.tex index
> > 636fb1b..d0d5086 100644
> > --- a/introduction.tex
> > +++ b/introduction.tex
> > @@ -104,6 +104,9 @@ \section{Normative
> References}\label{sec:Normative References}
> >  	\phantomsection\label{intro:SMMUv3}\textbf{[SMMUv3]} &
> >  	Arm System Memory Management Unit version 3
> >
> 	\newline\url{https://developer.arm.com/documentation/ihi0070/late
> st}
> > \\
> > +	\phantomsection\label{intro:VT-Directed-IO}\textbf{[VT-Directed-IO]}
> &
> > +	Intel Virtualization Technology for Directed I/O
> > +	\newline\url{https://cdrdv2.intel.com/v1/dl/getContent/671081} \\
> >
> >  	\phantomsection\label{intro:rfc2784}\textbf{[RFC2784]} &
> >      Generic Routing Encapsulation. This protocol is only specified for=
 IPv4
> and used as either the payload or delivery protocol.
> > --
> > 2.42.0
> >

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

