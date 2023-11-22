Return-Path: <virtio-comment-return-8550-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276C2C61D97
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 12:03:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5C7D82AEE8
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 12:03:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 337E89868A7
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 12:03:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 19B9D986895; Wed, 22 Nov 2023 12:03:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 08877986896
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 12:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsK33XcF3FyMJ7rqzvAUFb5r7eJQ8ffG9fCzyrvlqKSnNUvM0UfzMV0Ra+hEoyk+Tj7LNZycu/FJCeNzSG6W968aYOWnH0oVK0cRlR0ZcB+irJ9VosKkvv0+9BLNIimgK8uOnXBP8c4PdyW0XyyJcyl/EeVgHXBb8cCXGIaT5v13wlU6BWckQJTyoVevxzYnT/d4GEch/qID56Cyg3yPgf2s4FPZF4O9QmdHQRcUHy/dKnkR7PSBho4GqKQqYNbv9OaHR82Uuf6eflbmSZwoxBENDDJx+6nNHe8ijN0VMQx2CcSFUwM128bLIKwzz92obn5xS2gKEn4T8O/87zr6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xfr2gKIm/gKDFcm/4TTaRv2H2hvxGSkcv/ZXs3zy/CU=;
 b=A44X7p20A1UXWGHD+W87DfdoVibjrTqN6tOHcJpAEaBUR2sgipylnEb0UKnwFnQsFjrylmindhXELD7evMS+plHES3grfEQcqhe+qLwrYC7L5LASDvwe2GZF4u+SlPvqMVkLf+gl20rMA/bcp+3JLOWRo1RfMdmu3uFBB5LXHxiqd1VdLU+loW106DnERGl0rWgqKs5k5pQ51YdqCRbBCVXPHqTsUFn1upeOlR/h5ANpQRA3fI9q1x/+26VRVHYpn32JOBEXtnp06L69GSO+hREf6pNZFceBTV4fO0BVoho5lIpoF2lYc664/KvTpblw1S9kxPZxLafjrNeuiXFvBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>
CC: "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Thread-Topic: [PATCH v6 0/5] virtio-net: Support flow filter for receive
 packets
Thread-Index: AQHaE9LvQ+6uKAfIN0Kopom3Mm7xhLCC0snAgANzHgCAAAnoMA==
Date: Wed, 22 Nov 2023 12:03:29 +0000
Message-ID:
 <PH0PR12MB548181939B436F36B01A8940DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <PH0PR12MB54817956B291856378B4B013DCB4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87cyw2kozt.fsf@redhat.com>
In-Reply-To: <87cyw2kozt.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB9079:EE_
x-ms-office365-filtering-correlation-id: 0856ca71-876f-4d92-cbe3-08dbeb530a4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 o6wFF8xIC8I5xKFe5UCxPb7P84XfzYMpSex2WWyk/0Oi8cNMyLVW3mzzwwinsLSY0NhCPMx5SYRFBJf2C+fPdAdsXS9OWQPNPAMDtu/FoPdmYmM3sKLt/biKkN6wcn5AKNnNtVlvigAJW/rmh0yblPE2hQMYD4nxPae9QS+KFF6v05xYdREw4DfMw9ijDNJ2kmp4+qUQJ3BhmY+pQg2itOcdw3M4tl34h8pipKl5J7WQ7HoPpnKxFxSOu6lV/1dawXMmTA4NEQNEYaEakzyXrIXSwhr6ia9ISOCDKXheEGzAPT92JfMhKF1t5U7lNmPxTHS2cmkkos0fcDOMoUN4/9ssrMzNkNK/fDjzWVhnoBorheMfZk7fyP1j/DzTYl+niOcGphgAdc3uDYTQC5GS5aXEy50O062zg4ennVo5Z2B9oYUn/axueN8BLUTN6LQy5WYJ7928aLDjVWj1LMQdN3Fz/YBJK/acXzQYZwb3+ntjdOSEmJpD3hwZBwvbpDEADT+1mBBOhzE77JcDvCuKjp+XXmXCrfTYBnd0lgg8tkSNfVjXh2NJpVzS5tXWFyeTn17soj6Lgeq+4FECL397jcxPR4/6A0UOmqb95X7u0p8nemcBUdpCljm1oeMc6U2bp/bKnLay7+n2Sxz12PFeoNdYRTrr5fPOmmX1CWTvzHU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(366004)(136003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2906002)(8676002)(33656002)(52536014)(4326008)(38100700002)(86362001)(5660300002)(8936002)(38070700009)(41300700001)(55016003)(9686003)(26005)(71200400001)(7696005)(53546011)(6506007)(122000001)(83380400001)(478600001)(54906003)(110136005)(64756008)(76116006)(66556008)(66446008)(66946007)(66476007)(316002)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sL72kWQffdPtrNv7dkJMYJpKlR3ShtxXgkyr1lnHDlSdCyDJ43CcJjGlTLkN?=
 =?us-ascii?Q?AILj5qNOz7Mv/hqRot6lx4fhb7ZWf9xgxoDTOnnHCysy0V4YlZuKk3mkXo16?=
 =?us-ascii?Q?5ieYXOwy+JhmXx/JShetqC5WHWfVRz3JOGwR2w2lMfuU0PQDqHFnjKbRSwYM?=
 =?us-ascii?Q?N8e/rNCI71LxD3AT3XXtdd12/vRmuZjGskcH+VDKb+CtT9JnRu62Gug83fm+?=
 =?us-ascii?Q?rgRtbTkPZIqEvyFfQJx7fKb/IAXTFqpdN2YmJQFc81y18ShT1ikIkrF7oMMe?=
 =?us-ascii?Q?8rh11n7c9AW/uUG54T8Bm+PRP+KRn65bN15JpmsFzXpCJ9VcGS+NpE1q88sb?=
 =?us-ascii?Q?IcAje5ww7oN/Q/Ajy1nC3ARSQH6OpDg7SjzAOuRUViSmkhR7QlcLIEjCqsUD?=
 =?us-ascii?Q?99QqyC1ZYzGRuGvM//2X89uLtnzJ2YUw5iw4kVaiv9ep3Yy3GmLZ09QpyIwY?=
 =?us-ascii?Q?YHrLLn53tx9ebiAdBgSCL1mZRNOrjNkegZiJhInpzgwpRIfaoMwwyeU1/pq5?=
 =?us-ascii?Q?N++wn1r4t4uw2lDCPMj4Y6wTiQsnzxBIuW3311ox3Tu3cHl+u6bplfJgswuc?=
 =?us-ascii?Q?EhD0dCmi+oqV6W66SAuatfqXwblSsb9sIjSc+rZf5llIXyeS82gdwt8IH8sW?=
 =?us-ascii?Q?+HndXPKu7HM6R/BX++WQsm36wvjRys+33uo+R0X2af65xZIZym91K5KmXz7n?=
 =?us-ascii?Q?zkbimB2rJ5yiAh4uMPxP3pjouxa5V5o6sCYpo/jzzQwrqX0vECkaYjfNt7QE?=
 =?us-ascii?Q?osP/n9XSRe/zCvYTTBoPn1/ZuHlKWhkRJSF5ax4snTV2L+4FUai5M5j2fMpm?=
 =?us-ascii?Q?ymXi1oze+Zf6rJrHbdDMSXioYxI2kCYoEoKe9rEl4LNBJALPp+mm4SxFx1pI?=
 =?us-ascii?Q?Bv9iJOboqd9YD82E8kgxJ/rG5anFpYobx4dzJBTI6xk8VfyTvPIpj2wXgXE+?=
 =?us-ascii?Q?o75pZBZmzFF7z5FojCQrGZ99xQOhiabKGH4srA/3Qh0zXnBoLhp7su86lc7C?=
 =?us-ascii?Q?b/O8t5ef5g8Jv3mK3zeu+iGZQkV+t1V/yHvK6XrL3PWyPbXoknyFedLIRrx5?=
 =?us-ascii?Q?v1vKSPwbe9zXdevcUj8sBz5IkxKrXosOgn5nxfZCsNgwnuFwCpCJy0qT9U0P?=
 =?us-ascii?Q?1ao+pWy2CmpDGDjWr7WS7Qtvg/QiJP9WcCeqONdgrMfvc9USetfFV9JZvIHI?=
 =?us-ascii?Q?y7g7nTpsuZtNod+ke+L5MF/Z/Mf5Zyyk4mrSGlhqUmkjzHHVqLFNjI8mhtuE?=
 =?us-ascii?Q?7C5k3J5GmFx+hRBuh7nJFW6tGmbXEGP32/L/xiGX/Ujcx2WQb4V8GXhS8YQy?=
 =?us-ascii?Q?vWKLriCJiibKEi9mMmKIsMXPyQfYclHs3hhuHDpYFT3sVb9YhtxiqpL1dr4/?=
 =?us-ascii?Q?+4ZTgsfVAs5KeYmM/rh6yQtkhMfAOlEx8npFsbPaN6kLguPSvAotw+3V4m15?=
 =?us-ascii?Q?OtbqDUtnyxHMIGiKG2wNP03DYXihkKtqXh94FDr+yY4G86N7kx8s9rpqvQ5L?=
 =?us-ascii?Q?MTCMcORp34jE2TsKnAN7gkWHL+BNeUh2Z3KUkbPak3RXU7BK0p9+0MpqzCNe?=
 =?us-ascii?Q?u72XyiTGUF5K5LrLRXA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0856ca71-876f-4d92-cbe3-08dbeb530a4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 12:03:29.0299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UtAKI/wz4Wul2BflWOeA3DmYKeVnmXwfbAqxseV3MNYbyIZmfg+PLD6MV04NNGvzlLD7BOau96txZZA1Az5eww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9079
Subject: [virtio-comment] RE: [PATCH v6 0/5] virtio-net: Support flow filter for receive
 packets

Hi Cornelia,

> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Wednesday, November 22, 2023 4:57 PM


> On Mon, Nov 20 2023, Parav Pandit <parav@nvidia.com> wrote:
>=20
> > Hi Cornelia, Michael,
> >
> >
> >> -----Original Message-----
> >> From: Parav Pandit <parav@nvidia.com>
> >> Sent: Friday, November 10, 2023 6:09 PM
> >> To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> >> cohuck@redhat.com
> >> Cc: sburla@marvell.com; Shahaf Shuler <shahafs@nvidia.com>; si-
> >> wei.liu@oracle.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> >> <parav@nvidia.com>
> >> Subject: [PATCH v6 0/5] virtio-net: Support flow filter for receive
> >> packets
> >>
> >> Summary:
> >> =3D=3D=3D=3D=3D=3D=3D=3D
> >> This series improves virtio net receive packet steering to
> >> forward/steer packets to specific RQ.
> >>
> >> This basic functionality will enable Linux ethtool steering,
> >> Accelerated receive flow steering (ARFS) as starting point, and more u=
se
> cases in future.
> >>
> >> Problem statement:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> Currently packet allow/drop interface has few limitations.
> >>
> >> 1. Driver cannot add or delete an individual entry for mac and vlan.
> >> 2. Driver cannot select mac+vlan combination for which
> >>     to allow/drop packet.
> >> 3. Driver cannot not set other commonly used packet match fields
> >>     such as IP header fields, TCP, UDP, SCP header fields.
> >> 4. Driver cannot steer specific packets based on the match
> >>    fields to specific receiveq.
> >> 5. Driver do not have multiple or dedicated virtqueues to
> >>     perform flow filter requests in accelerated manner in
> >>     the device.
> >>
> >> Solution:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> Flow filter as a generic framework to overcome above limitations.
> >>
> >> Overview:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> A flow filter defines the flow based on one or more match fields of
> >> the packet, defines an action like drop/forward to RQ.
> >>
> >> The flow filters are organized in flow filter groups so that their
> >> processing can be ordered when multiple applications wants to use it.
> >>
> >> Flow filters requests can be transported via control vq or dedicated
> >> flow filter virtqueue so that it does not get intermixed with other sl=
ow
> operations of cvq.
> >>
> >> Flow filter requirements addressed by this series is worked by virtio
> >> community at [1].
> >>
> >> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> >>
> >
> > Now that this has been mature phase and on list for several weeks, I
> > updated the github to point to v6.
> >
> > Can you please start the voting process?
>=20
> I don't feel like I'm capable of judging the networking parts, but I have=
 a couple
> of wording suggestions (things like definite articles
> etc.) Would you prefer a respin, or a vote now and an editorial patch on =
top? I
> can either comment now, or start voting.

Your comments are surely useful.
I would like to fix your comments and do a quick respin.
Please share them.

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

