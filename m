Return-Path: <virtio-comment-return-8102-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29546C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 00:56:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 499932AC62
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 00:56:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D50E986BE8
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 00:56:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F297F986BDD; Thu,  2 Nov 2023 00:56:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DC96E986BDE
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 00:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="385785814"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="385785814"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="764747021"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="764747021"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2C61dPbLXMpCVSAejUM+iVsjqxGbGkGL8lbLzLTnxIu5XxokH8nk3Ybr5TIj7tauBwH4jrbpCi3edll3eDSpWYmLyFPp+yHPXtU03Wv1AAjBcNFfj3kLw7F7sYjvVLnRrhhoB7wwj+Msbfb3nkQcsg4Zz5EYg5Nzw3kF9Y9BkycW2Vaf7nfC3K7j+q+aRnVjRg4OOELG9qfFWz8gmTiHDk7iDAU2cKH5DtshfmRs+4hSPNSOGHsDghjSLoZiWGL+bteqdzpj0RoolEh1IcCTg/BpOwguq8rWHST/0pAYR1mwSCcqApw9maefbVgbDjtzszFYgI/Gjro1gQY3/Sq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMNRzY6jZ6GVaZe+fGCKJyU/EFwA6vxkacQ6bJKjrEk=;
 b=IMHGw9fVG84tzm0VgqzinT04Msvx+Nr7cg7AO9VEZ9bmg16AGbSUkRqbZME6QtdVnAobbBdxohMqzLl+K+mZvaU5K7Vr5UFR1cFp+1GZWWs7IWWD0QA3jq9oJ8lbkJj9hPemtKYTyH5PlVFBzSEsCAzMCsrKxqvInUTN+57E+kVYoZZV6L8MILvjIDCRbTeEjLK/bDH03a3L9aFnIbhJ7hRLWR1m3ysDV7hXwUsTOltWpl1oAZ/q7NtgJSmsvsOJ4A9m/322ffEg73RhK/ITccdjbHDWyOtGrI5NROKd6G/GXdVD3OwsAkDpK8+2L0PF073osSKJVxLcEOgmxZXJUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "vivek.gautam@arm.com"
	<vivek.gautam@arm.com>, "seb@rivosinc.com" <seb@rivosinc.com>,
	"sameo@rivosinc.com" <sameo@rivosinc.com>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "Tian, Kevin" <kevin.tian@intel.com>, "Kumar, Sanjay
 K" <sanjay.k.kumar@intel.com>
Thread-Topic: [PATCH v2 5/9] virtio-iommu: Add VT-d IO page table
Thread-Index: AQHZ+HA2y7+OH7ENvkmIEGyfAOUl8bBFAlaAgAqy7YCADWE7AIAIrh4AgACGeRA=
Date: Thu, 2 Nov 2023 00:54:05 +0000
Message-ID: <MW5PR11MB58816F786D06B55F9FE1D48C89A6A@MW5PR11MB5881.namprd11.prod.outlook.com>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
 <20231006160947.2227396-8-jean-philippe@linaro.org>
 <b905a036-199c-47b7-ab51-4c31f39193a1@intel.com>
 <20231018145501.GB1229555@myrica>
 <dc59408b-4900-47d5-ba15-8ccade7666b8@intel.com>
 <20231101154740.GA318666@myrica>
In-Reply-To: <20231101154740.GA318666@myrica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5881:EE_|CH3PR11MB7722:EE_
x-ms-office365-filtering-correlation-id: 7ed8f49c-4cfe-472c-d2b7-08dbdb3e36e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dQ1+IjL1whoSh54pDABE8qf8qE6x0EvooK2YFSGugh+FYxEw48tHX4TzT3FwTXGTeM8FRF0e6LrvbVBlwiHVwRM5+3UgG8eYQH2Jmv3fgCodCH9zsPD3ueBRGcdNcq4jkMZZapMsc62t1IQd7Hm2oczhuYPtZbu1dmX7tfWcev//cCKrcN/te+dq3FnlQL8WJBW15uJedScSxgxj+Gq5wBRYARSnaBcFO5UZLVHT5CBjOUW9ipv3bp7f+ms/NUMY+iDDLaBZRVAjHkLP8WAqgApQJz9sDeX+JvAh8j60kFb5kNik9Q64op9CtIMiR0OrSBn7r6owhkP0hFrdYQhkCm0bwJmEKBFW5g74aiHuufxC0kM2wPmF/jFKLGA4lEF10KJTer8VmaoxNUplK7K4uPdJERJbcTGZb/nPkycED6Mcn+CTaJ2B0B1e5rq6BbDyDrkNLuWXp3T0PiRyCUIvVQk/CwOZa5OXvcxnchtoqThmfK60wnH+9neeTirLoGQx6DfqGst78vMGCNDaXmUFQx8u7EUos3W7+Phpb9ix/Oe2c2RjGyOd7imlAGxDZp3gXkJUkcWMPz3JdlB13vaCO9tbtdWsFcXHd8wjIpeHXvcJ3cdm+hUzUsmmaoWF3nZG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5881.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(346002)(366004)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(55016003)(107886003)(9686003)(26005)(41300700001)(7696005)(478600001)(82960400001)(71200400001)(8936002)(83380400001)(66476007)(53546011)(6506007)(2906002)(8676002)(5660300002)(76116006)(66946007)(66556008)(6916009)(4326008)(52536014)(54906003)(316002)(66446008)(64756008)(33656002)(38100700002)(122000001)(86362001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TS1qcwrNOjHQ48gMi3SfPtn3Byv8Bw+VB11IvV1aemPExCjqva7DdP0NMNty?=
 =?us-ascii?Q?1BfbbMMzKNLDhRbXiRpR2VuB5fiCTyLSGj/Vz19iQvuyf9H20w/2tozSMHq7?=
 =?us-ascii?Q?s+I0bqqEIpd7Cdtq0rmE+R5k4ByCn65JIQo7P2q6ymo9C8JXTNWyX2EXgnAD?=
 =?us-ascii?Q?6GULyhgOEmKF9KMKKnHVppxD/WqsoNN+9DzHlcfoI6wDe6AWmpuXWnCHpQ44?=
 =?us-ascii?Q?wh1ESaTJsFINfJCBz0WiIH4QQCRXCiM7MF2vZDlwE3CADG915DMZZkKMIPv+?=
 =?us-ascii?Q?w6GR7lS2NMdN4WxklzhprMn16bFDF6SGN+cAEw6tbufolB6xI0YZia0H2ufA?=
 =?us-ascii?Q?FrvcR829M6bavSs1o2jb1MEiIO0EHKHrsftuDdbXSQAaDSfGVFBr/YP+dQW/?=
 =?us-ascii?Q?Qq7ybaOPwRzBh8/j5xeO+XvAZpQfqtRZEPmDlXpnIIzvWq4lmyZXHM2jLcop?=
 =?us-ascii?Q?OmsVrFwrSHoTnw/GgIot6WFXv/ghLSLb6305muMpovvwP3CXoWTDMK3Tv8Zd?=
 =?us-ascii?Q?1SGRrkQL6AZPBY93MXSM/n3rx2BHOHdMi9F68vZIvm+emNEX431v8nafx/Ea?=
 =?us-ascii?Q?kmKxvtd5cXqDofEKSEMnB4zLH7JWFvRnOFTxAweAPCxJVS5yOjUxeyHTXt/E?=
 =?us-ascii?Q?t6mBMRNoo7E2ZP2zqR0t2XbIfQFLjF2k5HC9/UQxKS5JjRLO+MM+yM1QZqou?=
 =?us-ascii?Q?OOFoGpkd6AL7Pzb3aNyDlBUIy0Q8t4XuxUk3hp61ILlYDdavzQxlf5hWTmNj?=
 =?us-ascii?Q?tngm/eKSobOh2UbU8/Mke6N72gFbRybgqJm8PIykQWPjnmTmRFAhJsfOP02O?=
 =?us-ascii?Q?fJufV1Nqn6Z4LXgrIzs2Wf5C24z4IU4kwmkMrBS/C7Qup1H82egEw/zbeodE?=
 =?us-ascii?Q?ThjfzrhOAK9bkBMqZIizNxaYd0T8VSG/Y1Ezra9uQ7/5VKVRBmAtpChHvjt2?=
 =?us-ascii?Q?WX9aj73AUdXlCUWFe+DOhIjDZe5kKqhnjbQLVRvkoC01cWKlayAERPooA6nt?=
 =?us-ascii?Q?0q6mKkRcEfiKZdb1qYWrKIWfaXwT+AjRj25AiAjSd4emDnxnwRWiGL+P1Ezj?=
 =?us-ascii?Q?29RFsybjdLn67stTBt5yhyKDYqSD6+PbunQjGOun6CjCRwRLEqaqApbhfMog?=
 =?us-ascii?Q?YV5p0fyB5hRaTGj2WtWDs1Q3MrlsJXtnkcK2e23sg52hPbwQcGaN5zUSJxzH?=
 =?us-ascii?Q?dcxY8L1nCOSkpUUylDGWlLncNwL+ZoT/X2lCuRGAr56cXT83VcHbJ3KCQVxr?=
 =?us-ascii?Q?zOfyvxMVSG7i5vRjUiZXdZdaYrPWFqQBURVmCLPEpE1kXXYPFvWBbAf458zw?=
 =?us-ascii?Q?UoYCQkS53+0fk3G/CoL0Havi7TdrPpVuH+GhtNKUFnQVj2ViZTrb0nXLTY3G?=
 =?us-ascii?Q?styF41orYmOFbpZlzX4u1T3lW/9Fo5R0IEfRFLPG+6PFQqHlRy+z3l0ZQxPu?=
 =?us-ascii?Q?V0j252q51NHnr4MKeTwGVXASUN8XnZOERIeVpAXVZ7drrtU0fYiewxXNaj+4?=
 =?us-ascii?Q?kn+bFxZWx0OZ8J9fxl5J0HmgX8bm6wocFasiKmVXzcBJXlDtkqMv6SWTtgMs?=
 =?us-ascii?Q?UvB7BDdrHBtvaGIBbJX5j0pEsTE5Ez/lpnDWBVsi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5881.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed8f49c-4cfe-472c-d2b7-08dbdb3e36e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 00:54:05.8250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3LtHto7u5dKTMZ/6p14wxMWzGfEn4JYeB42oHwNP/lT0DVt/mMUoadoCIhHKWSS2YcGftN8k4ANTjq6sR9lR6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
X-OriginatorOrg: intel.com
Subject: [virtio-comment] RE: [PATCH v2 5/9] virtio-iommu: Add VT-d IO page table

Hi Jean,

> -----Original Message-----
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Sent: Wednesday, November 1, 2023 11:48 PM
> To: Zhang, Tina <tina.zhang@intel.com>
> Cc: virtio-comment@lists.oasis-open.org; vivek.gautam@arm.com;
> seb@rivosinc.com; sameo@rivosinc.com; eric.auger@redhat.com; Tian, Kevin
> <kevin.tian@intel.com>; Kumar, Sanjay K <sanjay.k.kumar@intel.com>
> Subject: Re: [PATCH v2 5/9] virtio-iommu: Add VT-d IO page table
>=20
> On Fri, Oct 27, 2023 at 11:14:24AM +0800, Tina Zhang wrote:
> > > > I think two more definitions are needed:
> > > > #define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_NEST    (1 << 26)
> > > > #define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_FSTS    (1 << 47)
> > > >
> > > > The ECAP_NEST tells if VT-d hardware supports nested translations.
> > > > The ECAP_FSTS tells if VT-d hardware supports PASID granular
> > > > translation type of first-stage.
> > >
> > > It doesn't hurt to add them. Would the guest behave differently if
> > > NEST or FSTS is set or clear?  I didn't add them because I assumed
> > > NEST is a prerequisite for supporting guest page tables, and it requi=
res
> FSTS.
> > Yes, they have some effects. According to VT-d driver and Spec, only
> > NEST=3D1 means nested translation is supported by the hardware,
> > otherwise nested translation is not supported. But the NEST=3D1 doesn't
> > automatically mean
> > FSTS=3D1 which reports if the hardware supports PASID granular
> > translation type of first-stage table.
>=20
> I though NEST=3D1 implies FSTS=3D1 because of this in VT-d 4.1:
>=20
> NEST	Hardware implementations reporting Scalable Mode Translation
> 	Support (SMTS) field as Clear or First-stage Translation Support
> 	(FSTS) field as Clear or Second-stage Translation Support (SSTS)
> 	field as Clear also report this field as Clear.
>=20
> But it doesn't matter for this discussion, I'm just curious.
I checked the Spec again. Your understanding is correct. So, NEST=3D1 is su=
fficient.

>=20
> >
> > So if FSTS=3D0 or NEST=3D0, guest VT-d driver/lib will refuse to alloca=
te
> > a VT-d IO page table for virtio-iommu.
> >
> > If we want the virtio-iommu backend to check these bits before
> > reporting the supported page-table fmt, then we don't need the
> > virtio-iommu frontend to check them again. So, here are two questions:
> >
> > 1) If we want the virtio-iommu backend to check vendor IOMMU specific
> > capabilities, does it mean we need to add all those details defined by
> > vendor Spec into virtio-iommu Spec (like what we did in this version)?
> > Does it make sense to virtio-iommu. My understanding is virtio Spec
> > may try to avoid vendor specific things and leave them to venders
> > drivers/libs. (I saw your comments below. I just want to post my concer=
n
> here).
> >
> > 2) If the virtio-iommu backend just delivers vendor specific cap/ecap
> > to virtio-iommu frontend and doesn't do any checking before exposing
> > cap/ecap to guest, then virtio-iommu frontend can invoke some generic
> > io-pgtable APIs (e.g., in Linux it's io_pgtable_init_fns.alloc()) to
> > allocate a io_pgtable , which operation invokes vendor's alloc()
> > callback and vendor driver/lib can do the checking there. Return
> > success if the cap/ecap makes sense to vendor IO page-table support
> > and allocate a set of page tables, otherwise return unsuccess. If this
> > is the direction, then we probably don't need to add IOMMU vendor's
> specific definitions into virtio-iommu spec. Right?
>=20
> Yes, that makes sense, I'd like to avoid vendor details in the spec where
> possible.
>=20
> I was wondering whether the virtio-iommu device needs to sanitize hardwar=
e
> registers for security (hide bits from ecap not relevant to the guest).
> I don't think so: it should be impossible for the guest to use the extran=
eous
> information in the cap registers for anything nefarious, because that imp=
lies a
> vulnerability is always present, and masking feature bits is not the corr=
ect
> protection against that.
>=20
> It's still not completely obvious to me that presenting raw ecap register=
s is
> safe, because it's made of more than just 1-bit features. For example I s=
ee a
> 10-bit "IRO: IOTLB Register Offset" field in there, but I'm guessing that=
 it
> doesn't contain secrets, and an attacker couldn't do anything with that
> information.
I see the concern. Although I don't have a concrete case about what an atta=
cker could do with this IOTLB Register Offset either, I agree it's probably=
 not a good idea to expose more hardware information to guest than necessar=
y.

So, in virtio-iommu backend, we need screen those unnecessary bits out.

>=20
> > > More generally there are several ways we could describe these
> > > registers in the specification:
> > >
> > > (1) Don't describe any fields.
> > > (2) Describe only fields that directly influence the configuration of
> > >      ATTACH_TABLE and INVALIDATE.
> > > (3) Describe fields related in any way to page table support.
> > > (4) Describe all fields.
> > >
> > > (1) is the easiest from a spec point of view. I tried doing (2) to
> > > ease
> > I like (1), too. But I don't object to other options, as long as it
> > makes sense to virtio-iommu.
>=20
> Ok, I'll probably go with (1) in next version
>=20
> > > writing driver and device code, but without explaining in detail
> > > what the fields mean because I think that's best left to the
> > > hardware
> > Agree. We should leave details to vendors Spec.
> >
> > > specification. (3) would include NEST, FSTS and possibly others. (4)
> > > wouldn't really be useful, we may as well do (1).
> > >
> > > Maybe (3) is better. This way the device can use this description to
> > > sanitize the registers before passing them to the guest, and the
> > > values read by the guest still make sense. Because if we only
> > > describe (2), and then the device decides to only provide those bits
> > > and clear everything else, then it may be confusing for the driver
> > > to find NEST and FSTS clear in the cap registers. Should it then
> > > even attach tables?  Maybe in the future there will be a use-case
> > > for presenting NEST and FSTS clear to the guest.
> > I assume that you are talking about virtio-iommu working with VT-d IO
> > page table on platform that has no nested translation support or the
> > nested translation support is disable. Right?
>=20
> Yes, I was thinking of a virtio-iommu implementation that doesn't support
> page tables but still wants to communicate some hardware IOMMU features
> to the driver. I don't have an example for Intel, but for Arm we'll want =
to
> communicate support for multiple page granules (4KB, 16KB, 64KB), even fo=
r
> the map/unmap interface. At the moment we present a single granule to the
> guest, which is fine on x86 where 4KB is the only granule, but it doesn't=
 work
> for Arm setups where the host uses a different granule than the guest. We
> need a spec update to support this, and I'm still wondering if we can reu=
se the
> probe property that this series introduces for Arm SMMU, or if we should
> introduce separate ones.
>=20
> Anyway, even if Intel never needs to reuse this probe property for non-pa=
ge-
> table support, it's probably best to have cap/ecap be as close to their
> hardware values as possible. It keeps the virtio-iommu device implementat=
ion
> simple and is easier to extend in the future.
Agree.

Regards,
-Tina
>=20
> > So, there are three usages:
> > 1) On the platform having VT-d hardware nested translation support and
> > the functionality is being used by a guest, guest VT-d driver/lib
> > allows virtio-iommu frontend to allocate VT-d IO page tables.
> >
> > 2) On the platform having no VT-d hardware nested translation support
> > or having the support but not being used by a guest, guest VT-d
> > driver/lib doesn't allow virtio-iommu frontend to allocate VT-d IO
> > page tables. So virtio-iommu legacy map/unmap() is being used (no IO pa=
ge
> tables in guest).
> >
> > 3) On the platform having no VT-d hardware nested translation support
> > or having the support but not being used by a guest, virtio-iommu
> > front-end may want to use some virtual IO page table. My understanding
> > is this virtual IO page table is generic to vendor IOMMUs. So it
> > should work w/o any help of vendor IOMMU driver/lib. Is my understandin=
g
> right?
>=20
> That's my thinking as well, although virt page tables (3) isn't useful fo=
r
> assigned HW devices. For those, either VT-d page tables when supported (1=
)
> or map/unmap (2) can be used. They could also use special tables like
> coIOMMU for pinning rather than mapping, which resembles (3). For virtual
> devices (eg. virtio-net), page tables would provide better performance th=
an
> map/unmap (2), and in this case I think generic virt page tables (3) is b=
etter
> suited than vendor tables.
>=20
> Thanks,
> Jean


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

