Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C90202642
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729270357; cv=fail; b=GcmR/5AoXVdJ1xgCST/7IZjVNVyqnIfjqzZT0dRPol/ALHF8t8y7sHYROK3+R3yLz97S9yccwrwLl+WgomduWjjtzec8oE6N3SSKvFmH6A8TCdtTAU1Hsgk0xWEv6EwDoewUFBQUypCkvXYVKNC4CtdrtYyPx68QCDDcTfbCxyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729270357; c=relaxed/simple;
	bh=dzRXUxyk041EvfLJUnf7rlHMpJYKacw2fKdQ25eCaiQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Se6MerU/bO37bWuWHf6OmyFppsXRaDpBtPTNwZv9NUA7NYheBc3rKs9Tg2szzEGcRYOA6XFEBLkglj+KKdivHX8lxg+qcQEasi6Wn+uVSdS65JW3jEOBplmNSjlmgufKwoWmTc99xGnCnOyFgRjZkosU8sAeuwW6DKo7stnIZFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bgxNu3ZF; arc=fail smtp.client-ip=40.107.212.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bgxNu3ZF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNpzxPI2fXTvBfyUNE+Xbp0AHorSVags7A3Tbd02jJzUb3l7fV2tUqgB0nm8hM8ZT5Rgwe3n5D7KGYdplLenNGaOICr7i/XrRBf0ByrCuCJrW8yHdoegdUC1yykuH03TQKt2DwkoPYiN7kylKK07MOUblX1Rr/bkf/23i1QOzJTmIJ3UwmSJThxPRCsIYUZb4jVT2yCj2Zjz8pbrtT/3argtcKkA09DlqxmuYCHcDGKUWdmZIuH9/FO/v6v6RGZvw51/jUFKN6+dpjijk0xoIovjdjO+f2XMTh2mORNhOpx1ONkX0tjBy0qzGXYtyUVcW9gNO4sbespc9ax4yjHKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/C0xx1mr5QGl3fTC/2so2D6z/N9SB27IaUwl5r7Ubw=;
 b=P3ainjZx5qkg36D110mG6h27cJsVi+fCbyDojwqprpxdKrIlqz4VY2j2cMo2S74i7x2r7Tr/ehWPzFfDF2VBX1dwc5s8QzgmxDzQ6O82HtqJnZpl5LnzXIgDrgfGlxdLbqtyai4JKCn84XmLN27tOgF+GeqAJqEud/s6iidy620igEX/LdVtgqL5Eg7q2KI2eMHudHWJYlC0V7NMZ/mor+FAn/MgJ8NkIi8wnD74BU/xEWAX/ns7PRb1l7i2LVe0Pe6tXHdIjtw1T6EY9i72FMHHp/jo11CTjXHPYBoEj8tz3hgmzqdQ05oLWiYaqyHpCwA7f0t1oo9PwkQobj5uTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/C0xx1mr5QGl3fTC/2so2D6z/N9SB27IaUwl5r7Ubw=;
 b=bgxNu3ZFGkf7I5Ghxf9mPVcAX8tk5EBgtYLgBPBSQqnHeoiyox4RktlEgF7um11Mnrga63elVOABacnsZbcc5E2rv2ycOiNOEG0biLr9pyr61Sbl/5WUxw8ESzOE/lP5NKj/o1PDaQX9tr5yixB8AnPBTJ9QqCSAl17QjJD2sPWbAsVFShcsLAHOt9QxwCK7zUVj/yZIx4i4N+dibwflrMiwTQDU38mgxoegDYGB+Et+KaMjlWO3OmcOV0xe+vQxcU16MqHitiWycnotxj0bxdbQOVDWgN3TPV+ovXaztXuo72uf0GXTyN73OH7vNmapKYmKoB7XtKVvwJ0eqm6xFQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Fri, 18 Oct
 2024 16:52:32 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 16:52:31 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH 2/3] device-parts: Add device type specific raw selector
Thread-Topic: [PATCH 2/3] device-parts: Add device type specific raw selector
Thread-Index: AQHbIWAx/9jXH666MUS+mTJabkcYoLKMrn0AgAAKy4A=
Date: Fri, 18 Oct 2024 16:52:31 +0000
Message-ID:
 <CY8PR12MB7195D4B28AD9BD2944926644DC402@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241018131741.443635-1-parav@nvidia.com>
 <20241018131741.443635-3-parav@nvidia.com> <ZxKJFLT5Ewn5Qhf/@fedora>
In-Reply-To: <ZxKJFLT5Ewn5Qhf/@fedora>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH7PR12MB6882:EE_
x-ms-office365-filtering-correlation-id: e0225f9e-48ee-4f0e-6a82-08dcef954221
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6MekbAVmfMotC0NKvhgxlxHRt5Xx4mzNPOu884pNtogM/p6coN9RNUeUzvzV?=
 =?us-ascii?Q?YuvXwqAr5Y8kZKcKp2/j4X4somTYplS2iCxs0KGi6SSMlzGMJsOvI400mjmF?=
 =?us-ascii?Q?ta/EigLHEd+MQ+LgCc5c4luURvkaAjKORKZNDKb6joYh9U3j/MUY83xyxaHO?=
 =?us-ascii?Q?z1uIcsbHLmCZWDBuwIIx8Wgr1AEpq5evx7TbiF/j8mot4ldYAkJ3fbu5Upxs?=
 =?us-ascii?Q?IjvL78NeCTg71wI1TRsnI6ycvIBq8ebi1YW+PoFzSg84WCvVUhkO7NqNA2Ty?=
 =?us-ascii?Q?VeG8iMf6xzYJnaII8D7euulpGdFHekaQI6zmah2VgxfvB2MTHIo3HN3ZT6v+?=
 =?us-ascii?Q?GiB6E7onCSVUfzaAJWRNGffXshYPcaFYOcDJhIRDMyGXANfjRMVQk2/2184j?=
 =?us-ascii?Q?5zFaBFR0XdFrSSS6rAn/CU1LfdpOzlAsBkjVn5wjyxBEhdAwXvjV9ZemkfTI?=
 =?us-ascii?Q?n0FWtLVgqOx4qq0Ct0AXpf5mupj0H+Duk9odocAwubL4sKA/2SMSXfTNDcUO?=
 =?us-ascii?Q?NZDb62FOsIAvgHfvMO/FEr7ZNqsKbUnuR4PwOdTEV6kqDFAiWTFsYe07UqJP?=
 =?us-ascii?Q?YvC4cnqZvr/BhwyrArBqm4EOifnrdCSVcuJWZASylZu2WsfiODDG+6eE4SDt?=
 =?us-ascii?Q?xKDQlXpqqh8Vgv7aZxjDduh6q2WQvbqWvwb0VxhKFMEy3/raotRQxYebYPlX?=
 =?us-ascii?Q?H3qHD+Yihs9RFI1F668PDc7zK5LA0izaGOtxiFYWA37OXfqeMYkoInInt7qv?=
 =?us-ascii?Q?VXv5dM4dIBjxn5y1nsK3zk+Op7zvFAfUiJxPGldT+NGNEOnIhTZxA541mLBE?=
 =?us-ascii?Q?AO+Ts0H5L8D1uPqLHCcBxgrEE09R3WxbLx/oCHI0uNjrJfd60zEzgMMntMIq?=
 =?us-ascii?Q?g2JlG7UJroztFhic0SxkE8ksZr457MW86J2nBb7FSsaci+ydwbxwL4FABieM?=
 =?us-ascii?Q?edfOS+6QoYZ0ozsFtO7yCKeJiz08qz1ej8wX5LKVMCJ8S1gztEDYFTClhkjp?=
 =?us-ascii?Q?gAYOcwg36xVSm4g/jWnZ7n0Zk9d3xU+T6MG+C30MqRyZ1byTLrxuv6BP+pUu?=
 =?us-ascii?Q?z7jAEe/Iw6w5hLnj6K6YalC71sYX0ckZqhyk4m8OXBTbvNl8Ohq5A2z3UrBE?=
 =?us-ascii?Q?cse6rRwfoDgfZXWRRHtDD930yaN53MW53PU0RbXAj9DcdsYU3vz9pnEMtgug?=
 =?us-ascii?Q?0HUYuwBMkREHDxrPAAZ7A2L3TERi3QQVWy1CWq0j1s2Qivki/UCwWukPYe7l?=
 =?us-ascii?Q?HR0vMyC3Dx+ZhDFWkq415IqRsnKuqfke6DSxia6j+LZ4pA8zi/oIVrtc38Jp?=
 =?us-ascii?Q?/+i/Fc5OeeLqmYkblnOWBwQTjwzI/jCYWOPLr3D4l1UGkQdg3Y9rYKEJgkL/?=
 =?us-ascii?Q?dkRWKPMRytJFq5cefl/x8vIcVwNN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rI9qvd1JJVY5Ma7kxQLxZbrxkTTPl+6vtD4x42uo19iP4mbq2SnSO11wXeXn?=
 =?us-ascii?Q?kQKomLRlqiOjNmSQeGl+isruZFtKYyzJvnHNkUWMlFx9WHomA4hw82XFLT3T?=
 =?us-ascii?Q?t6VBXKXrj+L8/pa8ZsyUKy7NxY5RvXNMqqfk0ulBuHy4YfNbaQc3gShE+oS3?=
 =?us-ascii?Q?hhURTnhwE+npLKr1GHm1hM1nzBN3R9KSzZLL7hlymptHpKDixVE0C+xKufaT?=
 =?us-ascii?Q?d8T/qg33exVSF4WJuHOOExgw8sSSvbSEQAHW8ZTbvv9mQZXOabcttshrYOud?=
 =?us-ascii?Q?3LAl/O5/yy5kp/LeDribMMXARF9+obmt+owWTDPtz/dkkZqJ5RRxs9K0Cj2y?=
 =?us-ascii?Q?A4GvsdvsdO/P3LmBlhukli524suC0CLRUNAtDKNRjPBzn6SKMfUPMxGdpa4F?=
 =?us-ascii?Q?Axv+c651tmBFOpt8DNELlDJJ+j2CyY0EE+svfTEwRVZ82ViBqWOtG7WHfii2?=
 =?us-ascii?Q?j3kwtdIT2MFmxqv7ZhIRvKGxxQjKYXjuTZzK+k8AhPTCT4iZxfwYBNzT3MQv?=
 =?us-ascii?Q?6lCRs6SX0UE0S/hbaHFc8kNv93E2dV0+NdLpjBxxj//44N1q72i1SV1EDHWm?=
 =?us-ascii?Q?nFRW/oWwVsCYSkGmWFqU+vj8o3InY0MWTma7YFbdASvdbZe5WFLm/Lnv9Ik9?=
 =?us-ascii?Q?Wb9gc10F6q6ub6UVSrMTtnodOfxttfVKSmsELGI3/T3ZHnb8cyy0hrzgDH3Y?=
 =?us-ascii?Q?xC/PazJtdHpYc7uTbdiUG9E3y+wJHXDybOjRE2gCL8/hbfMaI85ak9HMDEDU?=
 =?us-ascii?Q?xihZDRZE/gK0J1NyldxnT+pTGQXJmOJ0sl7giNmg0WypVSs2cZT3usINb7Mz?=
 =?us-ascii?Q?h9b2vGsS9cOxOy4hmhDSGg6bN1cvIK1Qhu93Jj8+oZ8HP780DzRZQfOl9GMp?=
 =?us-ascii?Q?rQq5Iuf5HCtkueJNjwXi3MD2jIbHKPr75B51BE5J4QgO7ZIMlomi9aQVh+pT?=
 =?us-ascii?Q?9IPybahtbdtVJi8nqCi7+q7otwP7B8kIbJo+Sy65QlT+evkrDxkn5keBuluT?=
 =?us-ascii?Q?U1D32UKbL7ReEGtHPX11yqE2OnbjMjFXskemhGgbd50espHvelX8suNc0tLH?=
 =?us-ascii?Q?8TgiYWiZXqirIi1mQjECSRVy+2LU0KwC8MS0yUiTdIF2guDzv6pEQg4oiqKD?=
 =?us-ascii?Q?Acxxsx3iIcN3L3sHQTp8UPWboc2pl0Zk5+qzCwkQY5uKdU6o5Gk0Koup2c+3?=
 =?us-ascii?Q?kU7VN2DGUCnJS7TqcqKtSlzXC84lWvOA6e7T80Fg3KOpsG9J50p3djpNeJX9?=
 =?us-ascii?Q?iF69okU3k+0wog8J0IJ8/2FgoDqQnjDkfROxcO5YUq7pGWZVjmgSH8lX/I39?=
 =?us-ascii?Q?BXMIzc/96BjzM6lm4sQwnQPCk7ursIV1J0io3YeOM40lRiRpKjg8kojFmng5?=
 =?us-ascii?Q?9T4gPLBIgV1196rpzRQHelcVbdYyqLZkgDVw//PuCnT1uN08PmRBJB8RmqWd?=
 =?us-ascii?Q?Yze6A/kVPrgsXCoTE6KUlMhDVkvQJ8SZ40yYN+vrGmGYQ4heFQCsmEw+DbH5?=
 =?us-ascii?Q?6aqlJXU93XIQhQvUcg/4jCzoUcnzBJIB7qZhLwbtTDEv64ksElOmnVkxKmL5?=
 =?us-ascii?Q?XB8wQTbgIeRXZrAM5YA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e0225f9e-48ee-4f0e-6a82-08dcef954221
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 16:52:31.7924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FTZoFJ8u1D1I1f2cS4fUgtrqtB0JfRFDsMv82QiukocbmH8iVd272gIqWdQ0kg6T+jbeWyuBjPUvPgcnVtl1XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6882



> From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Sent: Friday, October 18, 2024 9:43 PM
>=20
> On Fri, Oct 18, 2024 at 04:17:40PM +0300, Parav Pandit wrote:
> > The subsequent patch defines the device-type-specific parts. For these
> > parts, the raw selector format is defined to ensure that each device
> > type can specify its format accurately.
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  device-parts.tex | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/device-parts.tex b/device-parts.tex index
> > e59c0f9..ee743c2 100644
> > --- a/device-parts.tex
> > +++ b/device-parts.tex
> > @@ -21,6 +21,7 @@ \section{Device parts}\label{sec:Basic Facilities of =
a
> Virtio Device / Device pa
> >                          le16 index;
> >                          u8 reserved[6];
> >                  } vq_index;
> > +		u8 device_type_raw[8];
> >          } selector;
> >          le32 length;
> >  };
> > @@ -77,6 +78,9 @@ \section{Device parts}\label{sec:Basic Facilities of
> > a Virtio Device / Device pa  only when the \field{part_type} is
> > VIRTIO_DEV_PART_VQ_CFG or  VIRTIO_DEV_PART_VQ_NOTIFY_CFG.
> >
> > +\field{selector.device_type_raw} is only used when a device-specific
> > +part is utilized, with \field{part_type} ranging from 0x0200 to 0x05FF=
.
>=20
> Why is important here to mention the range of `part_type`?
>
Not a lot.
If the rest of the text about device specific part... is clear enough than =
we can drop mentioning the range.
=20
> Matias

