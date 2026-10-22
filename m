Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792686059;
	b=saC5JTli7P6UxFraRfw6L0laj4Ww6wQVkxKAChw4d6k4FzBlPgI5wgwp0xzNhsQFJqgH
	 84wZb3PJMDGfzbp74tu9A3MRM87qBulDuMmaZA6gRZYjjaZcPmGlaROFWVhSvJ0fvzg4h
	 l7rCF34Qhnh9YA2xNkcRNblvojaUE7nqSJ7FMJtXIRN/AOm9MHnTXpfQ1wEjyn310mio/
	 Xk2wMOwtSgNzN5qpvwMkPcxY2G6fksgCZchCF2JTNvPa0OQfH7cEgs65OofBgOYn2IaqE
	 PY8OygsiwE9TeKuV0aNs0MDUEkX7nQjz9YnF0ukTPp3Uie44pEXKQM87YJm9cpNKkaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686059;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5jNHjpIMM/GxBvUxBTBkEo0GX2GLpozDzqDVvrCH6UQ=;
	b=cPzVpXKK+eGItiuNHq9sQMP2VkCbK0UYTxo5t1gObDJgklAvzrInNib6ktwz+budxymm
	 Urb/sMWtBlr2EcWDtANCQv6mmndykXDYVMdl9vsggrgGCrdPrea8JY8FwX9eqO6mo+Df/
	 hE76eZZVuA3EKA+U1OI8NwuWeRXr64l2umjmuzEdCyiiGRI1L0mkHOZkNu3hf+NFz8uXo
	 Oc/GVg2cv6GNLJfgxofwKgMduCQ0uVhkarykbDrUw9vYZ7lcEmHlRLx92IE/BZwP09zFS
	 V7Ou/+HMrm/nh9sk7fkG5Fbz1YVQZqDgnraZAqsLK70j4VwnD9lrdovSEz9p1ZT1i+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VHx2Z9DH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.3
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010003.outbound.protection.outlook.com [40.93.198.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B6C606A319
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 16:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B6C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VHx2Z9DH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFJ8xPrOCtF/OYFAmkd+3H5MPkzhBOJrEBvgansL+CWH9GbONN6IQ1P0XgArZ6VGDzPIrNEgPhnJF/WlM7VI+A97BRnZSAY3ltXRLiLL8QeXMDHjI0V0/0FrIpvzOd1mt7x9mtCn2IlLGvGpzpiKcBuzLu4OEnqZ64ctoRJ60hzUWu4pmXQbAVfe+3rRfsh6rKu6MQ1AymtzDqraJTDe/ugJ1fq7OIbZGBGG0A+yB+ITD8t0SnpoT/mcjCaVAseD6IbE65nuJJWvgnLI4UqxjyG776xfk9TvcNsjUxHEKiTNGfFXSjurBvYoILL9Bwu1wq07nNr8IcXDGCEPBYYrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jNHjpIMM/GxBvUxBTBkEo0GX2GLpozDzqDVvrCH6UQ=;
 b=JT/LPZkIle3dcuYqN19k6QQ4xbnOpquBGS8ye1SJTFw1bWc1jAvjJaHGQg85Z3XoPVX6FYbQZV5W+ySIa6hWUeH1rpuztY/4gWk852aLJdfogh4YKttkeQBNlIFTcfCe7fK8jE7EQn8rbZZpIlutN4cAVg7EaGwI5jW+Wyd6f4f++kJs4CkzTCgAujhW6fYssoC5xjnuBMaJt2y+sh8xutXBbagkILTUOPe1infANYyOaopB4Tiag1is3OxxwhXRml1L7v17zISWXybV5zMGZNCc5kJjGoytk/qHMt89aktL8Ix5BLqBrfIErUpdNUS5vAF8ZYVOKYArEqFIrFkVPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jNHjpIMM/GxBvUxBTBkEo0GX2GLpozDzqDVvrCH6UQ=;
 b=VHx2Z9DHRH27xlvWZ8TyZ0tNR/o4rNBYXMNosZukyiwHNLNMcH0+xwtI0FQb37itoVsHskQkv3PoqJf6ASjQ1DWTmmNk31xaO+STl8YrpRr0vINr8st1vdDdK13e155dl3FUN/kGqldkVlvFrDOWOUIFLJWBw44pF/cHCQt5qaAoOkQGZ+5PTyVN3j+5i5bdCNynffy8F1EmLLZYgIa9t8yMPUrI9Dc1fK+72brAF6Pb2CYBgW+ue8tWx2JvoI0ySo9T4O2/ZonjshjsEEs3QugfBPsVhNkSyOOeHHLJBD79u8QH6LCALJ4eDSkGjisCh2+GMUCt6AYMvpqXcO+K3w==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by CH1PPF16C2BD7B0.namprd12.prod.outlook.com (2603:10b6:61f:fc00::607) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 16:20:51 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%3]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 16:20:51 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Cornelia Huck <cohuck@redhat.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Manos Pitsidianakis
	<manos.pitsidianakis@linaro.org>, Demi Marie Obenour <demiobenour@gmail.com>,
	Peter Hilber <peter.hilber@oss.qualcomm.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Jan Kiszka
	<jan.kiszka@siemens.com>, Stefan Hajnoczi <stefanha@redhat.com>, Trilok Soni
	<trilok.soni@oss.qualcomm.com>
Subject: RE: [PATCH v2] content: Reserve ID 52 for QPSFI device
Thread-Topic: [PATCH v2] content: Reserve ID 52 for QPSFI device
Thread-Index:
 AQHdYYZ8aLR7Neu2k0aXypdMBau4wrcIYNKAgAAHHACAAJKLAIAAKoiAgAAEoYCAABWGgIAATaoAgAANYYCAABBHAIAAB92wgAACUwCAAABL4IAABWgAgAAEdNA=
Date: Thu, 22 Oct 2026 16:20:51 +0000
Message-ID:
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <87mrs62vzj.fsf@redhat.com>
 <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com>
 <20261022032118-mutt-send-email-mst@kernel.org>
 <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org>
 <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
 <87h5id3he3.fsf@redhat.com>
 <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022114028-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022115837-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261022115837-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|CH1PPF16C2BD7B0:EE_
x-ms-office365-filtering-correlation-id: df8d0170-5980-4318-a733-08df305870c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|38070700021|56012099006|4143699003|11063799006|261021121427099003|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 1qFRoc7P1pKHVoIWNKB1DjO9HaxsYbK4IA23VcU9P5bo8iGKez9oawjL65/HDNi3DeN14BnHKcUHv/PJlxlPOow1oIYnc+yO0JfyHatmO/Mo2j3RsAH2yeVvHAJv5iLWF1FEAAjDjXh/HIOXGN5j0azjdz+6gGLNk3yTcM4Rpiu4zLUcgLxe5OBcVprHW8vgaLJRWXoGQopMX1ZlgL758sdmUgAhmv6sBEnDp4zTdfzYog7R6TqG00ZntgLdEm1ExqTDC0+cWTsKKvuddLIQY/+BHf7pPw0CFWtdfD20VkDjlkbpsJQBwNjL5wuAz1zacDETDEY5qLpAuUAYdHGC4xMW4+xPN+CcI/n1jAvQUy8dAKyFWgMd6DQuSOqaUWcE1QUT3a0Jh6mRG1wQJsJwNUa1ueI5GO2QZ7aJ4Fra9tDaROFk6bwcfTGEwNtO0hTtlIt57IW3xcO7KsaU36hY93yUt4Y5tDXtYN2Ws7yHAxxHPnup5RoFeNxEiEUpSrG8UlIplanf+b9O58M3W82f8CukmFflvXXNQapl14NAzWX/xyDD8Ua5eTBZOk9XkA8nSkH0TnKozIT3xRnKmS50/0u5eOhcsrCy/FjByCf2NFPg5rt+ts3Pz5jRS8vgP7zVuOXHl1yVEFhbFyub9m2+092a+zfaBTlMXxUoQQICvWOO+c+e1x4epku1jAXcWhINQ4XL7BpXLGk5EOLwjOHh3+xB1q51i6fm8RxgZQN/5k0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(38070700021)(56012099006)(4143699003)(11063799006)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HzVoPrpizMhH5nprJihubwvTXD/Cj/jTKt/QjGaq86Qlve7gKrUgnizgdSy2?=
 =?us-ascii?Q?0Y0odkQmul7w9SnpH9BzceEGWVWDJ9i4eyr7GFxrN4Dd3DMNbCrc5SmHwvCc?=
 =?us-ascii?Q?GRWcBQdmJUhTc9cK5guqmAtle1LwTh/Oj83qWX3KwcCWZKOdeKOgdb75cY5b?=
 =?us-ascii?Q?NJach8cEQsQeTF7NxiTtpOSmsUM7FTNuBCX5uiRHZZhrVD+ztqu3jmW0IvOU?=
 =?us-ascii?Q?tHh/lsAHu5b9/nexEYwdIjjAkI0aE3zs0c1AC51s41YkegIgIpRfMmXnrm21?=
 =?us-ascii?Q?vomfisZ5k3imO/Ibk2dNH3YbQXp4er1DLYnG0ktKQBfo8NnihSA+mh0CDe4m?=
 =?us-ascii?Q?P+zfamwiEggizUar3RltQv8dMWHthnR3dhgA4rNNWahXMIxAzbsGL0RS1dsS?=
 =?us-ascii?Q?/TvxQyDCkZHf7Dp0r92scPe8+6zAorRu6d1McLOBfu07udCp77nSfDkOFEH+?=
 =?us-ascii?Q?SSGdnTUH7vo1WngGd/v3awj2ZLMwY9tOrMccvNTMJSdBcLlGHvTxjS2LhwdL?=
 =?us-ascii?Q?McskyxJ+WuyszLOF/2VP5Atwz9nricmllu1t4h4dBQZPV2Oqp0xOL94JSRcH?=
 =?us-ascii?Q?CrVM0eCBIJqAzqIBCGIPhM/QcoK/9TSP7JXIa2rBe41ykkAKhyIxx6AyXoEH?=
 =?us-ascii?Q?MuJJf8VmSswp4IV851Ikyn1ZJJ+Mc7DcumJSl/nEVIYiT44mMURA7J7d0Rcr?=
 =?us-ascii?Q?KBYhoXCeXh9rYUkKpf1flvtarzizJ6k0Rxmb3pcCk3nSnI2mVQsVxXfwjS9/?=
 =?us-ascii?Q?bc4L/47Vk+jIeUIj5NyfT2q4eGa/InTwRQUAORFCR3kbIypn/XldBiXQvAud?=
 =?us-ascii?Q?/JODiQA17cj+XBuLwOtK0Ll2iMqnsqSPHBOH2AfllEdCyd86EEog6umEv7mu?=
 =?us-ascii?Q?YH8HQlE5gfXZnquFcabUqZ2Fi/yBlx47o5fgfbMMf8L2uguSxiGGyYLWXK6b?=
 =?us-ascii?Q?W7nyWebNXD859od11z8ACWEHg6A2mt7uDVGDGUZSJDMUSKeL/v57bn5t3xmc?=
 =?us-ascii?Q?16aZlpvb7M4K1tO8Xgl9tw0G23EF7mwltTArUFhEzMCn9RWuFZzO9kuk8hCV?=
 =?us-ascii?Q?rl4+MBNc8MrJplEVIkBubpqtdpOOobRkOV0MsW5k2Pd3X367iI39gQYh/riJ?=
 =?us-ascii?Q?McZpmJ1mw3LgNeYWrkLmHB997IecQ8SnWWdnT8sb8qNnF9/Q6RQyvewlTymk?=
 =?us-ascii?Q?HdI0tIrASaGbsX/09ERjgYXKkOfWA/btTcqDfskCe6W4jaSYsOnBtp2bXr+m?=
 =?us-ascii?Q?uqe47glFQ4ZAXMw4ESQ1L4YlAIoBLzeLeyeI87ZaJbuDHY6mvEoibnJd2wQa?=
 =?us-ascii?Q?Noeml5O5+81hH2DDxc0lJUVqDziv0HmUPNSTyB+ieUf/FXFzflCDJndH5hcl?=
 =?us-ascii?Q?9JwfjcaAAh4N2ohxt5812kCr+7QlK6GcYBHZsRlJfqTeCHVixlZGjkQEasV4?=
 =?us-ascii?Q?mlnGZqf1KkezjF6Aqw6kyEqDZaOtKvNWm7iIXaPNdvzd6Ni8kNxnbFp1YvW3?=
 =?us-ascii?Q?+TxrA5kLfM/zUQGG5YrYoC7SyhYBEytluhLLCqdkL0kc+bE+9460EreCwhcW?=
 =?us-ascii?Q?Ayn+832Fb95oVVHDXhFxQjau2jx0CJp/+ETyf5F3GjZDmcG4ieDagDjxv0ns?=
 =?us-ascii?Q?pyPbuyABggcIOQC8OtuPRF1xx1Iu/bq0KkAzUVPd2mVv2vrZc3FDkFOml6Y2?=
 =?us-ascii?Q?GKLRx8Ik7KJaUcn2NB3JUvLcp/JpJ76lmuHek8M+WUcw8WMt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df8d0170-5980-4318-a733-08df305870c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 16:20:51.7229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JqjIqlzQQy/bD7yFwRFD6bkW9AYnumrF+42wrCjBAFPKg6lubmToIWLy57q8bIHagU/Tx98l6FVn/LfKl4KdwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF16C2BD7B0


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 22 October 2026 09:32 PM
>=20
> On Thu, Oct 22, 2026 at 03:49:51PM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: 22 October 2026 09:12 PM
> > >
> > > On Thu, Oct 22, 2026 at 03:35:51PM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Cornelia Huck <cohuck@redhat.com>
> > > > > Sent: 22 October 2026 08:35 PM
> > > > >
> > > > > On Thu, Oct 22 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualc=
omm.com> wrote:
> > > > >
> > > > > > Let's define some standard way for the vendors to declare that =
this
> > > > > > device is "Qualcomm", "NXP" or "hobbyist which doesn't own PCI =
or USB id
> > > > > > block".
> > > > >
> > > > > Are we able to use the first <n> bytes of config space for that? =
I guess
> > > > > that is the only way that can possibly work for any transport.
> > > > >
> > > > > Then, maybe something like one or two bytes for a vendor id (incl=
uding
> > > > > one for "testing purposes" or so), and the rest to be used in a
> > > > > vendor-specific way.
> > > > >
> > > > device ids are independent of the transport.
> > > >
> > > > but Peter already announced that:
> > > > " Reserve a device ID for QPSFI devices (Qualcomm Platform Subsyste=
m
> > > > Firmware Interface). QPSFI devices expose functionality across SoC
> > > > subsystems through a common Virtio-based protocol. There are no pla=
ns to
> > > > standardize the devices."
> > > >
> > > > So, I am unable to understand why should it be part of vendor agnos=
tic virtio spec?
> > > > Why a vendor specific implementation of device and driver is not su=
fficient?
> > >
> > > I don't really think we should vendors burn up device IDs every
> > > times they want something non standard. Reserving ID 52 as
> > > "vendor specific" so vendors can go wild sounds good,
> > > but a bit more needs to be done than just reserving:
> > > document what is expected, e.g. no auto load based on ID
> > > alone.
> >
> > First, you indicate to open virtio to vendor specific extension. This i=
s huge in itself.
>=20
> Not as such.  It's just reserving an id. People always do things like
> implement some crazy spec saying "we will upstream later" and later they
> do not.
> And then the ID conflicts with a standard one. Suboptimal.
>=20
> So if we can tell everyone "always use this ID, and use platform
> specific tool dor discovery, until your device is in the spec"
> then that's not too bad.
>=20
>=20
>=20
> > that should be first discussed.
> > If you suggest this, may be every device type should be able to extend,=
 and not just demux at device id level.
> >
> > Second, one reserved id is not enough, because a given system may have =
multiple such different vendors devices installed.
>=20
> I don't think we should care.
>=20
than all 0xffff as one experimental id once for all is good enough.
than vendor FOO, BAR, differentiation is not needed.

And if it is not for experimental purpose, not sure why would vendor stop a=
t only one device.

> > So why to bend things so much and re-invent the wheel?
> > Why for say PCI transport's any vendor and device id are not sufficient=
 to indicate a vendor and device?
> >
> > and if so, why to even document it in the virtio spec?
> >
> > I guess, I am missing the basic motivation part.
>=20
> For the virtio spec? Above. For Qualcomm since they decided never to
> upstream - donnu. Don't care much, either...

ok. so yeah, let vendor's platform device be in the vendor's OSS zone.
