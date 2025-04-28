Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096491D61B7
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824044; cv=fail; b=JbYfWKzLs3+McjQR876JoajL3gQGzQ90mky/4Vx15WjftUQoJzKy0cF2i8E/w9mwEPx9Xn7P1qWvlQu4Z+ymerg1Z5LDlJz3EsvzfJbXdHhsxLfO4rCFUnZR71XtVXxxuMz2qBFX8/9myQFpYYECF52rlO22ZPWfBnFdmVNsY4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824044; c=relaxed/simple;
	bh=LxUa+Ryzc2NurG1BhnsSBS0ITXblYYQ1vrbBZhd3KCI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VEGRh/7yUe/Zg7WRu+xLpTPVC4A+NYi3onrQdz1Qz9/vqub73Gnnltf4hEBdDvqJ+UkHMVoeR7VtVhXxRsTH1jWvEiUn3djBil6QdwSWk8PYQqHhNP59iRcesboQlssiHVAkgI7Ez9bOdmn0gzSHN445VyM5cWbpQmjBW2rCKnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IPAfwf1d; arc=fail smtp.client-ip=40.107.220.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IPAfwf1d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHmKgenVCKcvI/yLtvjwqEikUBt6v07lMa744Cx0DKbRHJND564xPfQt2U3VZjciH/9OZuKzy3HcjXWIk+nBw1rPXCBFVV3syKIYtXGd2lr4crKqJ6VQsU/mvAeXdaI6ZWRGgMALj3oEeEaGrYW5RXhIQX5XhIyeoOriiTlFEXSxLFqVKsKdRKyLY8r5YhRFQzA/7q43TA9FSxc4JDXx4eqaCMvvj5nZmU66VkNPJpXPbfT3ETMnlPUn30Y7ZKJn8BePnkLvS9iXhlN9LIJ47WC67sLnItUzbT69RR+2t6td/49Z+NnHrb1KbISgc9+SXcFbBoMk38ooL+0HPA0ADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hwlcpj+VVZZEQi/gXeR+2IX5anFhy8r4nkYIlo2vpgQ=;
 b=EW+/kDjQiD0zEhug2UqeqQlfEw+2qxW4uWq59yyoSnrorxrQgOOIO0T1gYF2Bga7V9e2DgI/T/fg8uUbYfln7VyAbNaZleqZzDWb3AtIvi23b79FHnnLFdNMyzUfdBb5Ih3+QFFD/COj398hj5b8UAkvEqV75+RfHRoucXstKMwYeevC2MDM7MN2z+2e0AJitf6D5cBul1sZLPRO+KyoiwI4vAb079soiY3G+YNoiHlpjA+2kcfNkI9Q9vN6ozELuCkW7pSoCB+RX2Ag20JlnoMJd1Z6HQ2GSpyLE5c6YKbNEP25Owuvpb8sozG9rjNcCe7VM9OijE6SjTFV+wcIfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hwlcpj+VVZZEQi/gXeR+2IX5anFhy8r4nkYIlo2vpgQ=;
 b=IPAfwf1dB12bpzv/Zs/b0niJqGJjt0/x+h81/KHoOCz/zF0a+h20CtUdUtPM+WxKAxbmQFs+S7lPJ05c7bAC0yCWg2el6i0uKqQFFS3vqBsJ8kaO1OZax8t/y49wIRmcHe+DsACb/z0hOvvA+2MKKy+TKdO5iJzzVQvm3f+qNco4VE405dhU8Qho6S3W5daWckCAYa6vh5P+jq7xbF2IcgwhDMvLQAR+H9LomRye8PFExVNl1+AXg9CsgNyVhoS0I1SdvclqRXg4T3sCjlsFzjc3+ZYjbtUh/7jg10+vfoXrMXA9gldCKtnj9B2TXKL4XLAgwNETAYJIa5C7Hhfwlg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 07:07:19 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:07:18 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH RFC v5 1/4] virtio-net: Add IPsec operation, capabilities
 and resource objects
Thread-Topic: [PATCH RFC v5 1/4] virtio-net: Add IPsec operation, capabilities
 and resource objects
Thread-Index: AQHbtP1kZUr8mXO2SUiU+BotCOKIZ7O4qFIQ
Date: Mon, 28 Apr 2025 07:07:18 +0000
Message-ID:
 <CY8PR12MB71954DA6447F2560B4AA36D7DC812@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250424094332.1927688-1-schalla@marvell.com>
 <20250424094332.1927688-2-schalla@marvell.com>
In-Reply-To: <20250424094332.1927688-2-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB8370:EE_
x-ms-office365-filtering-correlation-id: 1b7edbf2-e49f-4dac-a579-08dd86235080
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/C9GYs3d1o07jZDetDxPoLSXolfQnUQCUgTSlR+wdvJIozACSz45wi+Mxib9?=
 =?us-ascii?Q?lIaIQ2/HUvj2s0YLpCzYkol6VtY0gD70ISYBGfFPGhkdRhUQgiRp7GpW6VCX?=
 =?us-ascii?Q?F8lH6pWzD+ZMKFYJ6HFqVDG8GOyHlYSzFjJ/DDOUMT17lyRoIjIgcd3DGrD0?=
 =?us-ascii?Q?+jRxxgdFVaSG+MDjmzrJdcqIudentcW8LWjIkMzxnkMsJ3dFyAPWxSmktiuL?=
 =?us-ascii?Q?sy6lkHv/bUIy7pMymrdiWXo9YZ2Qx0sicXGddtVH1Hm7xdzc8j7SY3Q8rkJc?=
 =?us-ascii?Q?Gs59xOMy79Xgd2We4gjMQc3zhtEe/lV17sS4ql0/Pz0424e5eE/SZP75cjOF?=
 =?us-ascii?Q?+xnDdAXiMpDeipOT/uCnPpCmqsOmFtr9nZ3mTSA8hL0Yq3JoiAFXYujHUirL?=
 =?us-ascii?Q?DdPoebY9n6J7i+2Izd6sOfT3XbFM9JSUdrdWsHrs1hnm9Q9DcmAt0WlhouSy?=
 =?us-ascii?Q?1DcYqTjujGf/qvWiismE3vEuJkEa/xPXziAmDCUNxxM9rfLEHb2BCiqIvWuM?=
 =?us-ascii?Q?Jk+vP2DeAiWx2Cmh/16nsbURalHJlSthD4bdEEHALkEhU+bJS48NKdxqi0UA?=
 =?us-ascii?Q?37zUDerY2CoJ1G7k7jS1tHdUah90yHGEkWshVV6bvqqJLj7bChmejfr+xvqo?=
 =?us-ascii?Q?6eNN6sGXzTdWyXA1SWdQYHYuRyK68kRWlaljnbJ/kZPlhkoxtMpL6fxJuB1e?=
 =?us-ascii?Q?AEAyG+eqBXRLJxSlVsdW/6DegQtS/V5f+bOHw/8mZCFJIQxULlPREFAY0jbd?=
 =?us-ascii?Q?6JdRXu+faNxAV8GZu7vvSnClvqaLalYzxpiErfMnm3fKtrEoAAgLyaoIKuoO?=
 =?us-ascii?Q?MWUOZDZloNLdsWlM6EHGnyqFsdbR6gdBvWzHfXbgXfZJ0vNpx6znFf9I+5e6?=
 =?us-ascii?Q?MTK5SeykVXx1C+1qM2sTg6dKkoRlF3cQjqzOMx2uHYoiXfJb0Fol/Mnh0i/9?=
 =?us-ascii?Q?FkqjZV0X4HCn5/dEYU16d5+MkwedYsJqcpkxAYTr8Pv+9T/lHZOqmtktK5WS?=
 =?us-ascii?Q?jX6omTkZLJ2vaG9fIfnZRMmMt5vyd6mx7oTkvh5U7yqPpVZfUrYTl6BHwVEu?=
 =?us-ascii?Q?haUsFhAVA2YexURVTQe89KGaBU1vqHVsCeXPZMPbG3dqtPIiz/Fxam7Z67Kd?=
 =?us-ascii?Q?1iyBuEW/oZa4l13D8PzFtEw4mUEppQ3Fbt2n3zIG5ydNByHgeqW7Lfm6acvf?=
 =?us-ascii?Q?8VSQrk1xkziVrWYcXzWCNyFw2T+04nlc3hFwWH4IEbeQ+4ABcxnX2avT2EAL?=
 =?us-ascii?Q?5qJ88/8ymqgS/Db0Afw6cpIHZynZlRdB53sILWMG8vD6yN9qAtoBUkFQIuHY?=
 =?us-ascii?Q?EI4QFZ+kGdunikRyCtdWqhhfG46DwFVRWuaUGd/4B/AH4o8bpu5CuMp32GJR?=
 =?us-ascii?Q?tAOiu/62p20A0mosecXao4a5jvibAe1xaCSVYnyCy1ki+yFSOQIcXcq2jKL8?=
 =?us-ascii?Q?D8ghtNUurOUkCK74huQlDYJy8GAy8MYTQj6yVeLcEfIuCvqq/XtYDw7mcfpl?=
 =?us-ascii?Q?QErrCww9LEJ1JIw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AEcKUP14Za32fZxK3eatjTDul9fn7oX+BnkP8cZzEAJ50yxCMjDtEHLzeIE6?=
 =?us-ascii?Q?IM3MR781DC8TVqFNhcbEk/f8vs0TzleZ6VLJPU+O6jR32kaKpLbmo9/nI/Jx?=
 =?us-ascii?Q?y8Wiz954nviForECw3ISaGi6HbzaRQWhIg50HLUTHSKA2hv0+nkok20d2YAF?=
 =?us-ascii?Q?gRQ5zpEsqVuWcisgVCcO0Gpts0F8D0UPHRRvOC87+vfB0vcEdOsWpsqBINm+?=
 =?us-ascii?Q?zm04PFhH0gWhCCRITcv4ZoCPhlhYzdaNCxXKzz1TcASMmBH9HPKg81l1wW9o?=
 =?us-ascii?Q?sD+1b9DIXb2vHjkQSGpNtuUmUVAw3xTX9z8c6HOzS5ZHZocebSyfVzb34f09?=
 =?us-ascii?Q?EVC0MTLR4OO7Z7ohaZxzCjgCWmsGYkH2XryXh4Yhuf9FYM1LJ54cuiaH0UqO?=
 =?us-ascii?Q?ePShW9hDBqx1fb7lMfLPFsknFQQVfL5HzQXzani7gYUM4N5BBmbjrjW2CnIH?=
 =?us-ascii?Q?RjEAsZHx6Xrjc8fqoMlvnE2oE1UQwGIMq4RpnK4IzZK+q3Kb2D3Wy5D+ccO0?=
 =?us-ascii?Q?vpTnRAiBqHQZsbOHbCYQwNHzJiGHADUHe9ppIo0mOw5A2wRV3vUh8/EOU5g6?=
 =?us-ascii?Q?3nP3Y+CpBiHacj9F8w+530j5K1BN9pa3DkPRnFPHsKhR/hfF7xauc0y+gHC+?=
 =?us-ascii?Q?Aj4rdPQFi+5OX/HMDBaGNQEmg71YBlcb3ohKcR5ba3FqqYZWhg32l983gEeE?=
 =?us-ascii?Q?NxyOE4/qzzUIyMY6KD1RBh9MKN4nJjF9ePfP7aEAytAsXSAtpX53D/O3JVDV?=
 =?us-ascii?Q?sIkZlVn24IAj3FDQhcmh5AeK147bSsVhTdaPHKe1H35F6XPsSN3J6PAtJz5K?=
 =?us-ascii?Q?39rOyAoaRx00khnzVTscKbaV+7ROKGbv6jl5jgmkLO0w0M+NhzJ17+QmGV1P?=
 =?us-ascii?Q?jHXHxpnV+g+k/IDjKFzluDtXY10TFTDB5drwsDUC6NFXVxoz8MbKK2V+vxvh?=
 =?us-ascii?Q?xLTBXDc/djLEE8g5adbVFHZ7kHm5w9A5ZUnrRvSaqGWq42dPxmXDoB7camf8?=
 =?us-ascii?Q?Jc3AALBrEvG9dwuEbGABUx5maE0PZHaf/OjMVSd5/xup3+nGpY7bg5SebNPr?=
 =?us-ascii?Q?BRetbIzZpgpEDDvMlgpbolI+7IoC7V8pp0+f01HX1F2jby2UpetzG3eW0WaS?=
 =?us-ascii?Q?uMWcGt8pden6XP71ixlHoFequs0c3xeB7MLQda3GeqBsdl+INeB0+mCDOkqy?=
 =?us-ascii?Q?N3bFHtaar3Pbu0w1WusOqfFtvDkyK17vPDLHT+W1rJ6nqWOmDL0VdpnubIVY?=
 =?us-ascii?Q?dR43ZNYuao++NGOF+7daw+hJzDT3fG3d/lqfgJHiHXHo5A3XMXiIfm2Vkwsm?=
 =?us-ascii?Q?kVYnXt7VEDRI6s7I4Jl6YepUHwcYyDlODyh/CMtU7Vr0p8n4Jd7u7n+39p+Y?=
 =?us-ascii?Q?xLw9VgQxdUg3a3wr/QtY5FgCSZSNwOOYH7jXUrR5KxwZ/MJGWVEC7IXC54Xm?=
 =?us-ascii?Q?faET6myjREC2kECrvy2EN7IDHoFlBnFHX17Ukfkj0BuTdd9GoieidVXCUVYJ?=
 =?us-ascii?Q?oUL6RpAEVvGHKdpbMD/7aRupktFV/CktyGM9YHySTZSMf/KnwMuHXcSrL8Vj?=
 =?us-ascii?Q?WoTKifWtNmJt+d8+Voo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7edbf2-e49f-4dac-a579-08dd86235080
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 07:07:18.8603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: juBsKv2/mLHUXpiFAfAoo6N/IK1d0MJEc7Z6CzMzFcKyedwBpdPiWMEZieW4+muMfMG77N6NUxyCHSeFW/t0ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370


> From: Srujana Challa <schalla@marvell.com>
> Sent: Thursday, April 24, 2025 3:13 PM

>=20
> This commit introduces the IPsec Operation to the Net device along with t=
he
> capabilities and resource objects. This enables the offloading of IPsec
> processing, both before transmission and after reception, thereby providi=
ng
> inline offload capabilities.
>=20
> Capbilities:
>=20
> 1. IPsec Resource Capability (VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP):
>    Indicates the device's IPsec resource limits, such as the number of
>    encryption and decryption Security Associations (SAs).
> 2. IPsec SA Capability (VIRTIO_CRYPTO_IPSEC_SA_CAP): Specifies the
>    supported IPsec modes, along with the supported cryptographic
>    algorithms, authentication algorithms, IPsec options and
>    anti-replay window size.
>=20
> Resource objects:
> 1. VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA
> 2. VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA
>=20
> These IPsec SA resource objects encompass parameters necessary for packet
> encryption and decryption. These include the SPI, tunnel headers, IPsec
> mode, IPsec options, and metadata specific to cipher and authentication.
>=20
> This patch refers the Virtio-crypto IPsec service operation capabilities =
and
> resource objects data structures and crypto algorithm definitions to avoi=
d
> duplication, however the admin command type vaule differs between Virtio-
> crypto and Virtio-net.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex | 52 ++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 0bb1cef..d918c55 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -140,6 +140,11 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits  \item[VIRTIO_NET_F_OUT_NET_HEADER(69)]
> Driver can provide the start of
>   \field{outer_nh_offset} value. Device gains advantage by not reading pa=
cket
>    to calculate outer network header offset.
> +
> +\item[VIRTIO_NET_F_IPSEC(70)] Device supports inline IPsec processing.
> + \field{struct virtio_net_hdr} size expands upto field \field{sturct
> +ipsec_resource_hdr}  when VIRTIO_NET_F_IPSEC is negotiated.
> +
>  \end{description}
>=20
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Networ=
k
> Device / Feature bits / Feature bit requirements} @@ -462,6 +467,10 @@
> \subsection{Device and driver capabilities}\label{sec:Device Types / Netw=
ork
> Dev  \hline
>  0x0802 & \hyperref[par:Device Types / Network Device / Device Operation =
/
> Flow filter / Device and driver capabilities / VIRTIO-NET-FF-ACTION-
> CAP]{VIRTIO_NET_FF_ACTION_CAP} & Flow filter action capability \\  \hline
> +0x0803 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP]{VIRTIO_NET_IPSEC_RESOURCE_CAP}
> &
> +IPsec resource capability \\ \hline
> +0x0804 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_NET_IPSEC_SA_CAP} & IPsec Security
> +Association(SA) capability \\ \hline
>  \end{tabularx}
>=20
>  \subsection{Device resource objects}\label{sec:Device Types / Network
> Device / Device resource objects} @@ -478,6 +487,10 @@ \subsection{Device
> resource objects}\label{sec:Device Types / Network Device / D  \hline
>  0x0202 & \hyperref[par:Device Types / Network Device / Device Operation =
/
> Flow filter / Resource objects / VIRTIO-NET-RESOURCE-OBJ-FF-
> RULE]{VIRTIO_NET_RESOURCE_OBJ_FF_RULE} & Flow filter rule object \\
> \hline
> +0x0203 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-
> SA]{VIRTIO_NET_RESOURCE_OBJ_I
> +PSEC_OUTB_SA} & IPsec outbound SA resource object \\ \hline
> +0x0204 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-
> SA]{VIRTIO_NET_RESOURCE_OBJ_IP
> +SEC_INB_SA} & IPsec inbound SA resource object \\ \hline
>  \end{tabularx}
>=20
>  \subsection{Device parts}\label{sec:Device Types / Network Device / Devi=
ce
> parts} @@ -3480,6 +3493,45 @@ \subsubsection{Flow filter}\label{sec:Devic=
e
> Types / Network Device / Device Ope  capability and the classifier object=
,
> unless the VIRTIO_NET_FF_MASK_F_PARTIAL_MASK  is enabled.
>=20
> +\subsubsection{IPsec Operation}\label{sec:Device Types / Network Device
> +/ Device Operation / IPsec Operation}
> +
> +A network device can support the processing of IPsec operations when
> +VIRTIO_NET_F_IPSEC feature is negotiated. In addition to standard
> +packet processing, the IPsec protocol processing is also handled by the
> network device.
> +This occurs both pre-transmit and post-receive, providing inline IPsec
> capabilities.
> +
> +IPsec Inbound processing: In receive path the device performs
> +decryption, authentication, integrity checking and remove additional
> +headers, including tunnel header if in tunnel mode, as well as the
> +ESP/AH header from the packet (See \hyperref[intro:IPSEC]{[IPSEC]}). The
> resulting packet contains only the plain data.
> +
> +IPsec Outbound processing: In transmit path the device performs
> +encryption, attach ICV, update/add IP header and add ESP/AH
> +header/trailer to the packet and transmit.
> +
> +\paragraph{Device and driver capabilities} \label{par:Device Types /
> +Network Device / Device Operation / IPsec Operation / Device and driver
> +capabilities}
> +
> +The device and the driver indicate IPsec SA resource limits using the
> +capability \hyperref[par:Device Types / Crypto Device / Device
> +Operation / IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP]{VIRTIO_NET_IPSEC_RESOURCE_CAP}
> +The \hyperref[par:Device Types / Crypto Device / Device Operation /
> +IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_NET_IPSEC_SA_CAP}
> +capability specifies which IPsec protocol capabilities the device
> +supports. The driver indicates the IPsec parameters by setting the IPsec=
 SA
> capability prior to adding any resource objects.
> +
> +\paragraph{Resource objects}
> +\label{par:Device Types / Network Device / Device Operation / IPsec
> +Operation / Resource objects}
> +
> +The driver controls the IPsec SA resource object using administration
> +commands described in \ref{sec:Basic Facilities of a Virtio Device / Dev=
ice
> groups / Group administration commands / Device resource objects}.
> +
> +The IPsec SA resource object contains necessary parameters for packet
> +encryption and decryption. These include the SPI, tunnel headers, IPsec
> +mode, IPsec options, and data specific to cipher and authentication.
> +
> +See \hyperref[par:Device Types / Crypto Device / Device Operation / IPse=
c
> Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-
> OUTBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA}.
> +
> +See \hyperref[par:Device Types / Crypto Device / Device Operation / IPse=
c
> Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-
> INBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA}.
> +
>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
> Types / Network Device / Legacy Interface: Framing Requirements}
>=20
> --
> 2.25.1

IIRC, the outer header length vnet field is added to speed up the ipsec.
So we should add the dependency or recommendation here to say, when device =
offers IPSEC feature, it SHOULD offer OUTER_HDR too.

For the rest,
Reviewed-by: Parav Pandit <parav@nvidia.com>
