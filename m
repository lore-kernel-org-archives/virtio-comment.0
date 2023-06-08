Return-Path: <virtio-comment-return-6250-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0F7C7EE25
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 15:07:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4849C1FF82
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 15:07:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 279B6986673
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 15:07:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1763A986655; Thu,  8 Jun 2023 15:07:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 045FD98666B
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 15:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cva3VT/vYZoRln+Kv5UuOJGlfXSuLJFOrh1iFFF59bSGYX+51WwxdO9aH2gwWeL96b8YmhwDFg9F5QUhsZUIPhidgbLG4SG1sMlzGcQLpZ7anGKxsPNW2rDDErl1m9vGzXT5xT6SmWwxIHrA3YjkiZsiiGgvnnmFFIeveQc1daf/TluZLkW9AC5B1n0XT48p0awmIT2EU+68rfUO5r+L6MoMUkTS2mDKXFyN3v2kAu0n4QepaI2LwcF17Kh4jB3DUAqMsLqnRnR/VWHfHN5WP7neKJDWb808WXFOgNQ1LDVTtiSER54e4/FQYOx2mrgDWiyNCYuYu6YHLJ2ivBmQ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XS8ztiU6lTFRkK2a80gkCiqRjH8uscGS+nIJU8K7hqk=;
 b=MIzsBs1Yyam62XF5uRLY3Kpyxiui42HvI6Kbxj2b4u0wYYKlX92a/FOdrvcU9aIeWyWTtlAhvxHJQ25uySclu6JabhXCx/iuZo2m2CkrtoPJS0fD7o/qk0+sJlOXMUGsI/hgpjrEFHFEHqirBZOKuwtICZjbpRvhvk6uPeTvXRWb+b+vPTyQriapYmr4i/UYrkabY0fAjRZU3T9Fy96+uYYWngQx+8XUBk4YZfml3ymW+OJFb8Y4xEXzuBbPHHI8UG+KIGyOfTwWZOkQDes3ttfKTvRfInBsVYc2pFfQgAc0PfhKtikAn3DibW1M107TBdi83y+fT5wMl1ip12A/1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "alvaro.karsz@solid-run.com"
	<alvaro.karsz@solid-run.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>,
	"longpeng2@huawei.com" <longpeng2@huawei.com>, Dragos Tatulea
	<dtatulea@nvidia.com>, "stefanha@redhat.com" <stefanha@redhat.com>, Harpreet
 Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, Shannon Nelson
	<snelson@pensando.io>, Max Gurtovoy <mgurtovoy@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
Thread-Topic: [virtio-comment] RE: [PATCH 1/2] virtio: introduce selective
 queue enabling
Thread-Index:
 AQHZmKAVwn3zg7X1EUufTilOdi6rea9+EGGQgAAWHICAAAA7UIACp7kAgAAV03CAAB/SAIAAAEMg
Date: Thu, 8 Jun 2023 15:07:45 +0000
Message-ID:
 <PH0PR12MB5481D283734489800705E99FDC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606175511.2337208-2-eperezma@redhat.com>
 <PH0PR12MB5481D1ACC60311CE48D622CFDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606151520-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815243B0C6942A0E5B6B5FDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWdKsbCiZqp=kNQOoaD6ooB+m2pcUB+nSLU3e5gCyLL1bQ@mail.gmail.com>
 <PH0PR12MB54814006554B79237E0C1282DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230608110415-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230608110415-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW4PR12MB6973:EE_
x-ms-office365-filtering-correlation-id: 1ba64975-14c2-4785-16bf-08db68321d7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ftUkV/HheX2pHEQMi3zNp7VE2vpATDhwq0jktKQfUW3vrz5ferP5jMQHcPb9Xo4xnNLPK4QIciIkx60WZEHIDPo1uzSLLGOTDwB1+luyGXFqu5JnNo77n+QAPXju3k5o0fLOByY9irvRNL90Icn9vWQlgcnDH5XtH+f7xWTQ72n7ZwaZBEdYLGozRde6XtjaSczQLJmLsBTntKGE47rRdYLtOaWx1fbMO4xPKB1Hj7iA106RqFqECp0HgDWeWqQo2JYa8w+ozp58/RD83i2et9LmAobfMGEak/Efl1OCbBZcdE2pVnPRs7BzIffDQonT3rY1m4dgo6BC8zidAjPkv/eZXyIDIFjBlUzb46qoaNo65flC2ueAWIWIK+IMc1WvYGpcsNwfYPrm6r6M4jKOttQ46+Ue8qCCIiCOW429kADIxhJU8sCpbgJpYyFGQyxsqF5oIlhMPinfefhKFHFPy48wI2rjefMsm1eD2E6MBZuNmh9u8gFBVpMsPz0ThqlHGKce/55SO7wL5nDp4w/cVOvgZm+4L1qh+gtCOO/0hncfwbU2JsY6aqJjr+Ml9IGL0d5x2nVlvatOatMzbN91xwHF/ZvQkMuq5kP/6OfxpgI94UmNJIpqSE93sLvuY+JC
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199021)(2906002)(33656002)(86362001)(38070700005)(122000001)(38100700002)(55016003)(41300700001)(316002)(52536014)(5660300002)(8936002)(8676002)(7696005)(478600001)(54906003)(66556008)(6916009)(66946007)(71200400001)(64756008)(66446008)(76116006)(6506007)(9686003)(4326008)(66476007)(26005)(7416002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kf39oMTPzEKs9avNf0NngldG0fMlQE48I4gcBULPyBtkmqh7rnpLz8ECWC1d?=
 =?us-ascii?Q?kxdg/qX+ZlTPBlCYn4u42nDCCOaVIRtRiud4xQwbR4nnArcM+H5rFmZLByrh?=
 =?us-ascii?Q?qXFHaRP8epPxMIrhcw45bF9dyc9E8GYS40/AR4t8CK24A4jdEGk/qFKEafF6?=
 =?us-ascii?Q?yviw5ZkJu70fT4SjzpTd00d6f7DngexRsxx2RkVxV/SWOe4mDBdQtlzyV03F?=
 =?us-ascii?Q?4aSaebK2ADXB6bqFa8Mgr1VUaiIdcbjuo5rfL/JcoRV5hXZ0GswzxZ/htga+?=
 =?us-ascii?Q?tmG9DWbzEh9RPuJP68m8otHJ8cogsew6keGYQGZKe3OcafZm4YhkLgZAOUbE?=
 =?us-ascii?Q?tg3ZjRRtIDHf6A2Y1LQI/C8KOp/3TjoPJKoLL3R8uFiy8egj0IQ0/qnViG3P?=
 =?us-ascii?Q?gsI6GGobhz4j/TGGUZ7oHUwqZ8iqjhWk3FTtJhqMEPtOYWEBykJgz+9SRvWF?=
 =?us-ascii?Q?uw9KW5/4WPu9EPv3cPRdFALJTOze0jzcLYYLZhaxvdwT1s+lrosQXnM8Ittr?=
 =?us-ascii?Q?kx8bPvfqWhbbr9BXKDXIDB+//+3YXxjc8AJ4s13se/a9zF1JasPuhnrVsQ8Z?=
 =?us-ascii?Q?LOLtICKD/D1SHqKv8ihXF9PnIgrCTn0w7EM33MwONlTojdCl1H5GPWlMIG9U?=
 =?us-ascii?Q?/gaY/f9CgpqFNuaHTkVZiSP11qceSAtPrSXGPUHyUYzRENulfecOKi1ABc1+?=
 =?us-ascii?Q?U4BEJxcYhsYy2YKJNbqDX0EWQuo0hQB65u7i1fc7+RPPpbz9OIi0C7+RJfSJ?=
 =?us-ascii?Q?sSTF/57r/zhK7+oqBFyilKOET7FxtilbNx0riswPVyubkY08cgOBElCwMqX7?=
 =?us-ascii?Q?6uH3ERa/sD6gkZxzliXZ/SmRTZOO/qeUuQlBB57I5UyddQuqXV/OlkuBgavW?=
 =?us-ascii?Q?RIiccp2Q9oO8pH8WjNw7RteDJcS/icoYBaQXMxQbqyr1u5XWu7/97Nv3Ztz6?=
 =?us-ascii?Q?ih2BcPEQx5sdOXZbwCfzEuialGxb6t3cm/rNXFSjjeNad+9btCo+xwbW9Pl8?=
 =?us-ascii?Q?hReyBrTQr/3eTlUafGr93uddIQHazlAIDnXfVyHOG5pitsa2122W8MgyQ3T4?=
 =?us-ascii?Q?HF/AfLkDGi0f/ZxGAbkRA5d63AzKKp2hlfijzisInSJLjEKOJd5EflwZDOpc?=
 =?us-ascii?Q?rawaeAlkewwbwuJw2LkdNbUra4oraNarRO8R3wGyriq9TVLuc40Gusi8m82M?=
 =?us-ascii?Q?nPd11z9YVCMmIIDt355nIP+XQdnUDbaI31SheayiedYzuwRJILvcBwf5IQnE?=
 =?us-ascii?Q?YPCXFIYF6jhz/oxRMv5xdyEs0NChiqktw3XwA8eJU2wnI3Bwa3VgGbf1jXM8?=
 =?us-ascii?Q?DFL7OwPcFp0kifOUbN+2EN9gRd2s6MDCNM3/iT0uTMDNj3+kt/Qkh2OwVwdL?=
 =?us-ascii?Q?Jsfn+mhJcZ+sKbaGzdFFE9s+ab7gjX0ymNeosAvEQA190cssQbC4a06EBUPH?=
 =?us-ascii?Q?fGx/MQW007zFd1kHeqAVIseiWGnWGwxKE8RCk/ud90KFPHdkHv2PvZpBVkfd?=
 =?us-ascii?Q?9LfZIL6bLr/dMDET6cO8Yx5hVMsbrXBLOTvt/yztLsX4pzlKcO2WAqWFssMH?=
 =?us-ascii?Q?FlUGNYc/FO/4E4nG5ak=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba64975-14c2-4785-16bf-08db68321d7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 15:07:45.5167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6DU++GhEVnkThZ0P4HeUUlw1GeuvjgkIvNklBRvHG+kMII4XniHRtwV4PlQQU8NwCr1pN6gbasqunNd4i1+DaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6973
Subject: RE: [virtio-comment] RE: [PATCH 1/2] virtio: introduce selective
 queue enabling


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, June 8, 2023 11:06 AM

> > > I'm assuming we need to modify the standard just because it was not
> > > explicitly allowed. To explicitly allow it before DRIVER_OK was not
> > > needed because it was already widespread.
> > >
> > It was explicit enough that queues can be enabled after DRIVER_OK.
>=20
> Weird, there's spec text saying they can't.
>=20
So far no one cited that text here. :)
You pointed to the general initialization section but it doesnt specify.

> > And queue reset is the perfect example showed that.
> > Who ever implements the device should be ready to handle queue_enable
> writes after DRIVER_OK stage, it is really that simple.
> > There is no need of new feature bit.
>=20
> Hard to change the past, we didn't ask people to do it.
>=20
> > > It would be great for me if we agree the device must support it, but
> > > maybe it is just too late for that.
> > Device must support it. There is nothing late about it.
> > And if you are considering LM flow, then for sure it is not late becaus=
e LM is
> just not fully baked.
>=20
> Considering regular use, no LM.

_RESET is the existing feature bit that allows one to enable queues after D=
RIVER_OK.

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

