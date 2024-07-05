Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2105.outbound.protection.outlook.com [40.107.117.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C588101F2
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 03:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720150528; cv=fail; b=J02xALWJUjUvUAd4c7hJJDCrtJWdVXfkSU/9BUjlxo+I+FSYlCAn5yB/KeISyPkPWbLfGrRcUS9XspH566km4KDK/k7dxVTHl4cydc8NAuRZcrTiPOPGQwZBeex8ppS9WEbSkrE3pvYnWfLQbdJWwoxv5nbv/3WpAZe+76jnrvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720150528; c=relaxed/simple;
	bh=dP1Tkmu29XZOdTfbYw9a1QzZiMWGo4NDfGcv07Oqwls=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i2XUKOGvncpQOggM8ySQukY3CgyIdykbWrh2huRFLqBX3xkbITohhoDDNiPnK8IXvNRYlv7KPwNwUfpaNgi0gNm3t9pdtv9mPuf5j+SPxP1LGyWs4dPqEKlEZkn0VUeeMRo3jCXSE8a2acwmpquTcDYW+XqHP0bknHBLyv6yFcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=BL1LvazB; arc=fail smtp.client-ip=40.107.117.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="BL1LvazB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVekKJM9n6/iKHT12+LxLWrYCUG1dpZ3D8ixHfnx/OWoP6bbR5XQuiDpvaVWaHVG50OYqAjAslZYODuC9WkjVHkgCV5gTLhOO0usd8ueCVW/XjDc3iQAKHnWTuGABd4gX1Lq225ITKTIZMNgXYsrJsOG3zt2GGFIPpR30gbZW/ekw16mKHqiTX5bVUTSHz5VVa0VNOzJu5/Cel08wV9/N1EI0jFCXq37Jyz6GZFLoMQzuqnJ9oqFS3PmniZl49nqmVxm6Owmac9aGWcHoF9lt/NG7uqvUkAZWKVwM6tlpOixDyYcZ2FrRz2UVxlW245eBmzsrTcz89siqYdQT7JFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXR6LK56Bf706cQmMW1T3dKjpPnO03ylAGZZcxypsL8=;
 b=dKyZwlzUbMfPqxLvtiuA/imN3ktN3n/Zj/CN0hTfxo/2DL0YG3ej5OlRokcvqLX6wntOa92lR3Gq3Gew30MVJfFGM47G6YqR136h9GT1K3RQody+vQ3pD+6FINOtVq02r5XdboG6uuFeBTTOPMZSp5eSz/t5CFWHnrvLxgMDTJrvh1JhTY9rvnet8vqExBlblS/ovTHjh9CVKceyTz9Tf9uOq1lu1A9T6lmjrlbhvE+ZbkBOhuCQFzj8pATOD49bIt84HblaESRrsLks2VgkcHSFGJaLORQD46q4DzeAMbodC5p48SWHxAoEg7l14deGM1DwtCaj4vkG1YGx4hYyNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXR6LK56Bf706cQmMW1T3dKjpPnO03ylAGZZcxypsL8=;
 b=BL1LvazB/4WfEf9sBYSAleN7h/XE05EYdXVwBy5dUp5wKCofLP0pxqJc1yGNaOy9vDciDXiO7TpsBUeUBv7s0LZ6SzvJiyCg8YRf7XKev1Eke9kRQNypC4glcZzu7P3azIJBVOM7JjM/VcXjzvy+ouXQ1Ul04VMOF2xkTZILbTHuX0IcQXEKKGh6MgtRK8RdTKlf95ESBJDinepO2EMcaM8aSVjvS9UjjGbc/Mz+8Z3+oACYL/iTRuUpdZjfNED+obBOjEq7JM1cpOZ2C/56CINgRUl0L33RpYo25zgD9xe4iVqZimp7MXHBaqG0HtlnTzg7meLmO5OeXqbRZ8U+fA==
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com (2603:1096:4:1ec::12)
 by KL1PR06MB7012.apcprd06.prod.outlook.com (2603:1096:820:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Fri, 5 Jul
 2024 03:35:18 +0000
Received: from SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd]) by SI2PR06MB5385.apcprd06.prod.outlook.com
 ([fe80::967d:afda:6f4:33dd%6]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 03:35:17 +0000
From: Lege Wang <lege.wang@jaguarmicro.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "parav@nvidia.com" <parav@nvidia.com>, Leo Liu
	<leo.liu@jaguarmicro.com>, Angus Chen <angus.chen@jaguarmicro.com>
Subject: RE: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Topic: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Index: AQHay2kF67vqaBJYMUW1XCStKdNnOLHnfO0A
Date: Fri, 5 Jul 2024 03:35:17 +0000
Message-ID:
 <SI2PR06MB5385346C86CF45806EC6E9F6FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
In-Reply-To: <20240701034435.675-1-lege.wang@jaguarmicro.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|KL1PR06MB7012:EE_
x-ms-office365-filtering-correlation-id: 9bffeebb-318a-4b69-9bbd-08dc9ca37d7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?/86yILC+16cARac3aKmCd0iJ+Z/jeF/MRP59yptg2/Rxo+DxUmvRxCLP?=
 =?Windows-1252?Q?cc/l8QC+eZ+SpbDfw6hdtlEapDBs5W7jKhgkTLy3AZH5SWrETZdU8oaQ?=
 =?Windows-1252?Q?Q2Jqp0LSg9qOeXfaV4VnSSp33H9KmLyFdebts9vqwBlGzWhaUoUJJOWs?=
 =?Windows-1252?Q?eE6I5Pv9T81pm16CJkHid0sJo9KTizgxl6ODRq/2MPwOEFv7zNlDLJvi?=
 =?Windows-1252?Q?oeS9P5cFrkeB7+sFriq3Je+jHe+QU5B2OCq1FKVKCp4YuZeP1QyywVLk?=
 =?Windows-1252?Q?vrEENYQYmvtXUjM+5/ioM9BDAWl+Kr7AzU6JddAGM+mVnpMyZX3sT4mx?=
 =?Windows-1252?Q?XFbCYRO70pLxRVNMb54OcJl4QSF8syW1yqIyqoyzKl0VUKas36vF7pU5?=
 =?Windows-1252?Q?b1pTRRXeH3aeysqN9eS08gq/F3Rn3JZyD6NMmqkaf/V8S47SiHvwyEYD?=
 =?Windows-1252?Q?HhvyiIK9z7tgCp9YkvnTHgQG6J6EcDiSmiU+hORDUvLLj0dBNypW+TQn?=
 =?Windows-1252?Q?Hs5gH3q4Cp2uxMm85qpnuiQ0uH16pyNy1oLr535rOJKa8SRb4y01kMgO?=
 =?Windows-1252?Q?lRRhh2g7MrD4UCJL+ibo4DDUuA+M5MljoM2xMm4hZOqH66ASdzprJYD3?=
 =?Windows-1252?Q?6Ncom5KBofs2zdyli0H68w9A1186CdJ0DS9UwkJJxZzS12dsmZK+T/in?=
 =?Windows-1252?Q?a4sAgP1CzqkVALcwECBRZTHFOAcKApsXB6Jf862AF6DQTO28HuDS3eEi?=
 =?Windows-1252?Q?fPXfQicbzFfZAnP62LiY9XZnwlh2gezAG4HiyGKx3vt19YyGBvpI1eOJ?=
 =?Windows-1252?Q?a9TRBeYKBp7DmB+s0K1NGL2S9XImrNaSe2aKF9S3zexVdAT2bbnYh/fL?=
 =?Windows-1252?Q?g49btKs04NWF/cq+/KljOEv7vsxLy8NXb6SpRlJbKcAB5euz2O8ILEqd?=
 =?Windows-1252?Q?Ghcjc3PbVGw7yT4Y4aosnvNv69BQrNNGrCva79LqWx8oO44Dh/lyeOSj?=
 =?Windows-1252?Q?KZOSTdbcoZwDSy0kmJhYcGqa7mDxIr8sB8MywUoxdnUK2qRldepXkNbN?=
 =?Windows-1252?Q?JqA4awDpHO8PvPT1WQmkfzjYjKK2fOx4xrN5dzFcT4xaRv/nukAevA13?=
 =?Windows-1252?Q?WivgLqaWYcezqocW4GL4emELvrVPlfJ0DYHyyJb/bi8cnw3L6WJXki3B?=
 =?Windows-1252?Q?6jdiJObLxqy/RmW1Ctk/e8smRI23+io1GtvRsWvJFt6oLksUzIwfFd8R?=
 =?Windows-1252?Q?VzWnEOwa88BhcrUCFv9dXBI3CLhxxb8qPFXZXSouHkO2OEsQj5llgHlt?=
 =?Windows-1252?Q?UBESNrpl/29R8Qf28WzPMl3iFkFG4BSPJP+6hcCyI/K1Jt6gA+LGZFC0?=
 =?Windows-1252?Q?GHU5uXPVXqmzrxMkxDR2d6tJCuw5ltMmEu3UnqjlVKO5BFmIVXMqKl17?=
 =?Windows-1252?Q?EIX+F1XMGlPdoh2Eq2FFmqGi3vK4+3be60A7+F8aw8V6XD1WSq9ff8RI?=
 =?Windows-1252?Q?sHevZHGvtyyoFxRW7NDLkar0eCnmjg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?wiF1El20FQJG6NJeCgSStfWRiKvWlzYcKI4c2qhgcS3QwfE347A7mVk/?=
 =?Windows-1252?Q?tZd2hplyQdQxqQQNNXGcFGoLm/uXaOmSYGxJEzBhg7kgzp/R2ExuiBis?=
 =?Windows-1252?Q?pWCRjQtWVuv//5Oll1L4eP300N7knIRolhRWUbjpBnPs7/Wi3IbiXoX1?=
 =?Windows-1252?Q?JoIMNB1l7snZEJ2nD+c2QL/JARQuCIviB83jvxlqyBb3/cZkLKVQ32LM?=
 =?Windows-1252?Q?VEPEVFTNiGYU+905jdlt6C75c6igteCvDe/8SGsDQQM0IhbSoZz1et/J?=
 =?Windows-1252?Q?B+O6BTYNYpmsoOlEuy3OG8HCE6TG7xhqB9IA9CarMDGl7QfSDbNKFfX7?=
 =?Windows-1252?Q?ILFbtccI798O9vBgksA8dKYVJP+v3EbhTS82VqbeTarwpyorvCIGqOl3?=
 =?Windows-1252?Q?smBIpYZU5pNSTS1oP1iU6B47Dm59IwRPut+3sM91MHcmipHVzK1E8YBl?=
 =?Windows-1252?Q?hZWWCfVyVip1TfzHOyj4LfqGeMF0m0IohstD/sJRhupIUeH7ik2Ukawe?=
 =?Windows-1252?Q?6Ih3sda7qf7pPzcpWq9GcI/mGCz6sDaDpLe6+DHGjHoOO+TS1jLW4TNo?=
 =?Windows-1252?Q?qKv8zRlaq6Z22jDlYXkD40ZfM+cSCJzXD02Qym7rm4lj76gw48lXcath?=
 =?Windows-1252?Q?pOPpEX8dpQZxq+00otxEUHQloHauopnbKWLFE9kN0xXy3D7DvzeEWWDp?=
 =?Windows-1252?Q?m4AQQ2MvycasUmrau25mWfQylwC7khfTgX85eibgzw3wGbycsGc5Xx0V?=
 =?Windows-1252?Q?kYdUAmi4VKoI+PHkslgmhMbnsXLXM39It3XM1vIVK/BP4AHxj2v4Dlao?=
 =?Windows-1252?Q?c9lnH2SnPzAFYOVBAgxKFSBLlc2YWDo7w5TI+XnllwIzgd7l4xGcmK8h?=
 =?Windows-1252?Q?qezqYNPdNgvqQXQIMkxUevO1JO6mr95KzeV2TgWCU9m9xiYrBGD2roq4?=
 =?Windows-1252?Q?RCNBrKncYgg7puZTyU1Afqk3VQXCNWxUwbufxT+S5VIhTI5fQPIOFDd+?=
 =?Windows-1252?Q?oscCTkNbfnWZ2d9LlI8pNlmliJ++eXUUbZcItTxX9gkqkOWPCw3NwftI?=
 =?Windows-1252?Q?aND3UQiPeXZO02OPgMcmyZpjt7HCk8e8oCn4Nqtvf1JKHrM6LTtVS3xg?=
 =?Windows-1252?Q?yq2Um5Pg9p9TvrkLsgMswyUyAjzESxWoqVKslNZTcb9bOnq5IY2W7EyB?=
 =?Windows-1252?Q?Acrh08oR8rkllKzsXat1Cyw/nC19e9Ur19TFWBeWI8FxqyL/dYsCQ90i?=
 =?Windows-1252?Q?qU7rf0vkjJeTtw7JrvqgOQF9TnJVkIHWo+7gnwxUWfutUvkgCUvQ9Q3T?=
 =?Windows-1252?Q?mzOECCA3VHDUSellItG70/hArFE42Ab2UDDfm0fTu6gt0KG6xIAGpqVN?=
 =?Windows-1252?Q?TrRBGISJQ9z7MF6xAuGkCiArqQJIcnIrjLDDuaLSsBzYoKl3hMBc+gJW?=
 =?Windows-1252?Q?JZy3OEIi8Wa1y919sq2KkPfvid0e82hD5NDSmtWRVmW2SGN7OGzMOUsN?=
 =?Windows-1252?Q?XbpDL1MCZq3cIkB3JLp1jJ0OZWWUpWBZad1NScfsAiKApFFhIcZh/kHG?=
 =?Windows-1252?Q?kX8XsteGufE5d/fo1rsqT+jIzUJwKMciROo7golMQJjaAkPDc/eo9h+4?=
 =?Windows-1252?Q?2VHkaFlqvotirzR5hDouv2sguvxpefn/vdwv7tOuLdPD2Lb2unH2Yi5f?=
 =?Windows-1252?Q?Ejt1QgUcpanOS1bF7tePmZvBa7uHxSs/?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bffeebb-318a-4b69-9bbd-08dc9ca37d7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2024 03:35:17.8366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ovzTKXG7yqIx3Awd+zfv46RPljrul+2XuLpzyda/aQZM1fuEbvavLc71IVI0Dt1ebRSAY0aklpSXTH5IyaxEcz5FbeGJvW7s4dLXn4rPQMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7012

hi

Thanks for your comments in previous discussions.
I'd like to confirm that do you understand this proposal's idea now. If yes=
,
I may start to prepare a more formal V2.

Regards,
Xiaoguang Wang

> -----Original Message-----
> From: Lege Wang <lege.wang@jaguarmicro.com>
> Sent: Monday, July 1, 2024 11:45 AM
> To: virtio-comment@lists.linux.dev
> Cc: vattunuru@marvell.com; ndabilpuram@marvell.com; parav@nvidia.com;
> mst@redhat.com; Leo Liu <leo.liu@jaguarmicro.com>; Angus Chen
> <angus.chen@jaguarmicro.com>; Lege Wang <lege.wang@jaguarmicro.com>
> Subject: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
> notification suppression mechanism
>=20
> Currently for the PCI transport, used buffer notification suppression
> informations are located in guest memory, for example, pvirtq_event_suppr=
ess
> for packed ring and virtq_avail for split ring, then PCI devices simulate=
d
> by hypervisors, such as QEMU, can vist these suppression informations
> directly before issuing used event, the only overheads may be just proper
> memory barriers, but for some hardware PCI devices offered by
> DPU(Data Processing Unit), DPU would need to submit DMAs to copy guest
> suppression informations to DPU internal memory, then check whether
> used event should be notified by examing this internal memory, which
> is obvious expensive, and this DMA operation is needed every time
> DPU attempts to issue used event, DPU may also choose to add a hardware
> component to polling suppression informations by submit DMAs continuously
> to get newest used event suppression infos, but it's also expensive.
>=20
> To help improve this sitiuations, add a new feature:
> VIRTIO_F_USED_EVENT_AUTO_DISABLE. When this feature bit is negotiated,
> devices will place new notification area for used buffer suppression
> notification in PCI bar specfied by virtio_pci_notify_cap, also for bette=
r
> used buffer notification coalescing, the device will disable later used
> buffer notifications automatically after sending one used buffer notifica=
tion
> to driver, and after the driver finishes handling current used buffer eve=
nt,
> it needs to notify the device to enable used buffer notification again by
> writing above new notification area in PCI bar. Device will receive
> this notification reliably, and device knows that it can issue used event
> now, but it may choose appropriate timing to send used events according t=
o
> its notification coalescing policy , now it also does not need to DMA gue=
st
> memory to obtain notification suppression.
>=20
> Signed-off-by: Xiaoguang Wang <lege.wang@jaguarmicro.com>
> ---
>  content.tex       | 38 ++++++++++++++++++++++++++++++++++++++
>  transport-pci.tex | 26 +++++++++++++++++++++++++-
>  2 files changed, 63 insertions(+), 1 deletion(-)
>=20
> diff --git a/content.tex b/content.tex
> index 0a62dce..84505da 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -448,6 +448,7 @@ \section{Driver Notifications} \label{sec:Basic Facil=
ities
> of a Virtio Device /
>  The driver is sometimes required to send an available buffer
>  notification to the device.
>=20
> +\subsection{Available Buffer Notifications} \label{sec:Basic Facilities =
of a
> Virtio Device / Driver notifications / Available Buffer Notifications}
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
>  this notification contains either a virtqueue index if
>  VIRTIO_F_NOTIF_CONFIG_DATA is not negotiated or device supplied
> virtqueue
> @@ -488,6 +489,35 @@ \section{Driver Notifications} \label{sec:Basic
> Facilities of a Virtio Device /
>  has been negotiated, these notifications would then have
>  identical \field{next_off} and \field{next_wrap} values.
>=20
> +\subsection{Used Buffer Event Enable Notifications} \label{sec:Basic Fac=
ilities
> of a Virtio Device / Driver notifications / Used Buffer Event Enable
> Notifications}
> +This kind of notification is only necessary when
> VIRTIO_F_USED_EVENT_AUTO_DISABLE has been negotiated.
> +When this feature bit is negotiated, the device will disable used buffer
> notification
> +automatically after sending one used buffer notification to the driver, =
and
> after the driver
> +finishes handling current used buffer event, it needs to notify the devi=
ce to
> enable used
> +buffer notification again.
> +
> +\begin{description}
> +\item [vq_index or vq_notif_config_data] Either virtqueue index or devic=
e
> +      supplied queue notification config data corresponding to a virtque=
ue.
> +\item [used_off] Offset
> +      within the ring where the latest used ring entry the driver has
> processed.
> +      Without VIRTIO_F_RING_PACKED this refers to the 14 least significa=
nt
> bits of the
> +      offset (in units of descriptor entries) within the descriptor ring=
 where
> the latest used
> +      ring entry the driver has processed. With VIRTIO_F_RING_PACKED thi=
s
> refers to the offset
> +      (in units of descriptor entries) within the descriptor ring where =
the
> latest used ring
> +      entry the driver has processed.
> +\item [used_wrap] Wrap Counter.
> +      With VIRTIO_F_RING_PACKED this is the wrap counter
> +      referring to the latest used descriptor where the driver has proce=
ssed.
> +      Without VIRTIO_F_RING_PACKED this refers to the most significant
> bit(bit 14) of the
> +      offset (in units of descriptor entries) within the descriptor ring=
 where
> the latest used ring
> +      entry the driver has processed..
> +\item [enable_notify] Whether to enable used buffer notification.
> +      The driver may benefit from just informing device the latest used =
ring
> entry
> +      it has processed, but not enabling used buffer notification. This =
field
> only
> +      occupies one bit, if set to 1, it will enable used buffer notifica=
tion,
> otherwise not.
> +\end{description}
> +
>  \input{shared-mem.tex}
>=20
>  \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Devic=
e /
> Exporting Objects}
> @@ -872,6 +902,14 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits=
} for
>  	handling features reserved for future use.
>=20
> +  \item[VIRTIO_F_USED_EVENT_AUTO_DISABLE(42)] This feature indicates
> that the device
> +  will disable used buffer notification automatically after sending one =
used
> buffer notification.
> +  Note: when VIRTIO_F_RING_PACKED has not been negotiated, the
> maximum queue
> +  size MUST NOT be greater than 16384, when VIRTIO_F_RING_PACKED has
> been negotiated,
> +  the maximum queue size MUST NOT be greater than 16383.
> +
> +  See \ref{sec:Basic Facilities of a Virtio Device / Driver notification=
s / Used
> Buffer Event Enable Notifications}
> +
>  \end{description}
>=20
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..62ba9dc 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -551,6 +551,13 @@ \subsubsection{Notification structure
> layout}\label{sec:Virtio Transport Options
>          cap.offset + queue_notify_off * notify_off_multiplier
>  \end{lstlisting}
>=20
> +If the VIRTIO_F_USED_EVENT_AUTO_DISABLE feature has been negotiated,
> \field{notify_off_multiplier} is also
> +combined with the \field{queue_notify_off} to derive the Queue Notify
> address for enabling
> +used buffer notifications within a BAR for a virtqueue, but add a 4 byte=
s
> offset:
> +\begin{lstlisting}
> +        cap.offset + queue_notify_off * notify_off_multiplier + 4
> +\end{lstlisting}
> +
>  The \field{cap.offset} and \field{notify_off_multiplier} are taken from =
the
>  notification capability structure above, and the \field{queue_notify_off=
} is
>  taken from the common configuration structure.
> @@ -563,7 +570,7 @@ \subsubsection{Notification structure
> layout}\label{sec:Virtio Transport Options
>  \devicenormative{\paragraph}{Notification capability}{Virtio Transport
> Options / Virtio Over PCI Bus / PCI Device Layout / Notification capabili=
ty}
>  The device MUST present at least one notification capability.
>=20
> -For devices not offering VIRTIO_F_NOTIFICATION_DATA:
> +For devices not offering VIRTIO_F_NOTIFICATION_DATA or
> VIRTIO_F_USED_EVENT_AUTO_DISABLE:
>=20
>  The \field{cap.offset} MUST be 2-byte aligned.
>=20
> @@ -596,6 +603,23 @@ \subsubsection{Notification structure
> layout}\label{sec:Virtio Transport Options
>  cap.length >=3D queue_notify_off * notify_off_multiplier + 4
>  \end{lstlisting}
>=20
> +For devices offering VIRTIO_F_USED_EVENT_AUTO_DISABLE:
> +
> +The device MUST either present \field{notify_off_multiplier} as a
> +number that is a power of 2 that is also a multiple 4,
> +or present \field{notify_off_multiplier} as 0.
> +
> +The \field{cap.offset} MUST be 4-byte aligned.
> +
> +The value \field{cap.length} presented by the device MUST be at least 8
> +and MUST be large enough to support queue notification offsets
> +for all supported queues in all possible configurations.
> +
> +For all queues, the value \field{cap.length} presented by the device MUS=
T
> satisfy:
> +\begin{lstlisting}
> +cap.length >=3D queue_notify_off * notify_off_multiplier + 8
> +\end{lstlisting}
> +
>  \subsubsection{ISR status capability}\label{sec:Virtio Transport Options=
 /
> Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
>=20
>  The VIRTIO_PCI_CAP_ISR_CFG capability
> --
> 2.34.1

