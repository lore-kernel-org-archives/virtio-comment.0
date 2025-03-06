Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24C62E64A
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 04:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741235361; cv=fail; b=KgkP/I/vDbWlq7KPbfedWj9opm0w8S635kRUF3NIroEjlvDLMOMONUBZvgFtVyXAouexAsPZbpSsf5Vc/WIY5scMgPKSjJB44nUYVzkQCoKFORtfE2WO0nsax8ggsHXZ5t95gBCzEuwQ8jEbpj/vY8beyl+9J9Gr2HUDxW5Xjmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741235361; c=relaxed/simple;
	bh=0N0yOyVjFpos+5tut5g2/COK1Ik2zruW/Jx9mi6orXQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V1Epu22Yea9SZ62CArb9qVsSpiB51cLoSjqMgfkRn5YGpoi8MXBkPI9NIQuCVfPj7GGjXm4CuW25mKL56tRSW26UXAoFzdbEOa6ThbLFoxT8ux0L3uZtgrqAThVBdVopOKtHXzsGSpCa8BN/nt8s5gh1+doReDbzpMYv3NBYo1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YPXiFXRW; arc=fail smtp.client-ip=40.107.243.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YPXiFXRW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAyXACD7E3C1wCr/a8GYmSuNYW0TGTwifnWktp/aLcmvG97afp6+y/sqGZQ9FvWuo/nes/YqBdTaXhdRU4VCiFN0X4AXgnQ/sJjiPx1nQ6XZs8sjMesTBL6LFxB4kAfZJN/W367fEdYFMD+cV6Y4GN02UkXY3qQ0odgzBNyVku4+URPQ/wQG1AIpweVGWhhon8QK5WcYhdq8xphdUD4fDqFSCMWP3QZmZIEgF9xcc2NbL8dCZGTfQbgIHTHqoVrApBn9r9pTKfXCXKZpeZDqpIoIX325NqnFOvFJZC52I2SmswDrSGTcKfy5CVEIE1oF7FlIHaFOVyHlBNMVuOZwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQINyeZwTSPobrIY4AI/Z4sZikK4TxUzjXTzobETAdg=;
 b=bF6r4gxX9eNJ0SumCT3F+///c/HqgOSFIlztpVFkXlr1dlOocb8hm/a3n7wmuh3i/nAtO5mtMwYUXpoLIzFwxrLPJ5CW3TkqPokqCNXnC4sGKWHpC6nIomr5XC8s5egS7nvEMLjalgWHCr2XtVmlKIvuaYfva26xGGN1K5+ERpxNA9O0vF7C/yWNrFUO/qa1MyYr465D6eLTzLbXrHCM05D3LiAKi91U874a9hunDwe+Ej5vIKWdOW6WVlLVvZ9oo/wHRKht/kES6rUDn7QDUd6Eb1bwhpMr3o2DbLNuCcX+iyaEKy+BAKs0jwI+nRA3ApTDqRByI50rP0Iq08wiEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQINyeZwTSPobrIY4AI/Z4sZikK4TxUzjXTzobETAdg=;
 b=YPXiFXRWRLRsjyNGKE3O0uCqFOiHMOO8jD8FCGnEEQnQga/lP6AbyuPsEBhip+oFDo8AWu5WnAB8qkcbDSdL7SAovWrQb5cSivLBIRneuFdnydE/4ld8pWEF0WxAqtX/DD36R/TmcXLBAxmrInJbaTyvvId7rYcV/hYUIxO2k338lofWk9YDAPXrf8ucYHWn82WSg+AV2URg4kwGEO1XVh48XUAgqftP0IYCY9P6AckURaIr2TUinuTgtbGyewOxF1g8hoC9W09V3faHtme4qclPYWGwGPHuICmAPcWb6hCT4JYS7VKz5eUXawPdwRl2oFyAsBzuJD+iwW/xG/Uy3w==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH8PR12MB6986.namprd12.prod.outlook.com (2603:10b6:510:1bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 04:29:16 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8511.015; Thu, 6 Mar 2025
 04:29:16 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Zhang, Julia" <Julia.Zhang@amd.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "Michael S . Tsirkin" <mst@redhat.com>, "Chen, Jiqian"
	<Jiqian.Chen@amd.com>, "Zhu, Lingshan" <Lingshan.Zhu@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: RE: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Thread-Topic: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Thread-Index: AQHbiDDvdx0hNqTsk0elfmK82iBGrrNZZ+iQgAr+CgCAASisMA==
Date: Thu, 6 Mar 2025 04:29:16 +0000
Message-ID:
 <CY8PR12MB7195EBEA5FBA0B13536B0289DCCA2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250226092753.1082042-1-julia.zhang@amd.com>
 <CY8PR12MB71955656F340C5EAC2F1C925DCC22@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB65328A537B37ED3A091A8407F2CB2@IA1PR12MB6532.namprd12.prod.outlook.com>
In-Reply-To:
 <IA1PR12MB65328A537B37ED3A091A8407F2CB2@IA1PR12MB6532.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH8PR12MB6986:EE_
x-ms-office365-filtering-correlation-id: 5650e317-c288-4467-2e3c-08dd5c6774b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?+U+IJcXgt1DtTKqHqyWD/i74l4rmADOWxl49NIUFU0Cl2tWYDoAp7+0OUUDW?=
 =?us-ascii?Q?bluhsCDs7PxYJVbsx65cLLVGJ65GkKqSd3GbNPzMy3o7WMqJPa5ZgCqon7qO?=
 =?us-ascii?Q?iiyp9nSRSVw0IFYgp80qJdSUYqAW+x4SL4dNWMRsnDYIrikQ92K8DAR6Ak5a?=
 =?us-ascii?Q?8ng/wDJOeT0ydk9oIhf8t9qXAkkn1P//4WIUsLv5yWDHFspEt3Yj4IVaIhFW?=
 =?us-ascii?Q?rWs1F3LJXFWjuNewKPTLc+dM2a6+GGEMvLDbqx1dgsoJQYyKFikP25hEIXSM?=
 =?us-ascii?Q?hoZ7gwiD0IW9GhziKSTxeKH93Mn074HIxF2mmbmbLwYT8oWvUSc/9FjuvXO2?=
 =?us-ascii?Q?R7Z70t0QdPfKu171M85IJSLNIogCaTlWtZjzyZKwAx8iMeS3eHr8N+EXvuMZ?=
 =?us-ascii?Q?DJDf02l4bSPhNO9nCIzNOn1t1NIl0aYlt5T7ZBsOrpkKBP363h8Mr/qn35Xe?=
 =?us-ascii?Q?NAp/WIq1u6yM2ES8apsKHrQbsrwKK8h3DboKLLUlSCP08IA5ynWy5NnTCEr3?=
 =?us-ascii?Q?Oyeea3XRyjoWFAEKGXTgS51VYwjLPphdLh6GDozcmwmvngOCdAjoYr2lrZOt?=
 =?us-ascii?Q?xNJUeIhQtrQnqZnpC/jAebM9lGvUC80o1PK2xwwScORGU/NthqPR5xy02NXN?=
 =?us-ascii?Q?9+FDR4yxCLsK34KWZmxUvjHfPVwXNzzn3+HUQrRX1rGead62Jwv0/J0KnEmZ?=
 =?us-ascii?Q?np+Zj+/osqmLFXvnreZ0d1kR0J1FD6f4iFYJp5nd2eUhE4a3jehGGulIoAHD?=
 =?us-ascii?Q?xur8Jvz3YW+cKGRH1SIicrdzlJLDzARznyjuaeRkQCDUQoe9sivP+b2IwkHx?=
 =?us-ascii?Q?DBovuLutKCAVDvlf5y54wH5lE+kuIRc9/PMdrAiKMubTp0PfSjOQU6Xuomue?=
 =?us-ascii?Q?D8d41tXJFq6zDNtxUiQwZicsFUnK6Bry1EXxjesGawQMOZaQTm5Qy8uFg7s0?=
 =?us-ascii?Q?nt/eEeCgG8TXpPf5ccKBiMxqULbGlJyvv00ChC6IwT2288x9OJY7XPvDdD1G?=
 =?us-ascii?Q?NAir+4exHqbRXwaY1qPt+rld1TasoIauyKsML/L8wXS65ccdbT/wBlrBfGh4?=
 =?us-ascii?Q?c7u7li7WSUKOgVs9uZnJwwHgRTnwvns2bsygJuLd5A3jaNFNhoB/zU0T9+zg?=
 =?us-ascii?Q?c87eDoeOJa/rxe3Zp8LPzjZgDHC4hWRLaH4/8T4n8ZcomXUE7ggRjrjmOKyp?=
 =?us-ascii?Q?qKccRfx0HgJb6s6IECsceal5n8eAQINRgKlx1NgOiQTTkxVxjZoz9ELnDA/h?=
 =?us-ascii?Q?uZuJg/V+97jQK7y1jK5ok/M9+bJaXvcVE+3Hyz1MsH+YDtk8kj44bRRRYIOa?=
 =?us-ascii?Q?OfOpP42+8JoiYJoRy9JcuP/CqEBWoPawUzSzowu0kUJ2tBw/dAxaHDuWhmUT?=
 =?us-ascii?Q?9SXnetU4x0EFJn8lqWXyPude39D3Wvr+mm4+6WkrYCG9uKyReJBQlKJewq07?=
 =?us-ascii?Q?vAY2zhVmLykNXEcYdQ9W6qE4EsIaF5Ns?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5iGz+wh1twjM949i4KLO7eUJCWPRPqRoiXCIh8qQ9565vL5tLMPtmSArV/it?=
 =?us-ascii?Q?OgTKCfxQ/kEz2v8T27RjCEKFR8UMaATgvJgRgkTgB7hSg3E0asc0mjVMOGHU?=
 =?us-ascii?Q?SLxTazRwXdQ4IwRtaYp7wDyDQsvhbcRmF2L4iEeDM24p+dv5q2PdOCrwyxNM?=
 =?us-ascii?Q?k6+0tbwFIYCAYOeX3+qALhiiBEapEh0vEZPm4zjTaNp0hylh1vhbkF0vNeXs?=
 =?us-ascii?Q?L6XRqXiahJSnmdjsOxBAnhzPy6YoxLoq626xO62Xpepz+SQseawqM1hdRJy7?=
 =?us-ascii?Q?LLreGXIBsGt3vBGWDwefMsH3rpLsIls6KGbGWa1B4qh8nIw5d62GvNUavAGm?=
 =?us-ascii?Q?OadeCPO7l6WqxZRUeZME/WeqEnQc6z6UjXUWQlKUUNiGtEPM3YCoaAJOLqBD?=
 =?us-ascii?Q?4JAP+XUdaZ7YaTP4sTLq43CO8KkNEuW9VqBGKdEFzOpgn8p82to5omSXF77v?=
 =?us-ascii?Q?DNj9hv0FYbRZqu1qGIixiuldxtsyi2NgatlatlG0wSmQ22F/S1+ruLJMGPqX?=
 =?us-ascii?Q?MsqsBNAUTVUBORGOpfu8aQmpTfSesGJUdZkbbOtDZQMRXtAly+s9js3B6Orv?=
 =?us-ascii?Q?zjYeVXwvdNuleKhhBJDpM7oZ3kvYZOhBdpRE4Cxo9bsWECTPSgn16Y885ehz?=
 =?us-ascii?Q?AkJA5u0WmktbZrfRE4WZ8Ah2v5MWO7vP8lVF9t4r0tPm058maD0C0lVBlQ03?=
 =?us-ascii?Q?AMlTkLB9e02msa3agOfXIR3Ak1PeyZ75ZuCkphiDLa1wIj+oXlXK2VJxls+L?=
 =?us-ascii?Q?aXtpvyjz2KEX29/FI+CTDVfIF6Vfmy2dxJOk5gD/yZeSGxGpqCTiIjs2Igm3?=
 =?us-ascii?Q?vWvjmioIQSqKY7KmZMURud0RQLz+JMCOeE69he4fs/cNxCW8npk9El17JyJm?=
 =?us-ascii?Q?VaHFydVSPZo1DXUpooF01wa4qJbr537b8VeeDe8VuCS/1FAFdUu6VudE48VK?=
 =?us-ascii?Q?GiY2RMC5xkFAaQu0JSBADKnWprQH8cBnV6V8A8CTYEJK9JFVywwA2JkImSbq?=
 =?us-ascii?Q?4ZBnYldjskurflEhTjf6044RD0gpwVnivRxz0PogzS3j2G8TIi9i+q2zicqa?=
 =?us-ascii?Q?Z3xBCZ+S/NckyGsqbSiYxlkrtlmWiwFvQ/D8u8rJB65ot0MrEUJKOd6a/HVY?=
 =?us-ascii?Q?X0RSlBj81yCFyuT9i+vgeDxwn4UjH4BdBmIB2K5ERiahfAAxdlIdV2XQOK+Q?=
 =?us-ascii?Q?auHE1b4ckYWOfFSfoFHANkeExoB58n1r7nPWq04hM0fMnHq4pnYY3N1TtzDH?=
 =?us-ascii?Q?vL0eqaNzaKErGuQLYoo7OWyc2fHSNmbJzmEVBlezDk6+UuvyEzPsV+IMrKEz?=
 =?us-ascii?Q?8cGv1PihLsQFvaqJN0n+TI9L36G04BDqz0r4eNu2K1TUwF8HY9dU9c14SYEf?=
 =?us-ascii?Q?nlBTbI4S4TW8uhcpK3GF+CZzVw3Wj0Z5GqrE2tcb2wxnwdIIcwS5lAccNBG5?=
 =?us-ascii?Q?siUNtH9vwYIj4AzashGF+UKTaO72OhddDA4cdgxQ8zgOHxU04XMHqW+cYWXu?=
 =?us-ascii?Q?tVVUzO3FTyHY650la56qro8EAYQSUfCBTB+4+Ex2ebl7CrBShIF7Uu8789EL?=
 =?us-ascii?Q?4M5c8vnreCOrVDu2J3Mwofbrw7rYbmkCUuOrLDDRc9nC5JKSXrx/K6er6t4u?=
 =?us-ascii?Q?C93Hoq7IHbk/b6BCBFIBTQY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5650e317-c288-4467-2e3c-08dd5c6774b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 04:29:16.4953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5hTJgzFovRx/wo8/Sm2GlNKo10cyThKu0Z9/tJwylSNq7BEzJj5RlaiX5/ddfeg5+KSe/YPM3nSRTmF793DmqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6986

> From: Zhang, Julia <Julia.Zhang@amd.com>
> Sent: Wednesday, March 5, 2025 4:12 PM
>=20
> On 2025/2/26 18:51, Parav Pandit wrote:
> >
> >> From: Julia Zhang <julia.zhang@amd.com>
> >> Sent: Wednesday, February 26, 2025 2:58 PM
> >> To: virtio-comment@lists.linux.dev
> >> Cc: Michael S . Tsirkin <mst@redhat.com>; Chen Jiqian
> >> <Jiqian.Chen@amd.com>; Zhu Lingshan <lingshan.zhu@amd.com>; Huang
> Rui
> >> <ray.huang@amd.com>; Julia Zhang <julia.zhang@amd.com>; Matias
> >> Ezequiel Vara Larsen <mvaralar@redhat.com>
> >> Subject: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
> >>
> >> PCI peer-to-peer DMA transaction may be used in guest for some scenes.
> >> For example, dGPU prime feature will let virtio-iGPU access to
> >> passthrough dGPU buffer.
Virtio specification does not describe dGPU and iGPU.
So either describe it in the description or please drop that and explain th=
e motivation without referring to those terms.

> >>
> >> To support P2P DMA transaction in guest, virtio-gpu needs to check
> >> the compatibility which is represented by p2pdma_distance. This
> >> defines a command VIRTIO_GPU_CMD_P2PDMA_DISTANCE to allow guest
> send
> >> virtual pci notation of two devices to host and get host physical
> >> p2pdma_distance of these two PCI devices.
> >>
[..]
> >> Ifsm1M5xIb37T9Tg%3D&reserved=3D0
> >> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> >> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> >> ---
> >> Hi all,
> >>
> >> We are trying to implement dGPU prime feature in guest which will let
> >> virtio- iGPU read rendered data of passthrough dGPU. Before that,
> >> virtio gpu driver needs to get p2pdma_distance to check if P2P DMA
> >> transaction is possible or not.
> >>
> >> To implement getting p2pdma_distance, QEMU needs to handle the
> >> command from guest with virtual pci notations of two PCI devices and
> >> send it to host kernel and return host physical distance back to guest=
.
> >>
> >> So this defines the new command follow the suggestion in https:
> >> //lore.kernel.org/all/20241207105537.542441-4-julia.zhang@amd.com/
> >>
> >> changes from v1:
> >>   - add issue link to commit msg
> >>
> >> Regards,
> >> Julia
> >> ---
> >>   device-types/gpu/description.tex | 29
> +++++++++++++++++++++++++++++
> >>   1 file changed, 29 insertions(+)
> >>
> >> diff --git a/device-types/gpu/description.tex b/device-
> >> types/gpu/description.tex index 4435248..9d0f30b 100644
> >> --- a/device-types/gpu/description.tex
> >> +++ b/device-types/gpu/description.tex
> >> @@ -223,6 +223,7 @@ \subsubsection{Device Operation: Request
> >> header}\label{sec:Device Types / GPU De
> >>           VIRTIO_GPU_CMD_SUBMIT_3D,
> >>           VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
> >>           VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
> >> +        VIRTIO_GPU_CMD_P2PDMA_DISTANCE,
> >>
> >>           /* cursor commands */
> >>           VIRTIO_GPU_CMD_UPDATE_CURSOR =3D 0x0300, @@ -236,6 +237,7
> @@
> >> \subsubsection{Device Operation: Request header}\label{sec:Device
> >> Types / GPU De
> >>           VIRTIO_GPU_RESP_OK_EDID,
> >>           VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
> >>           VIRTIO_GPU_RESP_OK_MAP_INFO,
> >> +        VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE,
> >>
> >>           /* error responses */
> >>           VIRTIO_GPU_RESP_ERR_UNSPEC =3D 0x1200, @@ -791,6 +793,33 @@
> >> \subsubsection{Device Operation: controlq (3d)}\label{sec:Device
> >> Types / GPU Dev  };  \end{lstlisting}
> >>
> >> +\item[VIRTIO_GPU_CMD_P2PDMA_DISTANCE] calculates the cumulative
> >> +distance
> >> +  between two devices before Peer-to-Peer(P2P) transaction. Request
> >> +data
> >> +  is \field{struct virtio_gpu_device_p2pdma_distance}. Response type
> >> +is
> >> +  VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE. Response data is
> >> +  \field{virtio_gpu_resp_distance}.
> >> +
> >> +\begin{lstlisting}
> >> +struct virtio_gpu_device_p2pdma_distance {
> >> +        struct virtio_gpu_ctrl_hdr hdr;
> >> +        le32 provider_bus;
> >> +        le32 provider_slot;
> >> +        le32 provider_func;
> >> +        le32 client_bus;
> >> +        le32 client_slot;
> >> +        le32 client_func;
> >> +};
The requester device's PCI RID is anyway known to the responder. So no need=
 to pass it here.
It is unclear if its provider or the client.

You only need to supply the other device RID.
In PCI spec the RID is 16-bit. Considering other advancements, RID of 32-bi=
t would be ok too.

So please remove client_*.
Replace provider_X with le32 other_device_pci_RID.

Mention that other_device_RID follows PCI specification RID notation.

> >> +
> > I assume above bdf information is what is visible to the guest?
> > Why cannot it see this distance in the guest VM itself?
>=20
> Guest can see virtual bdf information which is not the real bdf informati=
on of
> the host. So guest can't get the correct distance. That's why I need to
> implement a new command to get and pass the real distance.
>=20
[..]

>=20
> >
> >> +struct virtio_gpu_resp_distance {
> >> +        struct virtio_gpu_ctrl_hdr hdr;
> >> +        le32 distance;
> >> +}
> >> +\end{lstlisting}
> > I am not gpu expert so didn't pay attention to details.
> > I believe you are missing basic information in the patch is what is the=
 unit of
> distance?
> > Can you please add?
>=20
> The definition of distance is explained in kernel file:  driver/pci/p2pdm=
a.c:
>
Description is good. Either it needs to be in the include/Linux/uapi/foo.h =
file and refer to it here.
Or please add the description as part of this patch.
Reference to kernel internal files can change and hence cannot be taken as =
reference for virtio net spec.
=20
> /*
>  * Calculate the P2PDMA mapping type and distance between two PCI
> devices.
>  *
>  * If the two devices are the same PCI function, return
>  * PCI_P2PDMA_MAP_BUS_ADDR and a distance of 0.
>  *
>  * If they are two functions of the same device, return
>  * PCI_P2PDMA_MAP_BUS_ADDR and a distance of 2 (one hop up to the
> bridge,
>  * then one hop back down to another function of the same device).
>  *
>  * In the case where two devices are connected to the same PCIe switch,
>  * return a distance of 4. This corresponds to the following PCI tree:
>  *
>  *     -+  Root Port
>  *      \+ Switch Upstream Port
>  *       +-+ Switch Downstream Port 0
>  *       + \- Device A
>  *       \-+ Switch Downstream Port 1
>  *         \- Device B
>  *
>  * The distance is 4 because we traverse from Device A to Downstream Port=
 0
>  * to the common Switch Upstream Port, back down to Downstream Port 1
> and
>  * then to Device B. The mapping type returned depends on the ACS
>  * redirection setting of the ports along the path.
>  *
>  * If ACS redirect is set on any port in the path, traffic between the
>  * devices will go through the host bridge, so return
>  * PCI_P2PDMA_MAP_THRU_HOST_BRIDGE; otherwise return
>  * PCI_P2PDMA_MAP_BUS_ADDR.
>  *
>  * Any two devices that have a data path that goes through the host bridg=
e
>  * will consult a whitelist. If the host bridge is in the whitelist, retu=
rn
>  * PCI_P2PDMA_MAP_THRU_HOST_BRIDGE with the distance set to the
> number of
>  * ports per above. If the device is not in the whitelist, return
>  * PCI_P2PDMA_MAP_NOT_SUPPORTED.
>  */
>=20
> I didn't change the unit, do you mean that I should add above information=
 to
> this patch?
>=20
Yes. please see above.

> Regards,
> Julia
>=20
> >
> > Can you please wait for few days to raise the vote and sort out this de=
tail?
> >
> >> +
> >> +The request data contains guest virtual pci notations of p2pdma
> >> +provider and client. The response contains the distance between
> >> +provider and client, which represents the compatibility of these two
> >> +PCI
> >> devices.
> >> +
> >>   \end{description}
> >>
> >>   \subsubsection{Device Operation: cursorq}\label{sec:Device Types /
> >> GPU Device / Device Operation / Device Operation: cursorq}
> >> --
> >> 2.34.1
> >>
> >
