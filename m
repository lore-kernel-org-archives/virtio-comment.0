Return-Path: <virtio-comment-return-7577-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B642FE748ED
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 10:40:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EB379602ED
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 10:40:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B4D179866B2
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 10:40:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9B353983D6F; Sun,  1 Oct 2023 10:40:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B35298652B
	for <virtio-comment@lists.oasis-open.org>; Sun,  1 Oct 2023 10:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNbNLiMNCqYQMqTa1Ys+CSj+ILZc8f9ULsxoULDuCxh6ZG/IG+S0clAHyx9iYo4x2hGOd6DhGm7dVoqkyQ/LCiywd5/noKThsenjV83N4br/6B92h58zHnAJ2whvjv7KTPZ1BZE3ICAVh7miEpQTpoxRTVOo/axq2lJoh1Z151WLmmGqho0SqlBeSnqnOLJJGbFYiLXJOPbcNctuSdjydSMXAMO2y5Et1l0AfuYthX0Xb4ptVc5+qbA3dWR73tAvCwF+IRJz/UpjxCJQjm9+bkWTXlzZ9BCObFAXNyQsxZZH095o+1TkbnShj8jHQjWls9V7beIdAyOCVgAYVWgPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlN2FcBztk02EiNnZuMcTq6fGiPQvVBXyuxHZt4PrWg=;
 b=K0LO8Jw78Fl4G2CEzDgSmQ+cxJXIsswxDL2BRcyBw5dLh29N5EVKqxMYERmiXwETd6vG+4iMDyjtZJJgNX0qrOfqd5exH7K7o6wQRCVa9lNIZTCkHxYr+JDNU6ISeIVpZ5X6Uqt2f2If4uGllfODniQbNAT+gMXE7uyE6UURpQQTSx07xgx15xSuMRQrih71UQz1zn92seVsIKmdui5nqH1lQgYGg7dc1u/phqxPZBtdeAQdRW3MrtcsJDcPJ8MUksbnTAyl+eunNmcS+YMeAR7atYLaq1KU0MyCUB0/ST7LhkvEnlSemKzWMCkOBP97VXmfT6n/2nEDBLiD2KGOow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Heng Qi <hengqi@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH 7/7] virtio-net: Add flow filter device and driver
 requirements
Thread-Index: AQHZ7VucyX//Y6/bWESqpfYs8R0A27A0vJyAgAAP1YA=
Date: Sun, 1 Oct 2023 10:39:57 +0000
Message-ID:
 <PH0PR12MB5481438FD5D571D3AE7627E4DCC6A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230922134838.3718-1-parav@nvidia.com>
 <20230922134838.3718-8-parav@nvidia.com>
 <SJ0PR18MB4477C6B390045649ABE8B1F9C3C6A@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB4477C6B390045649ABE8B1F9C3C6A@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN2PR12MB4157:EE_
x-ms-office365-filtering-correlation-id: 074e7f65-52bd-4867-b427-08dbc26ac1d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BgKcJ0K7+se62SfFJSlRrip6viUi6nqymGkeCOMsmej8bmF3NjzOwNoPGfmC9RQvy24HNYxbuH6f9h+h+q8vm4wa1TAXvYFhDBnsJv2pxgkZmbwbnrbC9yeO1muO7owFFAl8JcwGJraz9hYBnar/IRjIfsPkXFAgi7U3HLKHh/9Aqdx4q/kSGAt3gMppvl9EaWq4JE56IzlOPdGurC8r1fnkN+Y9j7VJiYeMdsInJvaxrOZ+iol+TBg4oTuyQsb7WdmsJi9ou03zs8HpUGZnn7n/uRa8Mth5UCMB11suE5dTacSCDO59ZgHzekbnhsi65NsrtbXLOfi/yOvRnez+H/kclASnW15XjBbPEfe5ixgc8AcnsgOikyQS4rbFhOdrnxAdeBhK0vK/tpZYvVsKgx01nGXuJEQzbOFo4/78U75AXgDSp8MT1UXGDITb0XVI5oQRtOl3UzsMaD2tL9oir3l7Gagj2VNooUkr70IgWFIdqfoOChiM9da+lMoWXl6tkhBZDeOm2ef57/ArakLrNcWLvoEUXEsv+O3BND9noZI5yDVryswaDVLwxWapEunbi6DY9WrBaUeXzMrNvOBxiWnoIYKajfT7Q8bsT9zPjKXZ96bt85bSpnKfTJg8nv8o1T1w9kR2O8mr960aCz0h1w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(55236004)(2906002)(4326008)(316002)(52536014)(41300700001)(8676002)(8936002)(5660300002)(55016003)(66446008)(54906003)(64756008)(66946007)(33656002)(76116006)(478600001)(86362001)(7696005)(6506007)(71200400001)(53546011)(9686003)(38070700005)(38100700002)(110136005)(26005)(66556008)(66476007)(122000001)(83380400001)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2jpOmunwF58yxdFlDp2jvJR8vLKQTPVBNpJXQFlWI1Nt5t14H2L3Uz+8eeFj?=
 =?us-ascii?Q?yi44nuVzwMRrbV2mTymuVWDARGwS1jXeUQT6xV/QukrXkLAUwknZ4wPnosHP?=
 =?us-ascii?Q?aNqD6/ttwDstKY+sQ7oEEF4KGltTP+1WY3ESIGurhTA66+uFQu8mdlHORtnm?=
 =?us-ascii?Q?9go0GJ4UrDUYJSqgPDcXkmiCXnACwjnsbP3WwvzJw1hymbevImDs+CEy/Fhb?=
 =?us-ascii?Q?WIx2Zt+vy4eek62TrJf5GTjlYEG77hmtMZsc99n7kP4tyX3x39E5ax4nXszA?=
 =?us-ascii?Q?Gy3bVFIzPfW1pcx3z/JL7XJwUtvVHzWsb/WDJNJGvzDmghPMNVoTHcB1YpDn?=
 =?us-ascii?Q?NY92vcdRoB04A3UJzQQgWh8cPoemtY8UvVlD0x1zdwNXYvPEjz/bSMTfv2NB?=
 =?us-ascii?Q?84ufwY71pgfKS9VkfYDh3HPcyEezNHVt9WeTnXjGR2cadu7H9l/iBW+Mi7uG?=
 =?us-ascii?Q?KuO2wYujKCcJthIt9Tda8k4vHThi6dleOl/lw1Uwqau5+wxkc9j0qOzw4ijz?=
 =?us-ascii?Q?4FKVY+Tctv9OofYHDpkcsdGgYq7UriD6xT5U8Et0/u+NfJrNUI6hvNegsq0T?=
 =?us-ascii?Q?rVKc61VcA5a/UZJJ/cv2HgZhM8OohXfAr9d3jsKQwFwPEdjzXeAn0esGGfnw?=
 =?us-ascii?Q?9f8QMaASyxSjs6cyC9B2p6PxW6nES+r1VgfdyJ4xUfGOmSSKSDbJnMX0A38D?=
 =?us-ascii?Q?3LkRmSTgRqqZsV7FWM8BVeeW6hH3BtOymUBZgInwXLOrkJ+XU21TbQIgaNXC?=
 =?us-ascii?Q?YP7DiNed7SbpD+2w+cyYwWPvrx4P/gRg6C6scOIia4RhywII5J/aq/9ZfGqw?=
 =?us-ascii?Q?E68AAf7qxBZXJTbzTB0/VGCfSo6mFHmYLl2k5uzBKbYwaDl90/QtPGRFLF/r?=
 =?us-ascii?Q?Uxmhjf8LzwoGSdXaLD3rgqb/2jZj03+kgHqI7Y90B9tRmRoj4fZIhHeJ4uYw?=
 =?us-ascii?Q?3epXzfQ0dL0l8PGPwQD8xrMv3basYy5gCO9CI3A2hBKbT/t8DB/2t8ew+wKP?=
 =?us-ascii?Q?uGlBxxMngxwzQ1v6IlbHixsKdhkfeg5ypyvabEEaWZBSwqGy8fl1xUeZTzrs?=
 =?us-ascii?Q?t/37W83CfzDGh3Zxy2h8GTYNBJmjO6nfeaP6V6SHzMwfru6/D85cS2sEDzId?=
 =?us-ascii?Q?K7e7b8k1ylet8PDpeuK0QEqhuU0SqfhZOBZTtmZwN9ElxUmoC7eW57JmbzKr?=
 =?us-ascii?Q?forJP2hqqg5PXM+w7woGYeAHapZvvyUf8f0nHBMhzjh1vL4Sm+Cjq8qEPNAd?=
 =?us-ascii?Q?/mNgVLP8vk9830QS/BNhI4tGtkQMtOUfAtTSY+cy6LL4LIegWAFrifT8K5D+?=
 =?us-ascii?Q?6LdZyMFDcR5eukrwj96EWmu/WuhoIB/Vmp0LjWreHUm7jcw6WRP5zxlH2pwN?=
 =?us-ascii?Q?4gZ2nyQqGluOyn8TOWH3tx0nekIBZbDaxDA7fAjl+IyKnoeqVc0Et2KexKHh?=
 =?us-ascii?Q?KvUuOtSw/WRq5MtptLa1x8+DWjeWTO7fglkEgBPRSp3wyd/VEIcZUv9gBZOK?=
 =?us-ascii?Q?0tIClH6FVTypgR24ZhrM1FKBeiQng5bkpD6EQ2NCzYXgA6fTnY1dh/Zm9xWA?=
 =?us-ascii?Q?Pd369G/Ku2X2zqFFOFo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074e7f65-52bd-4867-b427-08dbc26ac1d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2023 10:39:57.7206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IcbaUHpP+xySn7MQipC7i+bInPf1CyGPpC5Xt0e8jT5FKYvdly5PwY9wAFkf8TxcdP0JzF+sbfze2luU0igCTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157
Subject: [virtio-comment] RE: [EXT] [PATCH 7/7] virtio-net: Add flow filter device and driver
 requirements



> From: Satananda Burla <sburla@marvell.com>
> Sent: Sunday, October 1, 2023 3:13 PM
>=20
> Hi Parav
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Friday, September 22, 2023 6:49 AM
> > To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> > cohuck@redhat.com
> > Cc: Satananda Burla <sburla@marvell.com>; shahafs@nvidia.com; si-
> > wei.liu@oracle.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> > <parav@nvidia.com>; Heng Qi <hengqi@linux.alibaba.com>
> > Subject: [EXT] [PATCH 7/7] virtio-net: Add flow filter device and
> > driver requirements
> >
> > External Email
> >
> > ----------------------------------------------------------------------
> > The flow filter functionality consists of the following four
> > components.
> > Add driver and device requirements for it.
> >
> > 1. Device capabilities query for commands VIRTIO_NET_CTRL_FF_CAP_GET,
> >    VIRTIO_NET_CTRL_FF_MATCH_CAP_GET.
> > 2. Flow filter group operation commands VIRTIO_NET_CTRL_FF_GROUP_ADD
> >    and VIRTIO_NET_CTRL_FF_GROUP_DEL.
> > 3. Flow filter transport mode set command
> >    VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET.
> > 4. Flow filter requests using command VIRTIO_NET_CTRL_FF_REQ and
> >    the structure virtio_net_ff_op for the flow filter virtqueue.
> >
> > Fixes: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> > 3A__github.com_oasis-2Dtcs_virtio-
> >
> 2Dspec_issues_179&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAYl
> N2z-
> >
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3D8GgvPPzhkMzjnrqhLPEu7j1B0uqFdiy
> 5e7lQGf
> > UZEW
> >
> MOxPwYNGtfRt_j2pephKf8&s=3D8VGvaTxBK738Ex8bGnhEXIrrDkavvG_JfEZ7TkUY
> e-4&e
> > =3D
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > ---
> >  device-types/net/description.tex | 116
> > +++++++++++++++++++++++++++++++
> >  1 file changed, 116 insertions(+)
> >
> > diff --git a/device-types/net/description.tex b/device-
> > types/net/description.tex index a96e47a..6f89096 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -2358,6 +2358,122 @@ \subsubsection{Control
> > Virtqueue}\label{sec:Device Types / Network Device / Devi
> > \field{command-specific-result} is in format of  \field{struct
> > virtio_net_ff_req_result}.
> >
> > +\devicenormative{\subparagraph}{Flow Filter}{Device Types / Network
> > Device / Device Operation / Control Virtqueue / Flow Filter}
> > +
> > +When the VIRTIO_NET_F_FLOW_FILTER is negotiated, the device MUST
> > +support VIRTIO_NET_CTRL_FF_CAP_GET,
> VIRTIO_NET_CTRL_FF_MATCH_CAP_GET,
> > VIRTIO_NET_CTRL_FF_GROUP_ADD,
> > +VIRTIO_NET_CTRL_FF_GROUP_DEL,
> VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET
> > +and VIRTIO_NET_CTRL_FF_REQ commands.
> > +
> > +When the VIRTIO_NET_F_FLOW_FILTER is not negotiated, the device MUST
> > respond
> > +with error VIRTIO_NET_ERR for
> > +VIRTIO_NET_CTRL_FF_CAP_GET, VIRTIO_NET_CTRL_FF_MATCH_CAP_GET,
> > VIRTIO_NET_CTRL_FF_GROUP_ADD,
> > +VIRTIO_NET_CTRL_FF_GROUP_DEL,
> VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET
> > +and VIRTIO_NET_CTRL_FF_REQ commands.
> > +
> > +When the command VIRTIO_NET_CTRL_FF_CAP_GET completes
> successfully,
> > +the
> > device
> > +MUST return either \field{max_vqs} to be non zero or return
> > +\field{cvq_supports_ff_ops} to 1; the device MUST return non zero
> > +value
> > for fields
> > +\field{max_groups}, \field{max_ff_per_group}, \field{max_ff},
> > +\field{max_match_fields} and \field{max_flow_priorities_per_group}.
> > +
> > +When the command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET completes
> > +successfully,
> > the
> > +device MUST return non zero value for \field{num_entries} and return
> > +corresponding number of valid entries.
> May be better to say the fields_bmap cannot be 0 for any returned entry.
> The same field type should not repeat multiple times. Also it is better t=
o order
> the entries in network protocol order (l2,l3,l4).
> > +
> > +The device MUST respond VIRTIO_NET_ERROR for the command
> > +VIRTIO_NET_CTRL_FF_GROUP_ADD if there are existing flow filters for
> > +the supplied group \field{id} or for the supplied \field{priority}.
> > +
> > +The device MUST respond VIRTIO_NET_ERROR for the command
> > +VIRTIO_NET_CTRL_FF_GROUP_DEL if the group identified with \field{id}
> > +does not exist in the device.
> How about issuing VIRTIO_NET_CTRL_FF_GROUP_DEL when there are non zero
> number of flow filters in the group ? that also result in error, right?
Yes. good point.
I will add it v1.

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

