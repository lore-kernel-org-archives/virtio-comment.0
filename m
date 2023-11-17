Return-Path: <virtio-comment-return-8473-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1014C072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 14:48:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D5B412AD65
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 14:48:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A51D0986E31
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 14:48:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 848C9986E25; Fri, 17 Nov 2023 14:48:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 74800986E26
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 14:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPlbAYmLhgNAZS4EfUlWWISObqyszDqWWyL84af0octXr/MfhP0pZvVGStdMheaF8/UJBQ1eBYtijeamhUACUUaANz08cpaxQdmAwg6vS/p9J9NWs+EHkA0/Pgqr3q/JhZFx0xqIBZK2l8ZOvGVv9KwaoBNQqAQcie3mXEvbKcSqFGRTbH6meUcWuvtvIZ2KboEG62p38OJ1qv6iA/d8beZJApQhRZRGPmP0vQcGzPWxTx9dXe0J6dDSp7SUf760xMjPL9ldPY2SYqDo7D6ehsbdgS3ExVDT7diIWasqVsPGtMoVtB4+alrrpXBx3tCjz+hp0C20eghk9ujLF8c7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQbHb4VlITjPS2F92U/CJx2rLwvYtNUaURMBb2wu2ko=;
 b=IRXpIXmguoVddt7nLzC3whfzBOkG5Uf4eH5CMWsPpeH4tnvNQBFPZDmg8lhQso6wIW2XNfC7+sI7y5Z98VjN9r8/hfHkkgVfHkiBEuGokBIYKZwZfNMGhTnLVFjZBnJxOzAMRN9N4KKYuUb8018uAvFJ1Vo9Cizg/EQPvtScp07NH6UDHIuCpQ+tnUHbJ5kYsTCdeXCVpwRVMHu4koXaU0UzeWNoA73qg4T78nE7o6nE3+rHuXErMTGXJ5kyvRvNipX6qQSYHwHdTV0WosqJVBVm9HQL+NwtLvv7qmuWzH1zqpzxWUyrjNHXeNh2a3rwpavuruI2023mnEOBB5Fz9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Jason Wang
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAATUGAgAAZpoCAAXC2gIAAADIwgAAQrwCAAADWwIAACKCAgAACIJCAAAaJgIAAAShQgAAGigCAAAhMwIAAEHEAgAAMy+A=
Date: Fri, 17 Nov 2023 14:48:37 +0000
Message-ID:
 <PH0PR12MB5481E5431DFCF96F622A7696DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
 <PH0PR12MB5481C2B37901FDBBE672EF98DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117054650-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813446F8F2BBDBC74BF393DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063304-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548179702B4F7B460E09681CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117065740-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C905833821171814CB13DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073031-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548103A393411CF8357B85DEDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117085848-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117085848-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ0PR12MB8115:EE_
x-ms-office365-filtering-correlation-id: 28dbba6c-cf2e-4d25-b5d2-08dbe77c486c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 H5ECotk7nvfV/xm1KGWIw/bwGXDiWzJh6O3sotk6IpotuQQGy3tE/z7A3zO1Fkgmiy1f2Ln59htIqrn8O4tpgf8bfxCW6phWGJKNgjtukmRZPCvC3nHB+PDSCILv9Ce3vB1CgKkksF6GsWI+K8TjqoZgMM4O2fwaTmrAD/wR2/oDYEfm8/bdf2dvSeSDEu7VCTdbDCNMp4iPdl6sUJaewn8DqDsnb638dyVp8cqpPA7ktIqfEKNyGYhSYK9IBJaBoRSMZzg5+xkp86c/CT0fGwXwHAiNiwL/UrP0wHFXmi/19lHxVsmkQazQcR21YFfRxSBpPVQ6hew9xBC25UVi7z7RrkSArRRwXXe+8PybRpA59DVzmUru0QvbhDCRM3jRCKUK9k/RFfyZxQuBHIQCXJRImC+zD7bWVzu+Q3Qarr5Is6sEwITfgVS9aCq6P/h2tAlOg/PIx29MVBKw6FQWJGKNiWY4hBixoea4NEkM/Hs9mM/KLHHKxEBBhnhlYDzgEJmrDrAW9oBsIOReezNx+DQEBNmlm/4gFG7sgYSJVNVxx/q3Bc9uQquXTHAW606BBMz2QS3VI3r15fkR8agHpdMc/OtzlaK1G+vjhuic2a1Cz9aOqMufpqdmrHDjXB3sE4dWMBO6fig4PpDlpOWawvtVTnMbTJrdoCwiYnlK5WUZXHIHSfG9Jc3m+EZ4hgKq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6506007)(7696005)(8676002)(53546011)(8936002)(55236004)(4326008)(966005)(66446008)(66476007)(76116006)(6916009)(64756008)(55016003)(316002)(86362001)(66946007)(83380400001)(66556008)(478600001)(71200400001)(33656002)(52536014)(9686003)(26005)(54906003)(107886003)(2906002)(5660300002)(38100700002)(122000001)(38070700009)(41300700001)(69594002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?e5eshpACqrtomODlgMAp5rw9ou84yIzZZ3UH8x9gm1YLud4eRKqbkMILyaxu?=
 =?us-ascii?Q?Bri6Pb6T0Bik9NYqxwq1cFkC6ypURrYQTrcpYMKfKGbs30f6g80+ixTgGbor?=
 =?us-ascii?Q?mYUQ5nZZBp3ilReyx4zgS7EAD35Tjn37Se0z8qmMHeYe+JZsooiAtEyyZ1wW?=
 =?us-ascii?Q?ee84+5dBlV08PpCMVhA8WzcYT45e6BfVmmzqOC+RVNKZEsQuzoO1IHq6XiTa?=
 =?us-ascii?Q?hAb75DucN7QYt0oztXAPhifAa509mMZ9m4VxPvFTCJV2ruHkBj75aX1R0S5q?=
 =?us-ascii?Q?m826+UkaB063u+gXQx/ikcd+Z0c/8C5Zl+pjgTLenYjI3Fb1I1B7ic2SXhk0?=
 =?us-ascii?Q?IXlHrQjmCcs3Pw4QoSAEmfOIeisOUejd2aV4L0Zc7V9+A2XdmifETaMGEH8f?=
 =?us-ascii?Q?1v0IzrXO37Pea20N2TV7h+VcmuVZnbHpuVockIa5lG8nzsgcxQdm9aoDIa6T?=
 =?us-ascii?Q?EOp08sBuz4bF0w6g27rWjhnW/UsAjPxaWmVq/AlxDdaNpf/D8UyUZafYG/AP?=
 =?us-ascii?Q?lvdnzYq6bjsIkkh9wGNlGu35jVEsCcKpgCazT+dqonehWkFfwp9bi2pV0xNj?=
 =?us-ascii?Q?N3Pbm29qGPOkljn3qNaaa9YoNEuOVj7eF0CfBQuE/oEmaXzfd3+SQ6A/Ue1U?=
 =?us-ascii?Q?EA/5lLLe0Eox5gqZ5/xKlaTE+auS2h2cVg0Sw34Ikc/io2Bg4LqI/8D+sNq2?=
 =?us-ascii?Q?4gZGBj+eu6iEEOd8fvCBDxLKrvaFROOigZpFMxYytsZz432NphiBw0bsmHCe?=
 =?us-ascii?Q?GgFkQuJSlH7umqBnTJN0p6+HmYdJvv78/gh/sDx3QCvRhr9MbgieaKuJXSIU?=
 =?us-ascii?Q?upPWxu/qT9VbyvqwCv6pn0rzTiInT+LOV7mj9SaFyDEr+cea4Sml7U8lCxtn?=
 =?us-ascii?Q?f+9UvoUwq8pB86sO/q8BSxFqYkJCSOfvA8s520T6qocPZtUKYUqjpjovpYS8?=
 =?us-ascii?Q?KPXRpLtL5szIsnzgcjiPB1aonYW19j69KBx9BhQ3HUfbKjyirfV7kcYHf/yG?=
 =?us-ascii?Q?EHbKQokFgvAhojf1SB2ACpfNje8YhG1bCH1Wx+TOpErMIpwFMq21otnuaT96?=
 =?us-ascii?Q?YoKUyxcZV8VQWRIMZ4IIFtwdt54XM+0Japfgt/PJalCktmFVJou98iCYy6HL?=
 =?us-ascii?Q?SizBZGYkwLb9hd1t486J5st4Qe9Y4mFbEWsLVTlSlAeiLmbVSMuDue9x1W1z?=
 =?us-ascii?Q?eEsSMY6BFawSNTno4+ctRHT0CSTvPdAgHtT9Zn52LfTiV1Vgtp4nalaoAUG5?=
 =?us-ascii?Q?xoFUFUI4a0ccNdzoHRdSTyX/PZysjzqqa2c+XinKiBHmNz1peYckf0OQOPvs?=
 =?us-ascii?Q?h5OdO16UbYmd5/gsgAMRlQlE6epJ0FxdN0nOs5k8QMIo4gFuE24M676WQDaj?=
 =?us-ascii?Q?RJWxIgqYvVHkfc3aTH6kF2NJmiL4qPFKamx92o7OHWLaigohlt2Sbs4hC8+V?=
 =?us-ascii?Q?JrKqm34RpXhkJD5dwF2kpbsbgjfF81OiNN4dMEHBh8P0YzZAZsJdZgPS8AlO?=
 =?us-ascii?Q?NZT3r2cHe4AAWifgKNwuenYZzFfC0xLow1UZ3ctkux/z3i/zgEOWEBr0H6Yv?=
 =?us-ascii?Q?DWcNPWY+X5RyC3kRGjc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28dbba6c-cf2e-4d25-b5d2-08dbe77c486c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 14:48:37.9724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +aUnNRBJGw4JYBS00mnMgIcX11XqlPJmMh3OteMEvLPDTcu2nJtbL0F1uEzEXRRwI2LJPJYSc4ssh38VLZL7EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 17, 2023 7:31 PM
> To: Parav Pandit <parav@nvidia.com>
>=20
> On Fri, Nov 17, 2023 at 01:03:03PM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 17, 2023 6:02 PM
> > >
> > > On Fri, Nov 17, 2023 at 12:11:15PM +0000, Parav Pandit wrote:
> > > >
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Friday, November 17, 2023 5:35 PM
> > > > > To: Parav Pandit <parav@nvidia.com>
> > > > >
> > > > > On Fri, Nov 17, 2023 at 11:45:20AM +0000, Parav Pandit wrote:
> > > > > >
> > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > Sent: Friday, November 17, 2023 5:04 PM
> > > > > > >
> > > > > > > On Fri, Nov 17, 2023 at 11:05:16AM +0000, Parav Pandit wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > Sent: Friday, November 17, 2023 4:30 PM
> > > > > > > > >
> > > > > > > > > On Fri, Nov 17, 2023 at 10:03:47AM +0000, Parav Pandit wr=
ote:
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > > > > > > > Sent: Friday, November 17, 2023 3:30 PM
> > > > > > > > > > >
> > > > > > > > > > > On 11/16/2023 7:59 PM, Michael S. Tsirkin wrote:
> > > > > > > > > > > > On Thu, Nov 16, 2023 at 06:28:07PM +0800, Zhu,
> > > > > > > > > > > > Lingshan
> > > wrote:
> > > > > > > > > > > >>
> > > > > > > > > > > >> On 11/16/2023 1:51 PM, Michael S. Tsirkin wrote:
> > > > > > > > > > > >>> On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav
> > > > > > > > > > > >>> Pandit
> > > wrote:
> > > > > > > > > > > >>>> We should expose a limit of the device in the
> > > > > > > > > > > >>>> proposed
> > > > > > > > > > > WRITE_RECORD_CAP_QUERY command, that how much
> range
> > > > > > > > > > > it can
> > > > > > > track.
> > > > > > > > > > > >>>> So that future provisioning framework can use it=
.
> > > > > > > > > > > >>>>
> > > > > > > > > > > >>>> I will cover this in v5 early next week.
> > > > > > > > > > > >>> I do worry about how this can even work though.
> > > > > > > > > > > >>> If you want a generic device you do not get to
> > > > > > > > > > > >>> dictate how much memory VM
> > > > > > > has.
> > > > > > > > > > > >>>
> > > > > > > > > > > >>> Aren't we talking bit per page? With 1TByte of
> > > > > > > > > > > >>> memory to track
> > > > > > > > > > > >>> -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > > > > > > > > > >>>
> > > > > > > > > > > >>> And you happily say "we'll address this in the fu=
ture"
> > > > > > > > > > > >>> while at the same time fighting tooth and nail
> > > > > > > > > > > >>> against adding single bit status registers becaus=
e
> scalability?
> > > > > > > > > > > >>>
> > > > > > > > > > > >>>
> > > > > > > > > > > >>> I have a feeling doing this completely
> > > > > > > > > > > >>> theoretical like this is
> > > > > > > problematic.
> > > > > > > > > > > >>> Maybe you have it all laid out neatly in your
> > > > > > > > > > > >>> head but I suspect not all of TC can picture it
> > > > > > > > > > > >>> clearly enough based just on spec
> > > > > > > text.
> > > > > > > > > > > >>>
> > > > > > > > > > > >>> We do sometimes ask for POC implementation in
> > > > > > > > > > > >>> linux / qemu to demonstrate how things work
> > > > > > > > > > > >>> before merging
> > > code.
> > > > > > > > > > > >>> We skipped this for admin things so far but I
> > > > > > > > > > > >>> think it's a good idea to start doing it here.
> > > > > > > > > > > >>>
> > > > > > > > > > > >>> What makes me pause a bit before saying please
> > > > > > > > > > > >>> do a PoC is all the opposition that seems to
> > > > > > > > > > > >>> exist to even using admin commands in the 1st
> > > > > > > > > > > >>> place. I think once we finally stop arguing
> > > > > > > > > > > >>> about whether to use admin commands at all then
> > > > > > > > > > > >>> a PoC will be needed
> > > > > > > > > before merging.
> > > > > > > > > > > >> We have POR productions that implemented the
> > > > > > > > > > > >> approach in my
> > > > > > > series.
> > > > > > > > > > > >> They are multiple generations of productions in
> > > > > > > > > > > >> market and running in customers data centers for y=
ears.
> > > > > > > > > > > >>
> > > > > > > > > > > >> Back to 2019 when we start working on vDPA, we
> > > > > > > > > > > >> have sent some samples of production(e.g.,
> > > > > > > > > > > >> Cascade
> > > > > > > > > > > >> Glacier) and the datasheet, you can find live
> > > > > > > > > > > >> migration facilities there, includes suspend, vq
> > > > > > > > > > > >> state and other
> > > features.
> > > > > > > > > > > >>
> > > > > > > > > > > >> And there is an reference in DPDK live migration,
> > > > > > > > > > > >> I have provided this page
> > > > > > > > > > > >> before:
> > > > > > > > > > > >> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.ht
> > > > > > > > > > > >> ml, it has been working for long long time.
> > > > > > > > > > > >>
> > > > > > > > > > > >> So if we let the facts speak, if we want to see
> > > > > > > > > > > >> if the proposal is proven to work, I would
> > > > > > > > > > > >> say: They are POR for years, customers already
> > > > > > > > > > > >> deployed them for
> > > > > > > years.
> > > > > > > > > > > > And I guess what you are trying to say is that
> > > > > > > > > > > > this patchset we are reviewing here should be help
> > > > > > > > > > > > to the same standard and there should be a PoC? Sou=
nds
> reasonable.
> > > > > > > > > > > Yes and the in-marketing productions are POR, the
> > > > > > > > > > > series just improves the design, for example, our
> > > > > > > > > > > series also use registers to track vq state, but
> > > > > > > > > > > improvements than CG or BSC. So I think they are
> > > > > > > > > > > proven
> > > > > > > > > to work.
> > > > > > > > > >
> > > > > > > > > > If you prefer to go the route of POR and production
> > > > > > > > > > and proven documents
> > > > > > > > > etc, there is ton of it of multiple types of products I
> > > > > > > > > can dump here with open- source code and documentation an=
d
> more.
> > > > > > > > > > Let me know what you would like to see.
> > > > > > > > > >
> > > > > > > > > > Michael has requested some performance comparisons,
> > > > > > > > > > not all are ready to
> > > > > > > > > share yet.
> > > > > > > > > > Some are present that I will share in coming weeks.
> > > > > > > > > >
> > > > > > > > > > And all the vdpa dpdk you published does not have
> > > > > > > > > > basic CVQ support when I
> > > > > > > > > last looked at it.
> > > > > > > > > > Do you know when was it added?
> > > > > > > > >
> > > > > > > > > It's good enough for PoC I think, CVQ or not.
> > > > > > > > > The problem with CVQ generally, is that VDPA wants to
> > > > > > > > > shadow CVQ it at all times because it wants to decode
> > > > > > > > > and cache the content. But this problem has nothing to
> > > > > > > > > do with dirty tracking even though it also
> > > > > > > mentions "shadow":
> > > > > > > > > if device can report it's state then there's no need to s=
hadow
> CVQ.
> > > > > > > >
> > > > > > > > For the performance numbers with the pre-copy and device
> > > > > > > > context of
> > > > > > > patches posted 1 to 5, the downtime reduction of the VM is
> > > > > > > 3.71x with active traffic on 8 RQs at 100Gbps port speed.
> > > > > > >
> > > > > > > Sounds good can you please post a bit more detail?
> > > > > > > which configs are you comparing what was the result on each o=
f
> them.
> > > > > >
> > > > > > Common config: 8+8 tx and rx queues.
> > > > > > Port speed: 100Gbps
> > > > > > QEMU 8.1
> > > > > > Libvirt 7.0
> > > > > > GVM: Centos 7.4
> > > > > > Device: virtio VF hardware device
> > > > > >
> > > > > > Config_1: virtio suspend/resume similar to what Lingshan has,
> > > > > > largely vdpa stack
> > > > > > Config_2: Device context method of admin commands
> > > > >
> > > > > OK that sounds good. The weird thing here is that you measure
> "downtime".
> > > > > What exactly do you mean here?
> > > > > I am guessing it's the time to retrieve on source and re-program
> > > > > device state on destination? And this is 3.71x out of how long?
> > > > Yes. Downtime is the time during which the VM is not responding or
> > > > receiving
> > > packets, which involves reprogramming the device.
> > > > 3.71x is relative time for this discussion.
> > >
> > > Oh interesting. So VM state movement including reprogramming the CPU
> > > is dominated by reprogramming this single NIC, by a factor of almost =
4?
> > Yes.
>=20
> Could you post some numbers too then?  I want to know whether that would
> imply that VM boot is slowed down significantly too. If yes that's anothe=
r
> motivation for pci transport 2.0.
It was 1.8 sec down to 480msec.
The time didn't come from pci side or boot side.

For pci side of things you would want to compare the pci vs non pci device =
based VM boot time.

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

