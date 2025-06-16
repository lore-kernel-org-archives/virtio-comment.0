Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363D4236A9C
	for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 10:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750068313; cv=fail; b=GkKHIWnvbzl0tAniJLU1mezg0PWgVHSKNaeIYA0jf2tByMT5FTtRe6TZH1q1+/hZjphO0NUauSzX1+tJ2VCWOKivnWlfMxo5mdtxNsIKV9P0anZbH3cWZcpO24oY8JvDEnkLKyfxxAC63Cv35HNUU5O21CNAEI2ktwYh3j/pWIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750068313; c=relaxed/simple;
	bh=c1IgC13kp8I4MN0AQomP+gk21Qrc+m1sJsoH6svz1yk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DHElwjUy99Q8tQpr9NDGc9fjI67GG7+9CpmSSpcaim7NEumx0Ap/+i8luBtUf3YiKZI7IojkqrPmIZrsxEr/HXoSTo6M3Jr8wnltmv5CthLw4BTyBjfvvxMjXZn14M+g/ZeDQeIlg4j//XasEamQn5XIGR2HOIzL9RNz6itHC9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dtR/59dN; arc=fail smtp.client-ip=40.107.94.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dtR/59dN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcFy0NLIJqn5S/RuZm/+AF+/YPR1JpCe57tnAoRYY0V0jVR5nHDhiUt7D3X9PmUAyybHyomtUObzsUCV677KNzTjygIFuuFf+lyEyL3lIG17DAVFGVli12Y2+yWC273mk40ylzfL7btMFKr4IrjfCgeILSdJ+6i5/XT6H3lJ3XiZjY+Abz07IG/dO10zlu3mcS1ip0ncGb4DEDPquyr4GeqAiJzdjCV8fOO8N/yyhxSwUcTxqOlzF4jC5Ay03mCdWo0qUqDer47KVQBECtgfw6LyHisM3jPqUK+Vc87tgGP5lNchWChSgKqmYMaSEPJ3CESKXYUWarBjDCsRHdgUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfAnw+7omR83X2/5tS5h4ljKiM/+/5HRV4lKx6BFsDM=;
 b=m/ERmp22/vNr/6sHG64UpxTrTsA23iSJrW8wLyMUkydjDgWT5Fp67uCulxMgISs9WA1PMwrCoUBzacWCvRJVSkv1CW8HcmGuvZ2wTBdkj1v4U4/m03RKzt5cjL+1+QQmlOF8hqofyLw98/r5e72I3mp6VCQvVi1W/vSxcvdPjnnjCVuc/ugo0u7/HmUK5hxXYxG8m3yMjnSPwsMwGRwsSHVe6R82O1B1hNoCDLqQbeAErnH88e8j51xVknvAsP/cG5ieHXJLUh5QlKqQh7yafGcaP8hETqI/GHAjTYme3KI4a9S7vv46GZcqINnve88JpsER8RJg4qVidn5eEBXAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfAnw+7omR83X2/5tS5h4ljKiM/+/5HRV4lKx6BFsDM=;
 b=dtR/59dNjsylI9Tynl8Xek7J085CG8lMmb5VJ8t8rqqy9bknfvP33D789j0gEcBAUyVGEPguup+KO2uDOy9Rukn5TF7v3JGuhKWuIPWRzr8guYOrCCUgs6EIppTIO+DGJWoqOQ+P12Utsp40oJ3VHegVcGOKUHFsipRTII+P98eimOcAjqKxqw0T/6fbGTmZ8nDVL/eiipUOJub5V6u6dblNP2i3xy4x/RHxzHk+iZmMML+E+TNObivPEDSmJF4hIXsibo8ejaMiGy8vI7UmUo8o6KiqiHuluWOh0ts2KSYrLBGE4lgfEJjwn7N9uzDgCepMSTEIJE2pW5ZyVeZYwA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MN0PR12MB6271.namprd12.prod.outlook.com (2603:10b6:208:3c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Mon, 16 Jun
 2025 10:05:09 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%5]) with mapi id 15.20.8792.033; Mon, 16 Jun 2025
 10:05:08 +0000
From: Parav Pandit <parav@nvidia.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
CC: "fupan.lfp@antgroup.com" <fupan.lfp@antgroup.com>, "mst@redhat.com"
	<mst@redhat.com>, "niuxuewei.nxw@antgroup.com" <niuxuewei.nxw@antgroup.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Topic: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Index:
 AQHbq7cy7Mcj3ywZwU+rYtE4WxELUrPZJsIAgADFHgCAKVi30IACkmoAgAAAtsCAAArbAIAAB65g
Date: Mon, 16 Jun 2025 10:05:08 +0000
Message-ID:
 <CY8PR12MB719558D3E9B840AC0E7C398FDC70A@CY8PR12MB7195.namprd12.prod.outlook.com>
References:
 <CY8PR12MB719509E84C1BDDDE468A1E19DC70A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250616085944.1161455-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250616085944.1161455-1-niuxuewei.nxw@antgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MN0PR12MB6271:EE_
x-ms-office365-filtering-correlation-id: 48eef141-159e-4b58-a083-08ddacbd4667
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?h0LpiwxfR8aupRvm0RbAMxMVcVvS65zVjVG7s1+49QtLq+F1AB8flRbOSQiN?=
 =?us-ascii?Q?mFRIhZt9whLeyPH/0qWpQpkA/XuDJgpltMpgT0LbDPUnoElm+JTfN+6wfLuB?=
 =?us-ascii?Q?EL/Fsh5t/t03E/9UYMRj8dlvfh7FZOcXXqrXDKgbQuNVqE+kNEwzpd1Vci6A?=
 =?us-ascii?Q?/FT6WrpgJl3f7ju0whpYhzp8PlQuTVz0Dezt5+eKRB3t3o+fwlbXqFfdg5hV?=
 =?us-ascii?Q?BxKqgCyCfDp+Bugh42b+vld2zNbWxKwmyysKKNdqVgg4jnu9CLGYuIoKgp+n?=
 =?us-ascii?Q?+tbkYReljMg6xMqy/mdyFKtCezgYFFl9jTMjuqIzILoCBCWVxMswu+XzrY8B?=
 =?us-ascii?Q?aUbVmvR4Ktoba3Yapcsce6Hc+kxp/4tBj6hwfk2Ieo+XBPQuxQZeriHiIMEl?=
 =?us-ascii?Q?sxJOkl58Iod5HhNHi80VERrhIjRi52yrqvNrCeoXtNS9c4oZz0DBxBEzRD9S?=
 =?us-ascii?Q?HKAe+efnvmYVH4g1prbCTM8uqbsIMpcaEkbKqa54KKhiuZvrwZ0lFre1D70j?=
 =?us-ascii?Q?wIU6OsTtuoZhfWWUM/QlFMSnyRH283xLHGFAQhUKffbspDVzY9VW3p3M8vPb?=
 =?us-ascii?Q?sQ5Ph60MmzgcM4T2hpiX2p4o8bXV7PMI3o6oQjFoch1yNlzp42IINsE0gbE5?=
 =?us-ascii?Q?tHrSQiiG1DezoXUKWVOgZZiMtyqdMsBM+ZOSPcsx/AhFqwJf4H/R0Wqdl3CK?=
 =?us-ascii?Q?T2CN0i27uMqQkldjCHwiAOr6HsXe5YYedTHCGlGw/ibVFcKX1LCgjhcAr9bg?=
 =?us-ascii?Q?dbkYRkNHdIcyYRY+pFlQv1oJqf/TAFVCfFIzmqQ7I8hCsm4ifanGSRjSpdMu?=
 =?us-ascii?Q?BtmGgKGgoIXpxFspi+P4qIWIG7VD+3id324/F6lV2rJ8G9dymN9Wjf/jWTdp?=
 =?us-ascii?Q?mIJRTXyBf6mGalsY5+F5UOT5vdVIQen8mDocOqNhpzPYpgMfUcw61BUhYFav?=
 =?us-ascii?Q?gjYXzn015kfCb6B8a0qV86OZ+uyTFBZbGv12v4aWlwfJRbXZuanEfRb8LUBx?=
 =?us-ascii?Q?fP9NvFCK08fG7ts3+q7EpPPEfzADhyROf5jadrlJPop5WtU4/0SVCHuexxHB?=
 =?us-ascii?Q?0WVD08zs7M4syCXzy4ihJAMuvi51+cc5mR7l/RgZH/leTsvOelkZSbtQeuF4?=
 =?us-ascii?Q?Iq493vuSXavFHSM9V+V69Jli8fVvK6joVBBkqe9NUOF4puOw2CV8gq0vgIuk?=
 =?us-ascii?Q?kWD6d9uSbhaiZWegMnA4AG0KhLpErZhKnwOBjTJ48/4+jZWDULZutuVfmS9g?=
 =?us-ascii?Q?WoOMPbqWs0gU4a3y6C0ZnnCNSVv5K8b9Hi3ui3ccJZ+HSKsZlfIJQ9p0yHcQ?=
 =?us-ascii?Q?gX+gtwxtHhEGZvHfEmhw09m8zdTtzRPDKdKnXfAeZpz3L/tQzCFk54dAzYeH?=
 =?us-ascii?Q?okXBIkhwDam/tG9zqruxlSIU8YP3JvPtmujzKRw+Sv3EXcVQ2dC4En52AX8e?=
 =?us-ascii?Q?9pTaj74OHuiwdqjvCOt5ojO68lwgclUtcEqduK05V+Hj0jOHNCgF6g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lSvXfbMqG0JbxCIrmcFzQmzLzpMiuAHHgrFhoqTBKl5L1EWiBxadmEXi/gok?=
 =?us-ascii?Q?S+EqMvC6a9+Nmu/ylHsDjr4axmgiS/1JwpHF3pOKHlR19q5cqk2M+pgAnGM1?=
 =?us-ascii?Q?T+aFuYZ5m4J9xDrqVGo9aEGIgnxp4ChbZe/K21Udy1hF3spqhlCnUW1AIfsu?=
 =?us-ascii?Q?9uZATVLKmZkXS76VvmbuOlmzxGAg3khCpWs8mt5KxCexdUIRFxS7TYTqcW+z?=
 =?us-ascii?Q?GT51Sdq3lBaIquFOEUWwqzhsaHrI7hKixTxWunTpXnyJwqVI2aP4a+IQIBC9?=
 =?us-ascii?Q?eBHpk7BZ+LWBw+ABqOJh0Uml+A4XxmmbS98/X/gvLP1kO+/sUjqxK4HWm+Vs?=
 =?us-ascii?Q?3YqDBU2SWRaJI+bIT2g0/IRDtvOdu8zLR2Rxrq+W7L300jr3erATXb0IQjSB?=
 =?us-ascii?Q?+txG4FDRMPiCkZ5xRvQbCYbfsg+PkYiEzuGT34VT8VvaP6nTg1p76+vF2W0r?=
 =?us-ascii?Q?3OCDVhxC5pK+eIAMeF9RGnz+ESjvSyBPzSC+VnQTkvIvak+zfif8dh7Jg+Qd?=
 =?us-ascii?Q?PiQyaMvuwVXs/S22jqY6AudtHDLX4Op+n/xH38nnfySWd7BBIGrOm7J9Qo9t?=
 =?us-ascii?Q?I7Sz/UP8x5HjmoGAceRiUgv+XT2M9qzDo2Vw3EJ/2UroVPlWinP/ozpp3LmN?=
 =?us-ascii?Q?dWY8np1IMebf4VKD5jl7KNAcXQ8CwnIXyap+/0aGZ94hrRrbHu6A1CF7gAz7?=
 =?us-ascii?Q?SyTSAnmuOdYwjWzg3qrjjdzZeHOHiUK+cs73DKU4MLkWKWJFh7tasDIrccs3?=
 =?us-ascii?Q?WM8mzP6+XVZucyTnglHPCsLT2wAic4VSbNvxn/95kSSwPUFEoovwK6kVU5ua?=
 =?us-ascii?Q?L1mWDv0kJA43b0tLt5oysVPXQkOzGVMVcBXdx1atcE+QI1qWbKNlXUakEtsD?=
 =?us-ascii?Q?n2r0CVEK325kPwdcE9NqUw1dcIBrKnG8tI526MM1ymdm5MgwWAnS6eW/4APw?=
 =?us-ascii?Q?DhSqW/m3J24hc/BGgXzj7jy4/p7EYjk8lkTX1/axkQNJTK/X3+xz0BsJ1Eby?=
 =?us-ascii?Q?LA+saTePuNsHM1VlLRr50gO4DjMqCiUtd3+jbdTTo9rEuC+p4eTs9jcY4ro9?=
 =?us-ascii?Q?Jhulc2vQQBjn3eXxjccd3LzgYww2k72MjTHTUpC1ktWq3PdfaLf/085H7bhd?=
 =?us-ascii?Q?8ZIMvfysD86g/cj4fS3WeVNUnG6dbg2HYbkc0AICUFDBA4XXCoc9zDNFVnhX?=
 =?us-ascii?Q?1nh3jnY9mq7ftcmElXWL9rdcV18OVoAOKxKDAwzlAeFdPFXf0ZTi5ZNeQosY?=
 =?us-ascii?Q?8c96+HlXDDl1Ey2SNNiFHhdp0MWqpsT5cbOWDr3pprgBnmyXfOlz/bpJ2e9H?=
 =?us-ascii?Q?vXn3inQoTYnsy8wOR73RClie2payv01OD0z0kdyocIlQ4VZjPriLXR3dEQPy?=
 =?us-ascii?Q?KyfwhLxOLOnp7f3SzJHV+WPLL+Naxc5NHZouP5va2hppDWMOq2rsrnOK6ygz?=
 =?us-ascii?Q?4OhVN1u8u2dM+IVkZALMO9BcHwuEZpw+WtJFjKM90un+G362r+hXGW3l/EQM?=
 =?us-ascii?Q?rWfy0NtZqHTZXJF3P6H7xE1gdDTARLeZSgenHPM0IGPgcUbe7aULKFfSfLca?=
 =?us-ascii?Q?fU7/RLkmudQB72DsmS4HcUIyMY8WC6+8OLe5Xf4SBXu0y/r2VJdFepSiVulq?=
 =?us-ascii?Q?v1qgHO1n4OM0SzYB/0pUSUkJRPR1mr32yYtYpXcBdkZk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48eef141-159e-4b58-a083-08ddacbd4667
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 10:05:08.5852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/dxYwR+VUHj7VD9zvubx4GsFkLyMLFs6ibNJN8wAIgTIjOZyWs2F2x72yM1YNuMIOYVm5tSKYdlcLCrAMdzkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6271


> From: Xuewei Niu <niuxuewei97@gmail.com>
> Sent: Monday, June 16, 2025 2:30 PM
>=20
> > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > Sent: Monday, June 16, 2025 1:48 PM
> > >
> > > Hi, Parav.
> > >
> > > Thanks for your detailed comments.
> > >
> > > > Hi Xuewei,
> > > >
> > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > Sent: Monday, May 19, 2025 3:08 PM
> > > > >
> > > > > > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> > > > > > > This patch brings a new feature, called "multi devices", to
> > > > > > > the virtio vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVIC=
ES"
> > > > > > > feature bit, and a "device_order" field to the config for the=
 virtio
> vsock.
> > > > > > >
> > > > > > > =3D=3D Motivition =3D=3D
> > > > > > >
> > > > > > > Vsock is a lightweight and widely used data exchange
> > > > > > > mechanism between host and guest.
> > > >
> > > > Even though it is the current use, the specification does not
> > > > prevent its usage
> > > between two guests via a host.
> > > > So we should not assume such guest <-> host communication as the
> > > > only
> > > case to add new feature.
> > > >
> > > > For example, in the spec only must requirement is that src_cid =3D=
=3D
> > > config.guest_cid.
> > > > Dst_cid can be anything, it need not be well known 0x2 (for the hos=
t).
> > >
> > > Yes.
> > >
> > > > With this flexibility in the spec, one can connect vsock devices
> > > > with multiple
> > > different backends.
> > > >
> > > > For example,
> > > > QEMU can insert one vsock device for VM to HV communication.
> > >
> > > It is also able to communicate with other devices on the same host, i=
.e.
> > > VM-to-VM.
> > >
> > > > A real PCI device can insert one voscket device for VM-to-VM
> > > communication bypassing a full TCP/IP stack.
> > >
> > > AFAIK, all devices are implemented in software. Is it a real PCI HW d=
evice?
> > >
> > Yes. virto PCI devices are implemented as hw or as vdpa for many years =
now by
> cloud operators and by NIC vendors.
>=20
> Thanks for your confirmation.
>=20
> > > > This means there are two different backends.
> > > > And these two devices should not be grouped in the use case you
> described.
> > >
> > > I think one group is enough for all use cases. It is required that
> > > CIDs are unique in global, i.e. all backends.
> > >
> > > As your example, let me assume there are two VMs
> > >
> > > 1. VM0 (two vsock backends)
> > >     1.1 device0 (cid=3D3, default), backend is host kernel (vhost-vso=
ck);
> > >     1.2 device1 (cid=3D4), backend is HV (virtio-vsock).
> > > 2. VM1
> > >     2.1 device2 (cid=3D5, default), backend is host kernel (vhost-vso=
ck).
> > >
> > > The device0 is able to do VM0-HOST (src_cid=3D3, dst_cid=3D2) and
> > > VM0-VM1 (src_cid=3D3, dst_cid=3D5) communicatation, while the device1=
 is
> > > only able to do VM0-HV (src_cid=3D4, dst_cid=3D2) communicatation.
> > >
> > In example 1.1 and 1.2 no devices are grouped.
> > Your proposal of this patch wants to group the two devices and pick one=
 of
> them as default device.
>=20
> Yes. I just wonder if it is possible to have more than one groups in one =
guest?
>=20
For example
Group_1: two devices dev0 and dev1, implemented as PCI HW devices.
Group_2: two devices by QEMU SW implemented as sw backend.

All the 4 devices has _F bit indicating they can be grouped.
But there is no indication that they are part of which group.
And hence the guest VM driver is in dark on how to forward requests without=
 the bind() call.

> > If device0 and device1 are inserted to the VM0 with the feature bit you
> suggested, the guest things that they are part of the same group.
>=20
> In this patch, we don't allow to insert devices without the feature bit i=
f there are
> already devices with the feature bit.
>=20
In above example of two groups, all the 4 devices spread across two groups =
has the feature bit set.
Yet, they cannot be grouped correctly.
Driver driving blind thinks that all 4 devices are part of the same group.

> As a result, there can be either multiple devices with the feature bit or=
 just a
> single device.
>=20

> > When bind() call is not done, host sw does not know which device to pic=
k up
> between device0 and device1 when binding the devices.
>=20
> Are you referring to an vsock application on the host? If yes, "host sw" =
is able to
> pick up one device according to the dst cid. For example, pick up
> device0 if `connect(3)` is called.
>=20
> Please be aware that the "host sw" can not pick up device1, since its dev=
ice is not
> in the host kernel.
>=20
> > > In a word, a tuple identifies a connection.
> > >
> > > "Refuse to connect" will be raised if the device1 attempts to
> > > connect to the device2. "They are not in the same group" is a reasona=
ble
> explaination.
> > > Am I right?
> > >
> > During bind call, one needs to select the device when the devices are c=
oming
> from multiple different backends.
>=20
> Yes.
>=20
> Thanks,
> Xuewei
