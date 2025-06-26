Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5618C10E0
	for <virtio-comment@lists.linux.dev>; Thu, 26 Jun 2025 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938363; cv=fail; b=nHVsKbxCRLMcU16yeWJtnXJAA2kQ9JyztiEFoe7J597zwwA2MtxOB2PSwiWfzlKbzNZvfoAc7UMQB7dqSbTS45QBmcLU2US3d1sUg/glDb5hj32IaV5/eiSYaaeM+djk6th2i4tEKhe0DpTRbXgyyZPVzUEeZATxXt5Up3Gpmu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938363; c=relaxed/simple;
	bh=0opdhZMXRc5kvYKULssNvS+zjYENML7zbNefx3Az0Xs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VrfgJJnDdPd46s8gNpkL7Er9ORa0M4TI4zU1z+CCRz79zENhiVtJCaE9+phDFBDUGjLdLvAkk56pyIU6oLFmneznUVvmMldQe9NCFqccLiekwvxyLKB+EETdZP7ELl3wKZfBqoprkgle85X+NZ2caYRAtOAh3ti8/cy8MOb3JgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wl0CN+fj; arc=fail smtp.client-ip=40.107.236.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wl0CN+fj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUPS6/LOc1PccaMMkH1OFxCLsFqV7pYJ8bFSW4peKh2cFFpoEaRnH50ia4DyY1qGykgr+RgyVBvfoktehV1io85Vg/RAah+5jKl6eXbqeAONan0HjrU+SsC6nrYo/xdZA7s6cnvv9/hybQPdMGCcj99i/ktABhBs6/hxPkwDYyTs08Wr2jLPgQ2X+qRJkMRRuUHllhmQ47BLxQjGVyHXrWtHWNWoNwCaMBiMsbpjvr+p2cflURARcO3IFQIR0h5KWlIkWXaqYptWXluQ/hjuwURma1/meTpBVqckYCoVa5Tjjsu//HAgKawgx15D4qaCWm10hv7uRRlx/joVX7iwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezdBQb22S+GDJacmowYuT5b0E6dtbkjLLziPE45BmWc=;
 b=DL8Q4h3AH7Gf6QuLeVoXCxAYx/dMKyT9XVCQXpaRFib9Ziu+vn3T8oB6C3pjTrDxtTUnsTnPxT2UAUlIq5AST3p+kUhQJU1Ul9zMJvKG6VY3ZgTE7W7Z6hPxXG0VvqW5ZxDbkn888241OEYzzdVTq+aKhT4hzR5LmeZiSiCMVgAHJ0KO+CJXljlriiCiiVDaFCTE/8FgIAbhT7n4Ysxp3tuUApbH99xFsKjcxjuqh5+k0zT9hMCigGEE8HCGstlmx1jQguXuLqFr+kW5vzE+y0UaefJ6uGf5R3tAkIY/ETANZdTCxsyUgfLjoqVkqEAFNZmMT4pNjEuY6gwIZL1Rgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezdBQb22S+GDJacmowYuT5b0E6dtbkjLLziPE45BmWc=;
 b=Wl0CN+fj2Pf5FO3Yxhfvpj98pZvM14BEoxwDfoylMDQMdDv+mjnYTPJU3M3Y6JV5igWYRXpHOFpzZ2zP3XX8IzBECNREJjWSJi98W9FMBxQupeK5PpGR7lPbu16B/bGyMxnyHBTVG1pmawFEh13HIkuf9r+HZhXaUViIxtWmPV4lBrcki8SLWUzGcUOzQdDLPw3Wb9ZxWX4T08TRR7IXrLweLbHLARZvFhqSX1yT912GZSqOC3GIF4HHW9CQNFpt7LV2U1MdTMycAo+0FRNRzPesRdixbTdLF0KCOeww+6ckcXQNCK7HyfJ69RVJ/KDzXrT2tIptd/6ThIa7Lz7IMQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH7PR12MB6739.namprd12.prod.outlook.com (2603:10b6:510:1aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 26 Jun
 2025 11:45:59 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 11:45:58 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: RE: [PATCH v3 2/3] virtio: document feature bit 42
Thread-Topic: [PATCH v3 2/3] virtio: document feature bit 42
Thread-Index: AQHb5Bo/6SSKq8rrxE2WcRSx/K3jH7QVVlhQ
Date: Thu, 26 Jun 2025 11:45:58 +0000
Message-ID:
 <CY8PR12MB71955662A5578EE0D5A8FC67DC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
 <20250623083637.296041-3-lingshan.zhu@amd.com>
In-Reply-To: <20250623083637.296041-3-lingshan.zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH7PR12MB6739:EE_
x-ms-office365-filtering-correlation-id: 4e93c0ae-5d07-410a-09e2-08ddb4a704ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZmCxq+Owej1XtxZIJ0jBo2D64gLM+JI78v2lc6R2DjYwiPBclbU3spMXJ8Zh?=
 =?us-ascii?Q?etOt2j9smasKG3fUrgUfiO/c3o+TFggsMIHJ3XbYwMIp2U/R+xmQg8hiWIrE?=
 =?us-ascii?Q?ghf7hAG0zEHg4JsXBE1pn4T3RAVg1sTQQMCu6fBxNK2qV5pJgoUinAnsLtpC?=
 =?us-ascii?Q?+fGFzjz9CsE+fHu2NtosxBnoCBLT/HizTosLbF1Fx3/M/Nxio4wKM+Ub4M2l?=
 =?us-ascii?Q?d1jX/OHbNG8mBALKnfNvDuLXabUSQWTWyuIgkIGehzgo/xC3I32dF+OflZDT?=
 =?us-ascii?Q?m1jgyMuV8Mqgc3mIXICGPN8B0TDVdqshTT4wnx1XG6J6PT5TqB3KJqTHdL0B?=
 =?us-ascii?Q?GGPaBREmTOsCVOO/Rwjokkg5Wii2j3Igo7Sx+n17zUrQSrEak+2Hx4wVBgUH?=
 =?us-ascii?Q?HLJEA8z4kUsFy/u5jx/JSeQmo3GPNMwd6OaU3XGhghMbEO4DpkM+7jtNoQUx?=
 =?us-ascii?Q?bRereLhDaFUPc6rBOYEhJS/XWtwVHvM+mQRP3vHW+PXFAR6DXNOre7xUQZYZ?=
 =?us-ascii?Q?OaIQr41CK+nVNDyrFZTmsxSnSnhilN8ex++SvmfL4C1xDMJCbD0hzHXk7PKs?=
 =?us-ascii?Q?/B21P09V5lMnLXWhwO7xl/gLRsEf0LUbAkAu1XWEs3BGhEyySLtaa8Ulk2+A?=
 =?us-ascii?Q?yCDhaDS26x5ZOTlScUpvbRM/BC02DcKavFvMEJYYe1Z4dX9H6MkCeZ3dImaR?=
 =?us-ascii?Q?5G4KnR478t2JIqkWenOMdlZzd8i9Xrb4ujm0iD8XnqC4Koa3RUOCmEPdmT41?=
 =?us-ascii?Q?8JSR/joNj1TpKp+Ecw0J7puaBWDkThsBYLAHhhghFyu7wAvQgEJkyX3gUFHC?=
 =?us-ascii?Q?rB5bdvQIqLNCDZBykO88T0aiqWT3J4RdhYv3djL5Orsqjndxp6e/5JcqxBCm?=
 =?us-ascii?Q?Vyt80+ZchAb6VNKhDCxcqrAtNZSjh46RDNpDo0Qk1iQJspA6pT6DbNgXVdSL?=
 =?us-ascii?Q?pbYcCl/gGxHLVuaSzgsFNNC0BaNC2PQmfExGransGu2w6jcWkIFBjmxK1elJ?=
 =?us-ascii?Q?mp8ZRTpfURbL8xse/W3J2QkADPGs8Jamomg6zlLc5+EujSKIFPg+YuNLY3Kb?=
 =?us-ascii?Q?Gu81843/iJW6GeY1f/PYzLVEdOXMoqG+r95GA8V3QXhQxjJdheM/lsHXbmv6?=
 =?us-ascii?Q?s4ygsb8Bp8vY4CPsyJ4AGj004bVFGvyMMTRg7rhTroBzhUhAdX6TNQgPwTnH?=
 =?us-ascii?Q?w+q65ka9nB2Q6ehwvM3v2JvCMEY4w/aOGVtIYsgcZXknSkr9gF0TPvucZL7/?=
 =?us-ascii?Q?GM9W19KuUMVLXQPPmS4Xx0xuL/HpN9kr+c46LyUZw61PXVkz84rps40dIPZK?=
 =?us-ascii?Q?R0OyS5YzoScWRV0kyERMHd3MYONg464pHu5p5m4NzKjoUyJLaT8TVgxPqlBA?=
 =?us-ascii?Q?E7DTY6gSxAMJVJS+/noD7+DWnI72iMZh8ObitoaoyWBmRzZb0UjaGrrv4VNn?=
 =?us-ascii?Q?TsP7Hd0CCAWyyoFPKqComrTYZFqahH+rjOElrctiLck1B4q7BKK6Qg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JUq5/7kFY9Uu2zAT/tY9JKGF+FC/jHxE/yOZ/CIWu+ZhLbLx7oVvrBKlg5m/?=
 =?us-ascii?Q?a1d+39fafUrYg3dIIJfzzJfv+eZOWYmLdb3JUDa31B8bluulgB8P8fRN3hEs?=
 =?us-ascii?Q?KrR5NZbSRnzCUkW0HbqYRc31rpJNxgksm0KCCjOEdeHAvWcswWefm59iTlvL?=
 =?us-ascii?Q?1o+OFzwHuszx0AuK7GbxEr8Ks9i0BOoFM2XAu3I/2vWHljUn8/xQ7JmEHeeE?=
 =?us-ascii?Q?qf9RYE7TEK+MPscvNkGpuByN2+kEIhCkR3gcaw5hj25eG6o2P9dOrNSa/lKV?=
 =?us-ascii?Q?QB9tXwiqxmR+nimgQrdO+8pQ0v1/CwGwMTWEW2mGgKeRpASjykyPDVC432p9?=
 =?us-ascii?Q?qoH/stYmf9wKdOGMkTsnsOl9WfuLrAOZMeqtzj9Bu54gSou8coBPRcl5YclU?=
 =?us-ascii?Q?pmRVMmiYMGsyVVbnPd4UTybJekPeIRAcOo/qPlt/Dh2Y+rifPBx8H4qc1FFT?=
 =?us-ascii?Q?ToiuFuDn9JbBWl0Q+YIshSxi7rdHD2NprxUDaOCo58JbDVd5si9abxcIzjg0?=
 =?us-ascii?Q?B2yG1UY3FspogpG+nkByxxYHnV845JAISqaQ4uo7F8CDluQU2FBdaQZg3MmV?=
 =?us-ascii?Q?cESl+j5aZgo0cruLPSr5ctuJXLnU5Zb3tIwyKYv+/sKhsVaKFDSW6SmYn/xC?=
 =?us-ascii?Q?MkFkO24DzCr4MqSgIJyKQlcMBRTWQe5yrJrGul5zdFLljayPic/LcHr7nLht?=
 =?us-ascii?Q?6YmxOWeBDLpHV900eaN883bve7lMpZpCYqjga3T/sm4dFN+Y91h6YBpZrjNP?=
 =?us-ascii?Q?OTsTnYHc4DfAOEEW8wcGccfxocb0JSQS8EMQld6tn9Un00vaL9SkZVenypT9?=
 =?us-ascii?Q?I3Kq8ktbHIy2sTNHryXyKlyD4bCBG1QGlIW9gHShpoCYviplN/Wf+mlCSnCE?=
 =?us-ascii?Q?2E59Zbe8ngILqGGghsUk7RkyMXnL5OYdxfo9IUMAhJnctOYCIv/ntSJm+fiM?=
 =?us-ascii?Q?ji1/iBj6ThV3mRxmHIT3s2IjWt4OR0t8sJV2W+F0CVg8x9aOmRCbMh2AYyM/?=
 =?us-ascii?Q?IIwUCv4mwftKJy+6g17dP000RsEnxYrPNFe7f5BR1PIiCpV1yddJBb7K4Qpi?=
 =?us-ascii?Q?El9dtfet+z9gA1uJA082dR8j1RX8sEty/PHTBUUOX7w+/v+1jlB+nmVNbLIt?=
 =?us-ascii?Q?Z5njeaUfl3nN9Pop4jZi+b2SmCCp0vLV2ScBrkGIlDXAkTdExz/INioeyeHI?=
 =?us-ascii?Q?ebvoMfiAl4mbD9cGbznuBvLfbiPMozKegOtYKqVtF2Q8yPvEUnIhvEPiyj/E?=
 =?us-ascii?Q?M65b0wN6sPaVudEr2TCWaG5y6uht4OnEAbzFlWkbegIY8NIANxAcOkYq7y2Z?=
 =?us-ascii?Q?aYPpamA2qcDz/BQfpY7Z3I+FOec9GD//Wt87rRGcNX/dLZwVcnfDHqqU/msq?=
 =?us-ascii?Q?05AGp8LgQuUEcvfDpaSEh4OyqI1yg9mfBEYMClTMvzpPMq2M+umk2nhUgfwc?=
 =?us-ascii?Q?MW3yV3fYn7dB4v7EzND2hV4CACHm2ItyAIX1Ss/aPLTZpmtAVOk/rhbY2nv9?=
 =?us-ascii?Q?uVA7xtAIasB6hBp2PKwmvAxKZFOHD4y5lCV8zDp0esYl9979t4cqNHb4mF2a?=
 =?us-ascii?Q?+LuFbfxjuGsGxZMNFDs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e93c0ae-5d07-410a-09e2-08ddb4a704ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 11:45:58.9308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zqvUp3gW7m5nMiSxrg07On1YJrzl96foxfLy8Sm32Emlo1sk4mHmqVPqLHvW77tMmjARfUoXjQznanNHtpNXAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6739


> From: Zhu Lingshan <lingshan.zhu@amd.com>
> Sent: 23 June 2025 02:07 PM
>=20
> This commit documents feture bit 42
> VIRTIO_NET_F_GUEST_RSC6
>=20
> Fixes: 94384142 ("content: Declare virtio-net legacy feature bits 41-42")
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> ---
>  content.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 1efc2a5..2e8da46 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of =
a
> Virtio Device / Feature B  \begin{description}
>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>=20
> -\item[24 to 41] Feature bits reserved for extensions to the queue and
> +\item[24 to 42] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>=20
This does not look accurate.
Bits 41 and 42 are used by the device specific type and not generic queue r=
elated mechanism.
In this case it is used by the net device.

So right documentation should be,

0 to 23, 41, 42 and 50 to 127 Feature bits for the specific device type

24 to 40 Feature bits reserved for extensions to the queue and feature nego=
tiation mechanisms

43 to 49, and 128 and above Feature bits reserved for future extensions.

> -\item[42 to 49, and 128 and above] Feature bits reserved for future
> extensions.
> +\item[43 to 49, and 128 and above] Feature bits reserved for future
> extensions.
>  \end{description}
>=20
>  \begin{note}
> --
> 2.49.0
>=20

