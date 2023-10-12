Return-Path: <virtio-comment-return-7693-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AF9CDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 11:47:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1613DC6106
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 11:47:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EA322986837
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 11:47:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D403E986474; Thu, 12 Oct 2023 11:47:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C470798660E
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 11:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaJ6Oy34xX9kJ+MlIK/rb0y11LUm2hUbk/KTh+CwdUEe5QTr3QegIVBCpXEgPvLv5N7SQB45EZvCVkZDp478IYudbLe6AD/yE3JtLO0OYZa745azO5a8nTPbGkfB4AUV+e8dRHxzWzt7MXowacou8E0StOmBTdxhV5YZiNidN/F8LhvxMvh/K/DhIoM7vYMWPpSttEPGSKSKVM4UHHsPxvECVKkoBycoZ4bmKp7afL9xTt8sHtwvQkFw9v8NfA6/U7VOugqN69+5NPaXkihdESHVM6QuvtWqf2Nr9iAacYK41b8kQEes0fP0QVLniWWUL82YcaKmrrmup9dC4EfIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQn0C9+lwoQ0/iq1p4OUvpWIpKUo2lDxA6o0vbFJxnw=;
 b=BFLVSxurI4QKbDkF/8dnvbsl/YSm1wySq/CA7hXEG36PjLeBlBwdfyZalWP/TjFAXI5pJvGxKF0nptpWZvQ3cip8Ayo+sBNVviJXZTCX72txczpWyM1q2LPoTbkSOP6uR8ZjX25rJoveCmo3drOXwJ5ru7fIg3QIJ1YnIBVvqq+OWO0uj7tcSX+ZG53pT6lBWkLwU1JJvtuA5VmUDMkJcjErSqtflKfUs4Go5cwzUs2hZneopVE7Xl4hdOiB+/HBJlEPNumNEjOcnrhNeYtJ7V0VjqPUFxzFJKBnusp62fvbpTJEUAsooutCrWDvZkFhj9/qI3+AjZajsyv4fL6nGA==
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
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAAPQoCAAAbKwA==
Date: Thu, 12 Oct 2023 11:47:05 +0000
Message-ID:
 <PH0PR12MB5481B9BBAF8141F1C606AA1BDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231012071355-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231012071355-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY8PR12MB8364:EE_
x-ms-office365-filtering-correlation-id: fdfd62da-ad8f-43e9-00ac-08dbcb18f536
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uaPRwvXAjwMYfFtkQD0Tn2jzhEg8NVsVqZLvtphtzvH/gKNDVa2N+lYbgF4Ca8VxhQt6NcBdy7nzEf3QU5ETmb1ITuWRQJq0cxwwVo49PcnVpl4LH7JE/jF+OlzaBHzguNDt3VrKhUnVes4/v2NOA6U0bMHQsRiL/hpFgI0/XtqFH/CFhJfgcQ2pQtIaVGiyW1No1DxrHwmCiGxYLSCkgYqHiCfBsUo2HJkrnXxOmjG8XzmycQBetm3Ew7VCI8OsBNk14KJ7PPEM78Lt7/bl05g61/bJIFrZzbEyQVB4aoDCvfSxQ2dnAfhFHglFtHVRjN3R5gZbr5ijtVqib5WttlOUQLFnbKPUryYqOVCIn/zV+wFdrgIfNkMXMfu8BuvHk2fDHuc27AsDjGEuoIKxbJcACEOrpZdbcutI/wAPMZpiZd0JqRIB6qQN+EdwlVLhN7aUga4chZFpCIh2ZZEqzlpo7/nlRH7aCMnwGdlEIcY5zf9U0MDKRSmmU3+Em5/xCrWMNE8WSaPb4233RhDNNjBmd6Nz3psZoGBtR15nEeyMedahehihTTvBKL8Y4MSQvE+T5A8nZUriu6lY3QJqxWODwsWS63qmxqPNq6Feg7Yg0QEpnM5iw/Aeej6/uRch
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(366004)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(9686003)(26005)(6506007)(7696005)(107886003)(71200400001)(55016003)(66899024)(478600001)(8936002)(8676002)(41300700001)(4326008)(38100700002)(5660300002)(4744005)(38070700005)(122000001)(2906002)(86362001)(33656002)(52536014)(64756008)(66476007)(54906003)(66556008)(66446008)(66946007)(6916009)(316002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kFBSGm5/pOYYJ8iAYYaGQFbqW/k9sLwesq1WZGh7dTel/Zijr8+5GLa44Nrg?=
 =?us-ascii?Q?IkFwvdBIECbtagiplSJHCVoig9iLKm1oJHB7HxOuZBp4lTAkH+gm0A7ElOO+?=
 =?us-ascii?Q?ALZBHrsiFp2cF1FcQvbk8GW042mgVI46RVTcj4VKKZ70USkrP1Ijf1/vSvcL?=
 =?us-ascii?Q?43G8kN1MCdLJiEYZaoT7mWGHHc5AGlD7UXhgnmEAoZihwB+8toeFuMAKRH9m?=
 =?us-ascii?Q?slueDjQLvBPzWlKz/+E8lTJKmv7dEOt6rx4usti6Agand86M/F0i6miwMiXI?=
 =?us-ascii?Q?xBMob9qHMeLCSlSAHBiisQmfwGcaPMC6zdSIzbIOJAVaFFMs8Nt7mLbqhYlo?=
 =?us-ascii?Q?cIoXaLa/wnGU/MOXtcKfwyBAN0mG1gNTybDpNNBxGNwVoBP4GKLItM0IFD7g?=
 =?us-ascii?Q?0DI25XONCDF59mD0i7uqQUv6Av6YayOUWvG2rKuAkBa3f97RErpVwerSVsu0?=
 =?us-ascii?Q?lse0ZphcbqALJpUWNN6qVmFyjf4lw6Wk5cbl8bF6GSVkdn2eav7fxJJGAtBe?=
 =?us-ascii?Q?RUWHaMTvKgzvKEzZvIGh97U80SjwOycpdCKHSFbAQZ8WVEJxAkpxdD5ov+cz?=
 =?us-ascii?Q?QqoNS/rmZLlKmYsOfCVGKNzxbIVIHfGXqTiMOdYXgjDWBCEF58mO+d9kVkFr?=
 =?us-ascii?Q?yQL62P/PZ7imxSPsoqmj76ZhyHYQXG6ES3U8McdQp8F+Qt3k1czbei9Jlsez?=
 =?us-ascii?Q?Lch/8Jt3ee6tuoNS8Ie7xWkHkbFHCAyi50zr8sb6qgtElfKjDIQCDtAVLiWK?=
 =?us-ascii?Q?7qcDeHPduq4whnYuosUWN2pHTYxrQUayYX6aV/No69ydPj7gyS+36VuL55lC?=
 =?us-ascii?Q?HJeK3TkFsCadFiOwexWP/16s1Ro4YLCSxCreJbV3dPnD3wR6QIoehkP5VU8Z?=
 =?us-ascii?Q?RkrcPTKsJeqVepefxZG3XeR6lJa9U4nbmDLHtVs1C7TV8BXN/Yxa8xsw39/e?=
 =?us-ascii?Q?v5bHJ/GezQl3mF+Yq4eatvUvZqonQTF9DhEsWqBZk18ceZ5Oba8Y7LHQfYfF?=
 =?us-ascii?Q?Insa/ig6lamgjCwLSD8CcBdnE3Xwgjoc6FV/8534m3AQ9yo+KB6RH16nGDC8?=
 =?us-ascii?Q?hB19lsvC2ulCT/oRXBPRKzr2/yk/Wss7ymLHHFidqVaAGJl5bRMlQQVEwzWL?=
 =?us-ascii?Q?LV95bty9wQke6sX7MBAGXcRTHSZnHCrGNpXNCJ3IQequGBEOAEEy0q4PNHl+?=
 =?us-ascii?Q?78Y1bzm2dPGwS/eHGoi/W3zJCPojqu8W9j/h0H3g/lxP7HhsMaSbjiWD1Uif?=
 =?us-ascii?Q?bCylxjglqsjgMjvXdlFA3sihj6/cUYC5BPYULTGwSEx5w5uELZNpNjX/4/Td?=
 =?us-ascii?Q?Vmp0iqOlk2S+UhsWy0J4VL7bxEGsM4AY8tdqRJdHclzW0AxQk1EXjeKWlO+7?=
 =?us-ascii?Q?t245SfKYlayeVKu0yzvwndGquTTZlMwfgtNEewomGem+O2cInovauiieMX7E?=
 =?us-ascii?Q?rUAXRRsysdlNecNElZNCN1wK4wN1Ge5wbIdPc0ODRAO34TpEZoPCqUd5KZ5Q?=
 =?us-ascii?Q?xjbs7JuwgV+iR8U5640YsqZ8VGJg+lBHsCuDy5ySdnQtG/E8f5nRzcNrBNc9?=
 =?us-ascii?Q?xVDtw6BYE023qin7TYY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdfd62da-ad8f-43e9-00ac-08dbcb18f536
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 11:47:05.6185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l6WlWbooBHZff95Ii3YPGq8bF6Gxt8/Gubd9JufX1nfstjqGUNnfv1PikvlsWvd4iiBCptdFuh5CpwpRSRG7/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8364
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration


> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Michael S. Tsirkin
> Sent: Thursday, October 12, 2023 4:48 PM
> On Thu, Oct 12, 2023 at 10:58:14AM +0000, Parav Pandit wrote:
> > Sure, as I explained the config register method do not work for passthr=
ough
> mode, and does not scale.
>=20
> And on the flip side, to be frank not everyone has huge guests and number=
s of
> VMs and a slower memory mapped interface for small devices might make
> sense.  What we need to do though is make this a small non-intrusive part=
 since
> it's not clear such embedded cases even need live migration.

I almost sure, I am misunderstanding your point.

If the VM is small who may not need a performance, may be hypervisor can ju=
st offer
VIRTIO_NET_F_STANDBY.

I recollect we even accelerated VIRTIO_NET_F_STANDBY flow as well.

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

