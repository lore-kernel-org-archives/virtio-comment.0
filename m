Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5841242AB0
	for <virtio-comment@lists.linux.dev>; Tue, 17 Jun 2025 06:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750140096; cv=fail; b=lV0rP2iHqZDgwufRRMVHJR8R5iRcyIFbSro73P2mAJuaXwz39TISAbSbNuomCOUurPXoDnRlX62vrHzhoNJv6TNSho7OlRqhKTrzYG4mAQbmcIs59OoIhuR0hSHNWMatQZIz/V/ZCQwPMifnsaGoeNlQX/DPDb9HHz4/kcyPnjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750140096; c=relaxed/simple;
	bh=WTYmK7A3zdK8oBXz+a0LPuifAUXECG7BC3wieN2B5RI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hOIU1bfX+LUHBLpiC+T+hR8Masy8RNg50gWVhJEYlSGrCNnvVoSfaHi5CCdFq3mTIVD/TlXDnZk7funpK8Cy1D3fAV73pwziBoZ/A1k+bibrVT2a9knK0EJyDjSZhrhiSZnMFD9ktVS08sBmq4wE07osZE/7kRxUDTwGmvtRMF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=psP9t1Ea; arc=fail smtp.client-ip=40.107.92.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="psP9t1Ea"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHBXBU2Iif6EO+nhihwz3RPuyB5PeHUGcuYQ2vPci9yJL0LCvwwC2mttgWS2uo2uiprD6oZiMzX12mrrM7CCfJZhNyhKt65sJ7afSrAk5el/UQBnt3PO+fs6NbGlZWQC3D2UhVqr2dhjCgnGf1Xh4tB9CbnTF90QREIiFj/3HTyao45ct2ICuz4ltM0h2oBbrArJYX7BVQjsRjaL1yQjL3shPLlJX/tQLh9bzvbK5o4PnQXAcMGfSovBW/RPuOVEEcxOcKLWYZL0UmkFZWpoisBUcZtGoDc3iNMQcL5XYWm6umE0Ng8uDFWx5xk2r+2BRcBiEMoyMG+BgCb5s/SisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Od7noWrIoagzTKi2HoFtPEaavViVGgLBFjV1SqrnsyM=;
 b=FXqpfR7i1rzy31Ir4YyJJH2G9JByK8uPt4pKRcDu6VaWrbXxNPgb8Ko8RVlFEb+0E+ehORRx2mafBwYJ/v8cyGZohGRZxDXv0wxfdNNc83CoPhsPVNAIOt5uESYohZo8GZy9uNoGMC4kkrc+iZnj1+5SrbERngCk685yEvs5euEnSgCUaQ67DirtmMC3wpUa7xUV1QUeY4fuaRY7IhpgFKM1IGEHoBtF907u1LyuK179AQWQvficYpBJFNFsk5zub3AONhSVP89FMJ0YexGXHO+tpeZslo7IVVERi1YTfgb+WBiDhJvxWlfvdymguElhTLZrtq7tNOf9Seo1CBaing==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Od7noWrIoagzTKi2HoFtPEaavViVGgLBFjV1SqrnsyM=;
 b=psP9t1EaFsn/ceeam3n9WQhxbxJ8Cnl74484ZgSCP1nVgnpLAts9UfK4+4TTCiPXfBRDY2ErZoCWoGXhwBwmhF33Rhw5YB1T3Fw8GUc1sDQjQa4wMKTC6D58Y7hcZwMXM9ya91D54arB37uuduafDcJiL+dx+85n0+tEZoGWLYNTuhqcXleUcTvZ/Hy15Qf6FTaQAZ5FW4+sSJpviAGTDtGf+H6PsE1RtkgpOJVOG/feMuXXFQLBI1fdgQzpYtBrBWzvIvZvYEWuH0Uf+iAgd8IYkBoImBD9YZaAulgCGAGcwBEJ5/sZD2kmyAeSocPN/uqiS3kdbJDuRvb6YJ8f7w==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MW4PR12MB7336.namprd12.prod.outlook.com (2603:10b6:303:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 06:01:30 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%5]) with mapi id 15.20.8792.033; Tue, 17 Jun 2025
 06:01:30 +0000
From: Parav Pandit <parav@nvidia.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
CC: "fupan.lfp@antgroup.com" <fupan.lfp@antgroup.com>, "mst@redhat.com"
	<mst@redhat.com>, "niuxuewei.nxw@antgroup.com" <niuxuewei.nxw@antgroup.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Topic: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Index:
 AQHbq7cy7Mcj3ywZwU+rYtE4WxELUrPZJsIAgADFHgCAKVi30IACkmoAgAAAtsCAAArbAIAAB65ggAAY2gCAAT4eMA==
Date: Tue, 17 Jun 2025 06:01:30 +0000
Message-ID:
 <CY8PR12MB71953DBC944921FDD7AB630DDC73A@CY8PR12MB7195.namprd12.prod.outlook.com>
References:
 <CY8PR12MB719558D3E9B840AC0E7C398FDC70A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250616105610.1163586-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250616105610.1163586-1-niuxuewei.nxw@antgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MW4PR12MB7336:EE_
x-ms-office365-filtering-correlation-id: 284b7dd2-a541-4ace-0c94-08ddad6467bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Xi131J5b0a+LGr2bLuES/DXWgSDBaOEhhfTMaGqNlC5Ef+PxnXjbJLtKOgyt?=
 =?us-ascii?Q?S9f/FeqaMEI8w4tIHAa3QjCxV799kQOqNtJ06ThtGonsxEqIedBnAwZb4hUC?=
 =?us-ascii?Q?qSMcff79TM9fVWOnQe05FbFG0/yiv6BL4q2ytnddIGpY5frG9t/AIk3GV0p9?=
 =?us-ascii?Q?WyRy4mMIM+yoFZoapFzQmxnb46l5lJkWYiljgAVhENo2uo+eJ1IkMNIjSitp?=
 =?us-ascii?Q?upvjhcYYR/WRKcIL8Znk99Aaxnv7v49/y0qVyKbtu+tcXAoKqcRr7UKde31G?=
 =?us-ascii?Q?tcQqyOyk4P/JVqxJRn7eFVb8VU2EAKIoYNA2ePIl9GWrmVhXqRJ88B6wIs0m?=
 =?us-ascii?Q?oKeYB4JrE/wpPjx8oWMYmD8flfVQstwmZ2hvTbqiBWO6WIPe+opc6lBmPbgV?=
 =?us-ascii?Q?8B3ZnWAAwrVQfT2K6oMW7gBxbHTyCK6qdM8GSNkokExaJZdnXNYq/m7gAdJJ?=
 =?us-ascii?Q?7+m2CykWN1x54m4BtdMjUfdiNn/yOcgKogMk1Cb6rDy3lD5rfDB2/V9pH6R8?=
 =?us-ascii?Q?xlMWiZuW5PluJGVF1DbFAI3an9BoZC0RmCIeo6D+yqEf82yhap7Pa6eAYDNo?=
 =?us-ascii?Q?47grl8eblwnXKMKZ2nAOksD6Edt79rDwtzEuliKjl8yxTBYXiaPbHi2sBxfd?=
 =?us-ascii?Q?zIPkNEXJ9lbNridlbsC7sCRGu6DECA8ZmMZih//gnyoQ7e2pWmLnRTB+eusw?=
 =?us-ascii?Q?JBCwYGft7uj4QXOj6TYaDjyil6mlZN30TmWQll5Tok39a/rJv5FqfPFdhepH?=
 =?us-ascii?Q?Uysy+TmHWd7V+B2gb50vlaDDHxcLnsVZ/08PuFsDZSBlR0GW6WCXxYNHXJkJ?=
 =?us-ascii?Q?4O4zJQo6hZc8oPvTs+xuLq1yZ0jIk80UZBuFeTjbqxQKOwRrFPzEla6ien6l?=
 =?us-ascii?Q?RqyHi6bySR9D8o6305BY1NBt35LjvQ+WBPn8c3WQK1FyjE2cLbbZHqsre57l?=
 =?us-ascii?Q?4LA4prO7NsJhkml2YM43vatqqtqTv4YNNvLjp4jMONAP7RkrS8dsmbzCfBjO?=
 =?us-ascii?Q?vk/fss6SsGc/uP3wySNQybFqB4O6Ee235eq12w3ApwdPy89RBn008k5yADV5?=
 =?us-ascii?Q?+To2mnXT2JHIvKd9S/45aj9A+izeSXwq3HBHxg8s/YtqorgLTDPXOctIlxk0?=
 =?us-ascii?Q?mRSS44h3B8mFoMfYTHD8bj8h3LcOVvhg84K6rlQpbmEBQIb30D5GWObBMJEm?=
 =?us-ascii?Q?ZTYvSnJonX/ZsrZV5yjolomn1wD0SShxxe1VUmT3juBW8nVoA47fmYIPm/CM?=
 =?us-ascii?Q?9EyaOE+sDbjZM8T35vc25yw/i6HcPuG9Q//Ty5WG1KPV9aSPrLfbr1PPYlFU?=
 =?us-ascii?Q?dcdjphfJ/b1+JLpgb08ED1BzdCLBuL/gGe1BR/K2ltCQYyzn7XlyDJjXSlht?=
 =?us-ascii?Q?Pg66BGgIBvACNoKjOrDfE6I5u1I07LveWw+AMD2GiyVL1EFmGAbP8sLCFbhj?=
 =?us-ascii?Q?AuLXfoS4mfbBPHMCOR78hLRwzQT7TtyUeFlukSajCvgFI91D0vzkF6xVS4r8?=
 =?us-ascii?Q?iqE5oArjVaoubtY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gF31aCuCm3epA3vUnrMr1/g+ibVEuyOU+8eYUAj7Joa2fZJU5jN1xivMY+zr?=
 =?us-ascii?Q?M9Jgc5rxJUL4QmLFNELSP83w9rp9Wdl/P+ZVcB2cjq/ZofKyZ23ko9hncMKr?=
 =?us-ascii?Q?mXdutSwyhW3PPxnIa2lJMXRkpz/QIxV7TflnYGdDFzZF/O67qFABVweSmE8j?=
 =?us-ascii?Q?W+B/BSDq8ohyKv49CfxrWl1+dHhfqsAzboTI7kWPluBSTFJThtpllipikewu?=
 =?us-ascii?Q?XFA4kCkB6L19FZlJQ5F/B5PpC8ot0fdamjEUoxmquxGDoD1HX3RsHLJuKCCO?=
 =?us-ascii?Q?d9F4w4ljSil8TAGuoWPbog8nTa91ZxaO1pSWRk8WcsCikpycHq/dWPe4SEkV?=
 =?us-ascii?Q?LLRPUt6tQITg+iNRd1WF5SjuG3tSk7MggZNgIPpLSsgpi6g+H4ns8lPiMJ48?=
 =?us-ascii?Q?7bVZxfc3rk+1T6bci0dRDx8II3mtgmB1wTDEVrBFVM45fdfKRCj5hgNccUdB?=
 =?us-ascii?Q?qSRmwsbV6/CLM8zGQWZWEMLVt4WM4+416FRN/vRrPju3SHTgturwTA3Mg5SB?=
 =?us-ascii?Q?LAraobzSfn8EbLmhJq5mzDlqQOKoZBkVHDHLeh5gqSJJfrFih4gCPrIQOa+a?=
 =?us-ascii?Q?Ld7Zyr2iqdk1Q9WuotmRKHHOerdG5KA7Salb98cXKTOB2apmUCvwfF8nrd7s?=
 =?us-ascii?Q?oAJ+5aOWHUqbOjZLaOOudoQfvK6HWGFynUerobgp1kVTVCjAVAoM0qi/N9To?=
 =?us-ascii?Q?jSqljcAYGL7J1Lf0RSd+3glKIzd5IBU1lNikrW1l4WLWsWLzduewS0m9LxBw?=
 =?us-ascii?Q?17ETVUXM74UOnSkgL44eczUQlDgSPFkZmXkvQT+2dAHEgD5GwcQ0HMQuYi8E?=
 =?us-ascii?Q?RKO3To8MfuIspx6TzfQo+PmiVR4yfGOGSkOAfXc5KJW7qFXjWCS+/NUS4BLK?=
 =?us-ascii?Q?W9NOVeT7aG1IKqPRZdRX53Qac89qNY+lwHtWBrG+7n9m/AqRUW233y6eY7Jc?=
 =?us-ascii?Q?xqZmCuFCxg3yXUmPeaZkLW/XO5qWbUKZ8GpbLbe7fjRgaGrGPjWtHO/qDy5W?=
 =?us-ascii?Q?VlfXuYb3xnyes27TxOVkgVD/f7Y61Aevd5JAKZ2UvRrlQjAVnLDrrQhNIWPl?=
 =?us-ascii?Q?uvyeSX7A8sBYNV64u3IoQz1YMk8MpWD5HjGyNuox36gnaTReh6rkwmNduAFC?=
 =?us-ascii?Q?/7aUgm+pm8AOSHPM1lm2EkfEsv/lHHE8S/TpVkrGT7b1nCsNdZwd8U8BzZzP?=
 =?us-ascii?Q?Yu/x+JQXUEQ1xstkA9GVxk13KuKuIW9dNivi3MYSmtiOe+KoJ5nmE8aVhzZZ?=
 =?us-ascii?Q?ZsYPRMSHmM2P8HmLrzG+dcn0QKRa+wNpCSs9tRHtM/HW1jKB/GlBW8NPvG8x?=
 =?us-ascii?Q?5bnIziRNHc5NlDP/VRaOFY6bgEf+gTaPu+F95jTvfQ4M2thw6X9A1j/J9G1w?=
 =?us-ascii?Q?8WwbOmmT7YCC1yjClX85eaHed9RwKaNKgN18Tj34/Trzj025ZVvSFip9/Jfk?=
 =?us-ascii?Q?ShZ26j9kL0c/DLsGdO8fsDsVc/c1QLaItgZpSLqMkm1+p6DTbxQeznuP32qy?=
 =?us-ascii?Q?2ak8n+RKDNLiPDvKIHDEZkFSLazuYRopMoI9xRs5lWYsMuTNmALZBNIXxmK2?=
 =?us-ascii?Q?gzuLTq5/e02o4LNa5v/XF11VquRMfKXtdnHwlsZkWFCgCOeCigm7Uf96pWxz?=
 =?us-ascii?Q?tep9epUepmSmZLMUHD3tTggykCyefiBiAfPhUhqelbjG?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 284b7dd2-a541-4ace-0c94-08ddad6467bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 06:01:30.4751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z7IteQDn/No1QMn9WDHF1WTWAUQX4ZqRaVvwsCanZaXZjxWZd3eETmdsy7D9JcfpYLBZiCMzUuwWGj6OHJe4Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7336


> From: Xuewei Niu <niuxuewei97@gmail.com>
> Sent: Monday, June 16, 2025 4:26 PM
>=20
> > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > Sent: Monday, June 16, 2025 2:30 PM
> > >
> > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > Sent: Monday, June 16, 2025 1:48 PM
> > > > >
> > > > > Hi, Parav.
> > > > >
> > > > > Thanks for your detailed comments.
> > > > >
> > > > > > Hi Xuewei,
> > > > > >
> > > > > > > From: Xuewei Niu <niuxuewei97@gmail.com>
> > > > > > > Sent: Monday, May 19, 2025 3:08 PM
> > > > > > >
> > > > > > > > On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> > > > > > > > > This patch brings a new feature, called "multi devices",
> > > > > > > > > to the virtio vsock. It introduces a
> "VIRTIO_VSOCK_F_MULTI_DEVICES"
> > > > > > > > > feature bit, and a "device_order" field to the config
> > > > > > > > > for the virtio
> > > vsock.
> > > > > > > > >
> > > > > > > > > =3D=3D Motivition =3D=3D
> > > > > > > > >
> > > > > > > > > Vsock is a lightweight and widely used data exchange
> > > > > > > > > mechanism between host and guest.
> > > > > >
> > > > > > Even though it is the current use, the specification does not
> > > > > > prevent its usage
> > > > > between two guests via a host.
> > > > > > So we should not assume such guest <-> host communication as
> > > > > > the only
> > > > > case to add new feature.
> > > > > >
> > > > > > For example, in the spec only must requirement is that src_cid
> > > > > > =3D=3D
> > > > > config.guest_cid.
> > > > > > Dst_cid can be anything, it need not be well known 0x2 (for the=
 host).
> > > > >
> > > > > Yes.
> > > > >
> > > > > > With this flexibility in the spec, one can connect vsock
> > > > > > devices with multiple
> > > > > different backends.
> > > > > >
> > > > > > For example,
> > > > > > QEMU can insert one vsock device for VM to HV communication.
> > > > >
> > > > > It is also able to communicate with other devices on the same hos=
t, i.e.
> > > > > VM-to-VM.
> > > > >
> > > > > > A real PCI device can insert one voscket device for VM-to-VM
> > > > > communication bypassing a full TCP/IP stack.
> > > > >
> > > > > AFAIK, all devices are implemented in software. Is it a real PCI =
HW device?
> > > > >
> > > > Yes. virto PCI devices are implemented as hw or as vdpa for many
> > > > years now by
> > > cloud operators and by NIC vendors.
> > >
> > > Thanks for your confirmation.
> > >
> > > > > > This means there are two different backends.
> > > > > > And these two devices should not be grouped in the use case
> > > > > > you
> > > described.
> > > > >
> > > > > I think one group is enough for all use cases. It is required
> > > > > that CIDs are unique in global, i.e. all backends.
> > > > >
> > > > > As your example, let me assume there are two VMs
> > > > >
> > > > > 1. VM0 (two vsock backends)
> > > > >     1.1 device0 (cid=3D3, default), backend is host kernel (vhost=
-vsock);
> > > > >     1.2 device1 (cid=3D4), backend is HV (virtio-vsock).
> > > > > 2. VM1
> > > > >     2.1 device2 (cid=3D5, default), backend is host kernel (vhost=
-vsock).
> > > > >
> > > > > The device0 is able to do VM0-HOST (src_cid=3D3, dst_cid=3D2) and
> > > > > VM0-VM1 (src_cid=3D3, dst_cid=3D5) communicatation, while the
> > > > > device1 is only able to do VM0-HV (src_cid=3D4, dst_cid=3D2)
> communicatation.
> > > > >
> > > > In example 1.1 and 1.2 no devices are grouped.
> > > > Your proposal of this patch wants to group the two devices and
> > > > pick one of
> > > them as default device.
> > >
> > > Yes. I just wonder if it is possible to have more than one groups in =
one guest?
> > >
> > For example
> > Group_1: two devices dev0 and dev1, implemented as PCI HW devices.
> > Group_2: two devices by QEMU SW implemented as sw backend.
> >
> > All the 4 devices has _F bit indicating they can be grouped.
> > But there is no indication that they are part of which group.
> > And hence the guest VM driver is in dark on how to forward requests wit=
hout
> the bind() call.
>=20
> I see. Thanks!
>=20
> My idea is that there is only one default device, no matter how many type=
s of
> backends are. If the users intend to use other devices, `bind()` call is =
required.
>=20
> For example, we set `dev0` as the default device:
>=20
> 1. Do not call `bind()`: use dev0;
> 2. Call `bind(${dev0_cid})`: use dev1;
> ...
> 5. Call `bind(${dev4_cid})`: use dev4;
>=20
> Even though we introduce the group concept, if we don't call `bind()`, ho=
w does
> driver know which group to use? If the driver recoginizes the dst_cid, it=
 can use
> the group to find the device, then the things will be complicated. The dr=
iver
> needs to know the relationship between the dst_cid and the group.
>
Based on the dst_cid picking the right vscock group would be needed. This i=
s vsock level issue at driver level.
Driver would need enough hints or encoding or of dst_cid or something else.

So even though we miss vsock level construct, it should be the reason to no=
t group the devices.
As both attempt to solve issue at different level.

> WDYT?
>=20
> Thanks,
> Xuewei
>=20
> > > > If device0 and device1 are inserted to the VM0 with the feature
> > > > bit you
> > > suggested, the guest things that they are part of the same group.
> > >
> > > In this patch, we don't allow to insert devices without the feature
> > > bit if there are already devices with the feature bit.
> > >
> > In above example of two groups, all the 4 devices spread across two gro=
ups has
> the feature bit set.
> > Yet, they cannot be grouped correctly.
> > Driver driving blind thinks that all 4 devices are part of the same gro=
up.
> >
> > > As a result, there can be either multiple devices with the feature
> > > bit or just a single device.
> > >
> >
> > > > When bind() call is not done, host sw does not know which device
> > > > to pick up
> > > between device0 and device1 when binding the devices.
> > >
> > > Are you referring to an vsock application on the host? If yes, "host
> > > sw" is able to pick up one device according to the dst cid. For
> > > example, pick up
> > > device0 if `connect(3)` is called.
> > >
> > > Please be aware that the "host sw" can not pick up device1, since
> > > its device is not in the host kernel.
> > >
> > > > > In a word, a tuple identifies a connection.
> > > > >
> > > > > "Refuse to connect" will be raised if the device1 attempts to
> > > > > connect to the device2. "They are not in the same group" is a
> > > > > reasonable
> > > explaination.
> > > > > Am I right?
> > > > >
> > > > During bind call, one needs to select the device when the devices
> > > > are coming
> > > from multiple different backends.
> > >
> > > Yes.
> > >
> > > Thanks,
> > > Xuewei
