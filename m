Return-Path: <virtio-comment-return-6175-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD73C7EE2F
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:28:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BD34F732E5
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:28:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A5EEC986589
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:28:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9693098657E; Tue,  6 Jun 2023 22:28:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 84206986583;
	Tue,  6 Jun 2023 22:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPnyC4himlAMhefRr+M2iPl/oO0VJAFwdIh2PTADPwJOTvkPkbzDgh+AdK+NqbjBxj/0VsQRrimyu8j8enc4GsjNIdKL9ywGMHS2RHZmryXdEkvdzFa3FHcSOpjfE119iD/DrBWMQ1s/VZlbzO5b1kMrStyu+HVSJNUYn1XGbuSYufpgg8oLheTL+xim9ezlbcvqagXp0S6KmEz/bh2s82PzJwuduBNbqH9FA3upL5Or9Kx+P5qDX957uaw8TSo43FCBAx25URFjrvBVlJ2t6gDfSrfpKdY/WTlP8+S3swhGInu4ThdbQkwRsS3XUBTkbvPeMTbVTB13Mrd+wwpODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWsyM/RpL/Df7WIeisqU65pryww1Psw/8VR1fwaxK/Q=;
 b=XffPrQfXjhHGE+MDgA8+zHGXULbQjVPkSOlS8HZwJbjxJlfzlkC45WfFkLctpceweUDcPhb9tPw2teP/uzIhDtJxg04kccSlWrcYvbCfXoVtstUdEstjoY+jLUu5rgrRC9dFP1Q703aFr8aruveLHbYnVS7hulF54YVBMvSuCg5g54TZ59irX8r8mIV2w89vPExiG54hvWuNA5X5krQUrDLtmxCRjZrN+KsHofkIFt/oC3GMCAtlULz27GuxBrqs3e7cR4PbmCtjRXIOZpJaj5QvWIXhUe/nHHr/yuqUewjCT0JTut9p9OSBn+A2E0jTQF8qE87kFtQ7Wg92+7v+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4
Thread-Index: AQHZlNToe5517kFJJU22M0c8Q1OeEa9+XxQAgAAAfzA=
Date: Tue, 6 Jun 2023 22:28:46 +0000
Message-ID:
 <PH0PR12MB5481C4357772DE13272EA3BBDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-2-parav@nvidia.com>
 <20230606180853-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230606180853-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA3PR12MB9180:EE_
x-ms-office365-filtering-correlation-id: 382fbceb-a65a-4802-b7c5-08db66dd6485
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ruO7QW3Fz6BfmZ9G/Sxtr2eDDzEUd61E1drTlqCMu42wSjhK/UZd6OZu00xgXf0GC7mRHc0mOrNSRS0al6OnQI/ZyVDj2IKPXrXe0eloVivxsb+3OJHUMGNGWU5I2JvsUZPlpLm9serQsyEK61YQwFE5igZMFCHBmyj3sg4YqakH2e4GkjxC1PDzpX8LY7jtqUFksvu1K2qz8azt5K1FHWj9EynJLU6u4Oj88psh0DlgF8kih37P3tnagLmS9Xf4GSvzFSiORYxF60b2qzIWO9nlAchqbhy0DzCuxjD/iTHz23jzhd7tXPpNkUMICu1exyZm1eVLzYww/buJOvbiWRs56qHNtP5SHIBBw4cjnRz6AqKsMC3weOECtsSxG/N2ux5CVNdzWYjM9+0GKNiPaGkGWHjkDkUi+KN4AiO0zYc7Tn/NrK0cRTt6tvXSZr8Sv5GEZjdwBNuUS17qN+Ejlriuk4DEWebVIYhZ+caKqV9GMII0dAzWfgj6f3t5L1GCR9jlMnFM05/yPjoNe61iMuEkjKY0y08S6t9QatOGH61JnhIQ1DNLkTx+UGbRc7N8s5kD4i9QHM+Xkl1DJwfCRvcBTAx1chLDuw8C+gCKxCNpdHNTEYpfrmYAnjht5Bn3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(83380400001)(33656002)(478600001)(55016003)(8676002)(8936002)(41300700001)(66476007)(66946007)(64756008)(76116006)(66556008)(122000001)(6916009)(316002)(5660300002)(66446008)(38070700005)(4326008)(38100700002)(52536014)(86362001)(71200400001)(2906002)(7696005)(54906003)(26005)(186003)(6506007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+dLCZK38etWDsK1lQU+SHL2RXYLiLIZqiIDjAMdl1ahKLoULd546PT6STi4H?=
 =?us-ascii?Q?kSXK2K/3W8veS2Re5IMioPMoVpxZKOiuVUEW+wmBOMEYdAS67E3/T/E3tUGg?=
 =?us-ascii?Q?/PGCLB9ErXTOAYuF/WZ0LTWgfuq4Eq0pSrCox3Mw71YhIk9453dnrBwQlsea?=
 =?us-ascii?Q?qIYe0mMu11xlsrcxxHL4i0TBVb4miIQpAlMVXxHdKD6truCCLMiWVlq20pw7?=
 =?us-ascii?Q?P6cmHCfJ9YzrxyKu0/0pkRPyBsiDQ2JNMzcPfBs6zl63t8uhILWmO+Ed3k3/?=
 =?us-ascii?Q?s58sSzAfqZBwP/aqwiQEP6bqAnt8QXavEhjyZnJkd8xijK5RNjT+3AgQytDQ?=
 =?us-ascii?Q?nGnVU71A3zcP9AW6gkWQwgR8hPz5brwxAdczRKaTzaaiyzncE3RyovQxHkUR?=
 =?us-ascii?Q?u4ZlPpzaPJuRAd67JwGf9m4mxuj7BvMTCgXRRIIK59Z9FhQGl6h909iKNpR5?=
 =?us-ascii?Q?tpatylVczDhlTBw9+/UogXb4yIsZeOLXe1cvbqyv4xl75q0DqAKg5TrYVWPs?=
 =?us-ascii?Q?2QsRwoEmT23f07xivp3O4CU/uMeJ9w0tNvReN0j7h0TDN1bSYvmGRzph62Im?=
 =?us-ascii?Q?J3uSdaJ5HMHHhcIb4cEHEDkwuapPgZo/xdGSDIpezTBtrCocGz9r0IvBQQ7t?=
 =?us-ascii?Q?osBG8C29nDsdQ2e0+klMHtkrpHmez/OLHEV4rbAyDVyfT9e9PN7PPtLvUedu?=
 =?us-ascii?Q?1SQJAI+1PHPlABDH0wlaZlyeAoXMzKATCCvNZTdxc0iFh/Z9AqXglSRO/P7m?=
 =?us-ascii?Q?10lueOOjNSIb4e3hl5FcqoGdVNr4fM5pScxwQxBTcSwKUpn+zs4NuUvUYnAy?=
 =?us-ascii?Q?q1ukGiP0u8AiZO/f0aKhBqfX/uRl2Y9dykn8+8d4wuvM9WoDMUGivKINaUlM?=
 =?us-ascii?Q?HmVOpxeY+VielVMMGI8YQrAfSgzki4fjmyzAPrAowQkE+6hSDZC+bJF4CiZf?=
 =?us-ascii?Q?ptyQIOuuSJ55xSZ/BDS96ffc6ABk+Eb5SgRx/hi8zbpQ+AKpmkiIAB7GDvVL?=
 =?us-ascii?Q?JxPWkfWtQPLk4F+GW/dtdKzX1rfhZgg3ELUPCHVOgpwR6ZrL28RGcTnOjnHm?=
 =?us-ascii?Q?NVbGoDgs0wiG+UNYXymPfJ4fLDGcq/aoC76zAu8MfkmDETRmCqkQ5hpaUgz2?=
 =?us-ascii?Q?IBYnV49XznAlZMa5do4DKQTC5hLB6sJGiil9WqC8OjhdDkbv9XX6jvrzvA8v?=
 =?us-ascii?Q?wVPulrW4kRklrK5ZWYndcaSLVlR4xtGwwnRexca88SA9uWluRwJpjv1LhpAB?=
 =?us-ascii?Q?BspztqKiCbsUb0sA/VF0MAprhrEQVVkmfDE0n03one3xZdkurHfE/a2UVOPJ?=
 =?us-ascii?Q?5Y2n9NSb2woypjbByXgc8XT2KSE/XAbodgi2Y7SRIMkriws0LB4l/jsjuPfM?=
 =?us-ascii?Q?3qyniIdFjZOjhek9nLD1og8WlovUfNArPlvJlv+toQvqNPYfT6n8l+aBwJp0?=
 =?us-ascii?Q?jPOx76nm5FrFbQkzMGWJrN3IC67ZPkmwwBRIo6y9TZhU3b7fT+KNIaXLt402?=
 =?us-ascii?Q?WPSq8XbPx5Kz4DxBuML4Z2PazsorHoYulb3ILatLY6wUfdVSFrOY2sJnsBOd?=
 =?us-ascii?Q?AqJeYh+CX/bCSu/m62s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382fbceb-a65a-4802-b7c5-08db66dd6485
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 22:28:46.2730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xQE0as3A4p0frsvDgDrJCa5ZJY9GUGKYa6f5xwJutIwA6V4yntYwJounEYUpxDNY1Lum/4eB2xIJfNAme6AufA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180
Subject: RE: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 6, 2023 6:15 PM

> > +# 3. Requirements
> > +## 3.1 Device counters
> > +1. The driver should be able to query the device and/or per vq counter=
s for
> > +   debugging purpose using a control vq command.
> > +2. The driver should be able to query which counters are supported usi=
ng a
> > +   control vq command.
>=20
> why does it matter for requirements whether it's a control vq?
>
It matters for requirements, so we produce design that addresses it.
We don't want to add config space every growing bit map which may be differ=
ent between different devices.

>=20
> what matters is whether they have to be synchronized with a given queue -=
 I get
> it they don't have to.
They don't have to be.
I don't see how it can be every synchronized.

>=20
> > +3. If this device is migrated between two hosts, the driver should be =
able
> > +   get the counter values in the destination host from where it was le=
ft
> > +   off in the source host.
>=20
> we don't cover migration currently don't see how this is a spec rquiremen=
t.
> unless maybe it's justification for 4?
True, but design need to keep this in mind if it has some touch points like=
 of #4 so when migration arrives, it has the building block in place.

> so maybe it means there needs to be a way to set counters?
> so there's no need to mention migration - just that it should be possible=
 to
> move counters between devices.
>=20
> > +4. If a virtio device is group member device, a group owner should be =
able
> > +   to query all the counter attributes using the admin queue command w=
hich
> > +   a virtio device will expose via a control vq to the driver.
>=20
>=20
> this seems weirdly specific.
> what is the actual requirement?
>
I don't follow the question.
When a device migrates from src to dst, group owner needs to know if both s=
ide underlying member device has same counter attributes or not.
=20
>=20
> > +
> > +### 3.1.1 Per receive queue counters
> > +1. le64 rx_oversize_pkt_errors: Packet dropped due to receive packet b=
eing
> > +    oversize than the buffer size
>=20
> with mergeable buffers how does this differ from 2?
>=20
> > +2. le64 rx_no_buffer_pkt_errors: Packet dropped due to unavailability =
of the
> > +    buffer in the receive queue
> > +3. le64 rx_gro_pkts: Packets treated as guest GSO sequence by the
> > +device
>=20
> what does this mean exactly? packets before or after they are combined?
>
Before.
=20
> pls stick to device/driver terminology not guest/host
>=20
Yes, will change the GUEST surfaced from the current F_GUEST terminology of=
 the net device.

> > +4. le64 rx_pkts: Total packets received by the device
>=20
> including dropped ones or not?
>
Not including. Will add this clarification further in v1.
=20
> > +
> > +### 3.1.2 Per transmit queue counters 1. le64 tx_bad_desc_errors:
> > +Descriptors dropped by the device due to errors in
> > +   descriptors
>=20
> since when do we drop packets on error in descriptor?
> we just as likely stall ...
>=20
It is left to the device to implement on what to do on bad desc.

> > +2. le64 tx_gso_pkts: Packets send as host GSO sequence
>=20
> same questions as gro
>=20
> > +3. le64 tx_pkts: Total packets send by the device
>=20
> sent
>
Ack.
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

