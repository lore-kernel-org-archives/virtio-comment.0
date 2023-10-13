Return-Path: <virtio-comment-return-7716-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F71CDB47E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:42:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A07E41922E6
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:42:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9A4A198683E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:42:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8FCB4986836; Fri, 13 Oct 2023 11:42:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 81AE7986837
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 11:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3I5cbVp1l5eW3OTu/nMc7JD+5grw+HX2b0v2MQoay54qigYQPrjh58q8gNtOlkWgE+dEzdQAgDCNLUbY6rSHvZw9dWxevjmdHnkQRmfDLYoirFG1pb05gQ2/9aPgvFbuQ9kDFYsp1b4F719ZsIp40tQsEK7q+gQTw/UC4YzKXaRfx/H7JilDWEYkRYulcekJ9vPYHr0r3ovV7K0UM35+Vhfpn1313/FtKtbd2Q2nEyuQg5yZF9E1rx9iY103fpxkAhI2uOLHxi+y9TsYbrc1rRLyGVAUoxceXgiQuo1KUDCMyGot1kiwkMkyYVgZdLjbGhbp2H/whLW6u0zBLzqFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1k2hupFdYJRKtnp2nL1OqukJPByiJ1FKWOtuBivGGw8=;
 b=cWl+mL6Uj4iuAbMFXIs3/66QYxQtO629cDU9LDom7hrXojTfeCYDhlB17pxWrpnrb+twCv45vK1uMshXGcQHyHSX7yfUjuUivIUQPPCTLBPUW3PPC++5359Q5OR7MuTsRNafVap71S6d1tsYLcshGSJNpqJBXpSCNSNlHj/6f5lCZNJGWEYsb27Saf2dmOw6MURd4RMgXApREoT30tHFOtkMUWd1t8jpQknXv+tSEssbx0z0JIQgZ3MaEdiS88ikppzQGuTukIYWMlBWeuIwjFaa0EYu5//uFZt7ZDcOBMEqC04PPfYJ62uEyM8GQYSHxg1s/qvtJe8q5g44xAFF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAF80QCAACfaAIAAA6Cw
Date: Fri, 13 Oct 2023 11:42:50 +0000
Message-ID:
 <PH0PR12MB54817A014D421C2AE26A86C6DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4a8bf09e-9aa3-4aec-a20e-8c92f3da3d3c@intel.com>
 <20231013072659-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231013072659-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB5669:EE_
x-ms-office365-filtering-correlation-id: b4047ff2-a69e-4e69-403a-08dbcbe187b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Kq1LS4QzUckleQrXCINuPAxjQ4fPCcxVlmR7bcAt/5zYotz9NCr7X/emyGzA59s+B56WO6kMcID8/MOF4Co15S9rLKMplBx60vpJA2mOJYidgSv0pBdHnna/3uyg2UxZSyX7CS871Xq8rFH7Rgf+NmaGe8WhaL4QYAc2W30nV/oB7D9OCRDIHEfjLK31owyUWtEAJQn03+z5S9hXceNHX7Os0j0jSm5mxK7spuXdZdzHiEsTc9piAQfq/tWPQ9vyAfHZDAUk0mUzldAHWT8eoJTSInrvd5su1pl8BZ+sHtyBHsllDo1z32YOf/M8kpRcHBPOQ9YeAC1e5/GQ/ErDU6dxQktW7b857thb/hHZkN5lI3N2RDUYvzpb/MQhN6E0S0nZHa+UWs1IAYK56AfTpNxNCTASNDFpNoyPp0xK4m/zFzWFWxeSQIwMnDeBEOC8JaUu3GBEgldjxgpi+2lADUXlSfmRdhRwp+jJjN89ZDxWo88zm42crVBHmXAmMfFfr/3bDx4yRVye99tBH11MBfiJ/iAirNC0rYU4uUzFfZg27YUOh+Z7tZSd3BbLD4l9LuBw64LRUR/AcKiA6/7uhKGdm1qiiC/sHj83u+eQqyLDz1zEyz1L+O9G+4FY0EKm
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(376002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(2906002)(4744005)(86362001)(33656002)(122000001)(55016003)(38100700002)(38070700005)(26005)(478600001)(71200400001)(8936002)(8676002)(4326008)(9686003)(7696005)(6506007)(41300700001)(64756008)(107886003)(76116006)(66476007)(66556008)(66946007)(316002)(66446008)(5660300002)(54906003)(110136005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AQMCxW4YYIudztsYA0u49E4LObOB24+zuHuxkeh89y7CM2DY3HRm/bD68VIn?=
 =?us-ascii?Q?/ZX7ZKbcxin0wNanCcQ/M8CUrieiGwnVz8VRs98EGc/nHHi97scS/kPmSBtf?=
 =?us-ascii?Q?Z6uVxgycx2TTGgkzhDVCvj/0VVUT2+KylUQEMsLQLBKGrW6iPdF9Olrs/J8F?=
 =?us-ascii?Q?9ql46LDDvS7fby5Bi8Vq4KqWy3o4V/aZZ59+jrv27mPJTe3kQNmOknblHcu/?=
 =?us-ascii?Q?toMovFYEE7giqSNkXdR22tCEQ/FqPFs541V0BYG0Kor1iJ/ivqSFOiZuRkVG?=
 =?us-ascii?Q?NqvtI60XheVaD6pDMVsF76/3px639Bcv8BmZV84ND1Sdwgj8y0CaCOrDaj0z?=
 =?us-ascii?Q?zSU6RWtsRioVP6keqg/wZ0Nbnl8Zu/jCoBgmhBpYdEojqTOsz7CusYXJ1u6w?=
 =?us-ascii?Q?+5T2MYs9RK6NHdjOBPsKb8Fy7Lz5PXuzEKDh3mW7mCygGCo4JS6/GnsciQiG?=
 =?us-ascii?Q?QYy1d6zNWG7LKuXE0oFe3rgXzs5AlqEG0JW67WVsFljX4jqqW8Y5Hq3LThaG?=
 =?us-ascii?Q?Rz0+bxroZ+fPvGWqq5PFgzF3mkirnQ5FpGZNxztySWKnVKDWom8L8Z8Kh8Iw?=
 =?us-ascii?Q?zhHEPMvEc+GgUyAYlnF9HtlmU4Cr4kzH541LfXskoMUsPLOJkXbZvop+aptp?=
 =?us-ascii?Q?ACLl51ZTT9bSGGRHgH4DsGP2BAu4Ff1qVG7BssVJiSgSK8G7CQh6jpXFMoyf?=
 =?us-ascii?Q?F3Y8YpUygN3f6rVvho2BL/GV7iqLONI1j3+RKcjURC5sfcg90e6GD2q5fusC?=
 =?us-ascii?Q?tBd1sk+FsvV3L/cVGp8HvpdluvJ4+QM/YsmHjtP7rFQkPwe5on1vAlWcjjjN?=
 =?us-ascii?Q?3sxrAOO9f9Jjm6VA9E9wfwgLG35xhuN083qc09bLCPiX/sXk0+cnRMXd8WO9?=
 =?us-ascii?Q?DrgMKnP/rEM4B0LE6QJ4a64lnffAt4ognApiwvIgmnHC6GCcS+CQmP5J/+Ol?=
 =?us-ascii?Q?JJ6XTaVT/XT/qRBnuvRZPG2gdrajulwR/a3n9QD2XBDN+M7V11aFDnkxwpuT?=
 =?us-ascii?Q?36CY4Gu6e6qeIZ1ShBH+kfWdR2xevRzC44dVIVErOZYIV7Ks7rAEnaGDlf6A?=
 =?us-ascii?Q?17OMbm6sowrA5qyBuZhOxbs3Q0xSCp2/k4qChTyRsK7MhsQxvu5Fe8Nt6Wp7?=
 =?us-ascii?Q?GwWJ1fm20uHy57Th6I2fXtWrNMfr5t+ydj0FpcfoknuFCniu9sg8UNHVe2tZ?=
 =?us-ascii?Q?O6JdUvfP/vtMpi0HE1tAnz/KzRTpEUb8lJ+C1b+WRwu3KQI9gIOSZhNpPs7o?=
 =?us-ascii?Q?r/mUyw3lQR0OXBA0qrVOpXtevWHG7JMDXv+LbU31DcZpQ4HCx4DLlWsOM/tg?=
 =?us-ascii?Q?8knQaRlwKdZW5dfD9jaN3HW49oWC7fsZwbBSgj2yhG7J1poUJu3Y0eaQdnYr?=
 =?us-ascii?Q?MLwvLcJdHxQyrJKJ1bAYAPLmB/sg33ZRCWGHB8SoRo5vLY30aXlZEIbgu/85?=
 =?us-ascii?Q?HxWAEwSLjch3TvDaSPEkUFl13XO/qTjuJVnwbnOF4zPHWYtED7oAolmubWBQ?=
 =?us-ascii?Q?rwEbx/qpNyaXXhQck7z+RoPNyklV8MQqe+6mZSZ6upwmxpoBeAu7zwsvG8ym?=
 =?us-ascii?Q?Y1zO0GwqQSMsJTOL2eI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4047ff2-a69e-4e69-403a-08dbcbe187b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 11:42:50.7916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWl8QHJLC1wXIw0e/Qvdyo4zbu8QlHvvkx97+F7vYUP02RygvVGIP8ZxUUKhnHrUVlHfWw+ECz3UnOCxW8PemQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5669
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, October 13, 2023 4:59 PM
>=20
> On Fri, Oct 13, 2023 at 05:06:02PM +0800, Zhu, Lingshan wrote:
> > Hint: how do you define device context for every device type, e.g,
> > virtio-fs.
> > Don't say you only migrate virito-net or blk.
>=20
> Indeed. I don't think anyone can avoid either defining that or leaving th=
at
> completely up to implementations and just hoping they don't miss anything=
.
> Given the choice I'm definitely for defining. Each device must grow a
> "migration" section documenting the context.

+1.
Just like how we have defined "device configuration layout" and "control op=
eration" for every device.
I expect the above section you define to grow.
We don't need to define all in one patch series. One infrastructure is pres=
ent, it is very easy to add per device section.

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

