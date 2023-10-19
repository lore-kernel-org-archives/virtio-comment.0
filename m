Return-Path: <virtio-comment-return-7864-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33DDCDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 10:00:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 61DC819286B
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 10:00:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 444029868E1
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 10:00:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2F1E89868DA; Thu, 19 Oct 2023 10:00:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1FBCB9868DB
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 10:00:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOuW/i9xxEH1KSvwtMbiHohDQWibw7uZO1n7M6vL2AFP+7Cgn7XWfU334hyPypQCtbutVfcuUaumO4JhzvrNiXVXK5ikv0xb77goxElcTynRD6QbXPJmP76xuEfq1U/Mxy1SOYFdFASomMEb3M/sD2xd/YAGOztDYFAGv83YBHFZvt5+xiVmAU+0iJKvQBjW0leU9AdaBc24yw0UQEAtjMHChqVABfOLgrAQ6mhbjpAmjqVPCLC1ftONF2IL/oz19T36CWLOwCy7jX63xNvKMFSz84s8I9WaZmkJa3Sfh2Uec7vObBPItZfilSr7ytwBYs+tYAYgILVRUsvWavsiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UwV2YnJJUhKdRMQp1HuUthDwj3oe1KLrbJ608La2G0=;
 b=UDehiHIpSHK8S2f2hW1pONA6ps9n67QoUeNkd90Ta4vOdytCNTUZdddLorwY6FuPbWbNWwH/5j8difCekkmReJBNk7kZVbH+61oQT1wJ25U0Ozw6hhVETAs/4ezc/XvyPHC+Jrz83aN+mGa6PUNZpskruvXCn7Z9m+c7TXWiLfaRLwdjHp0YDpXWRIMQOnLYK0eCXJHgAk94KmHCOImMXxWSeR+urjgTDl/Twerh7gaHKXXilpoZ1UhjyO5PnqV2cGXfmGAbk4eHmfimP5a2+NKeTZIAUvYZF6r6c9anB9O5hthPQ+NTPJnzLtlbLRiy7SoUhc/g2tLL4yIOtsd+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCAABMfAIAAAMfQgAAfqwCAAAPbEIAAB1IAgAABSRCAAAMRAIAAAcwAgAACEDCAAAORgIAAATbQ
Date: Thu, 19 Oct 2023 10:00:20 +0000
Message-ID:
 <PH0PR12MB5481B1E4590F01F3EE16ED15DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019020413-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019041629-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481373C657AE3EFA123D1C4DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019050553-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819E1EAA41F3CAE420942ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019052328-mutt-send-email-mst@kernel.org>
 <20231019052725-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C638743682F55F11BA28DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019055251-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231019055251-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB7927:EE_
x-ms-office365-filtering-correlation-id: 4510f584-b474-45a4-a211-08dbd08a341a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Z6IYkyFhPgP2rxb8Bu4VNy0LWJaOy7zyC2Ml9AYoKh2W+CIW5jktV0B5EMpOgxSbjEXRldyr6QxFhJcfqaLq9j8YL9JKRt+cVCG6Vg9HDhyBnBATMXxPZc+kIncV4oZFaJtZgeSxnm3WcUWzy0ZclJ7/GRJ/rwL22+XyG5VU7vtTWkUKpM85BUDsW2NpjYel2jfp6HUgSjkiEKcHJ77P8nDbA1UO/LrFgm6jO5c4DJeg9H88H3fG0rsS4FjD/DAM380RKwWtujw38bHdc8CxnsWQHyAtSvblAZIIyhPeprMP+YhNUqc13P+BftHRz/b1EiAnVlVQf/r8HsYg4O+ODhy5jCEzfvM3plCS5WPuojRtM482lv2zMREj+MaaKCsQ05tFq2YYQg9eBKA0J/pKVDLAVNHQ7X+VRuXVpm8x69w0frsmsUU4PDwPtQWP2dEwVT09dq7bWfSUunZh4PppVFebXopxKGD35hkmGi+uy1eK91+GHgD69W14HGQuUyw56qlZdMFNvIIimctZeQTBMGFnnG8Vxn0+LtRNYJvK6a16OCZ6+Vuir2VSQEL5SdRjHAYtC+F2bqcvHYJfOTVjOS0kLyHS3jreyMCC4NA0oCD+UkY9a2W3CsL7flyt8oQ9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(136003)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(55016003)(76116006)(66476007)(64756008)(316002)(66556008)(66446008)(66946007)(6916009)(33656002)(8936002)(478600001)(54906003)(71200400001)(8676002)(4326008)(5660300002)(52536014)(41300700001)(86362001)(2906002)(6506007)(38100700002)(38070700005)(55236004)(107886003)(122000001)(9686003)(83380400001)(26005)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lo3EheEZHC9Dzzs31PsCLfCFyqiakTQ8uakeKo8WVXGouKCFB67h4tf+qA4e?=
 =?us-ascii?Q?1gNXQXfkB3XJcC6q5Ft51aoGk6N4ff9eCiVj+/2XhB00bIpzKsgPddJc3+Y2?=
 =?us-ascii?Q?IRi+nYp6KiNPguXRsAV37ZP6EoPKj2cvMREUdcOSgWCLMoOhu53H0ngdfcp/?=
 =?us-ascii?Q?Oitc+vmXVVeyKnpijUyPTOl4VKA+fFqu6t5iGlWFf6Dpe/lqSWHDh8RL5w1c?=
 =?us-ascii?Q?htQ5yKJ0bbX2uYHFm5qlnzG7Bqb/nsC1k2W3qNbfDUWkDSkGz+NK3CbNnPfF?=
 =?us-ascii?Q?OUDWq8YtLUaGQNQ4zr+qfYuojQQ5PwCLRCgyQg+2C2HcJfSuooNmQMQMJC9/?=
 =?us-ascii?Q?hg9K5IoRC2465UizAWPUNdIVoDuWbKaKWOhbHEhYiKqhMY9PxQBCsZD4sRga?=
 =?us-ascii?Q?fCB5WB0R3ISZOb/LeQdfE734mj9v59uzQ4f8JOWC55p9e8CATbc1tRjeuBBQ?=
 =?us-ascii?Q?TpU1n/Z3sQApOIvab+tt6m76WNvXAJ+4E+2oFJddFd9sab+65xbjGyTOEjs4?=
 =?us-ascii?Q?LeRc5fkI6Ah26ouphB3BhfjjZqZc1MuwIf0ZWLPADMAM4A0a/9Hm2O05uP+O?=
 =?us-ascii?Q?lv4h4EcFbSBPD62C/1pkbwmS4+rV7PihDHHhSo+UoERj30HzhkgQV/6RzzbW?=
 =?us-ascii?Q?/s/So7jtabsjiCze0fBzioawkL37QduN4+o11O3Jx5MAlZoKlU+dF719r3mI?=
 =?us-ascii?Q?jVPYmo5nyIAJ/bUjIOXXkRIzpZogd7VvP5VEbcoZnqdVrj5yqettcTP34fRj?=
 =?us-ascii?Q?C2zVFtIS0crGdwmnsNIaJs/j0BC31wRqrdGaf5LmhSu4hh7GM6iHBSvawQ66?=
 =?us-ascii?Q?B9GrLFrSZlKWEB3AhwElOSGhjvlyJX/l8ib2pSMu5B3gh8R4UaKq7Gy7Rbi0?=
 =?us-ascii?Q?KHufk4H7kf2kSirtttMFqNEhYdspVmBupxS2TfVVOouZnlWNljA1MK9d+ggs?=
 =?us-ascii?Q?9TmiL24l8gVjf4Ojb+xypXUCnxGpxwi4Tq9ubxJ2lDm0Dp+3P3Qn1ij56M5H?=
 =?us-ascii?Q?k9k1lt+/Rij54A0Ac0t7FTHaaf8mIh/D4UFBRwFglaOFhPXsJNeSt42nS+Xz?=
 =?us-ascii?Q?i7Nu4jY4qTgRv3gmSVWj7qxLpJ4nUu7E6CkLOl2fZzURFL7UwWp0DkOYjQoS?=
 =?us-ascii?Q?hKzRVwt6/n5OyN45/BGMBVc020gKVWMq7tK2GJ5ve9ubQ4F3xOB/s/0P5U0p?=
 =?us-ascii?Q?gUnkmOD1m3diwISSVuI5R+77gVsYnUXRtydONeef8y+Z4sMwgjgGppnTlNwz?=
 =?us-ascii?Q?k8CONITkrau8qiaKcoJXLpQ3B8+2ZiYe0DNye5cnut7K24b/wykAwF16MLow?=
 =?us-ascii?Q?hn7SjRFJ0qu2bkGK0VEADFqr5cZO/CdjLRiuYHIwstJ/v6LSRPc4VgQ7M3nz?=
 =?us-ascii?Q?vOkxiImZcUQXfqXxTjSPAzPZ2OB0jSGcfG6GMdzUSdztQGHu9O7mzpskYxnv?=
 =?us-ascii?Q?j3FqVGicQtgdxTWDdTOzTmGz2Q9W+EjWDjoRFErgA6IrLkMtRweNTFRxvXJY?=
 =?us-ascii?Q?W6IncU4gFnud0NBwF/FIwzGUDzH5Bbtaoyn/Owz0t/JfTT9Fme8ugyNxen8O?=
 =?us-ascii?Q?HZPDSH1b85YlaKq/yiM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4510f584-b474-45a4-a211-08dbd08a341a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 10:00:20.0960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qg/7D7gVQwwmjs9EzIiD4x209A436jQs6bJcVVc98+HG0wPKmxS4rNlJpA5acUmmFtOdsJ45vsjTnjByTKNRBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7927
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 19, 2023 3:23 PM
>=20
> On Thu, Oct 19, 2023 at 09:41:46AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, October 19, 2023 3:03 PM
> > > > > > With a capability you can discover it without poking at feature=
s.
> > > > > >
> > > > > It is discouraged by pci spec.
> > > > > Pci caps for mostly doing very small init time sort of config.
> > > > > Not to run frequent commands.
> > > >
> > > > Interesting. where in the spec exactly?
> > >
> > > And the reason I ask is because I'd like to understand the exact limi=
tation.
> > >
> > > In any case, we should still maybe look for ways to separate it from =
config.
> > > Maybe a capability points at a BAR and that is where we have this stu=
ff?
> > >
> > Yes, I replied in your previous email, a similar suggestion.
> > Lets first agree that it is drafted for non-passthrough mode.
>=20
> I could see passthrough use it too if there, why not.
For three reasons:
1. it does not survive FLR
2. DMA occurs on the RID, A vm can directly attack to this programmed memor=
y address in it if done without PASID
3. PASID is not available anytime soon in virtio 1.4-time frame on most com=
mon platforms.


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

