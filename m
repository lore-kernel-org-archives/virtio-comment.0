Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95294277CAD
	for <virtio-comment@lists.linux.dev>; Thu, 26 Jun 2025 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939189; cv=fail; b=ffaenExl+JTjbv9PtCln6WPWmg8ZagWGFnKAr2oR+po4Xkqn3IzeQRuSMnFR3oG6qRxAl5ChavkV6WO9UmW7SumioCx4DO4tbdleBgzxi7d971vYQVsJQFUiobnzeD3BWpZmFO0dhNjtltIzD7IdbEUZXwCx48aGWGVz1ZT1Jm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939189; c=relaxed/simple;
	bh=zmAX4vfPC/TBS9b6p+z+v17c8fp5uml2czLATi+Moso=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sFYbqDjJctwg3me2Z57KMGMbv8vIG+m9JmB6NczlzdCd0OhH7YwwfInlgPu1OI4X3T4lHLTJM8HYQVPhmxgkPx+dico/AqF8nNRBNLxCTDlvr/F0H6HzjYtdg8qGsW+hpt4PQzl3TTN/N8KPqjl1P7Foxg19tacqBuucHFGwbaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MWZWt9+0; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MWZWt9+0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEkufWIoRolwPbyXca9IHry74ntZ3QIIUaMn9ynwxQ1kKyhmKZOdRi3TUo59CYfriYys6i1g2Y6KzHXsFnIPk3/C4I58eQUgNlh1mCQbZLNEFtq1fIXYvZL5Awh8CeckPJsqXDCQRWqbiU9vH45tAfAcDffSlaPiHuG1uoSfW3uTByeNeBAQQWqm0M3A5YDpVuV22VfdlhzeqRKZa1n5fdXeXtnMN58Kkap13CvnTKq49P5tP3ilOPUW02lLVq/MPuknR1tOuRH4csFVNdjFsyhb/NSobQCcaOt+b+qFO9KyVhtj35v5l/DlD5MONInH9lCzGJ4EI/UMM6PPFVDVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnhskNCZW96QBSEFCPaiMC0lmj4DRB1YIcji/KuORaI=;
 b=VjjedtESFp3VfA+khXH1WqvEmuqRnTOQwjDspPz90oSruGmptDLwzUyGi4MGgcka7WNWHnhxGr0vdLkfwT9OhI6pDK+vO2PUtbKkSkmuoHA6VUImuy4pF24JtuFP9A211l37oiCdmxmqOLVneKFMwOelykp3m0RKFza//9Iv1DwER4kbOcurx1rFQzbHdBxDquoyRmQQCtxQQFqaGNCha+6bHxCgM8ZSdiQgS6YUe6f5/VkP8iULlKxoCTxT+RyTbkN6FRDdkPEPhINLEiCDLOjE4dusFCeIRVslId80W6M6lqaSKsgCZ/zbo8ZH3G9SLGJWZlOvQQYkhLJaP/k5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnhskNCZW96QBSEFCPaiMC0lmj4DRB1YIcji/KuORaI=;
 b=MWZWt9+071yXj20I5ZW323+wlPBpAUaNKaZ8ZfmK3lLO55h+EtSBJakoLtmdb2hO7K0cEHMS8Yu9sZCppd9cCtmg/dnyOO1uDORNkJb6NM02JRoV2VP0o1l87vpilR772wGCC0kzg9sQHe3PYVVVWLnPAsk6/V8Oe5hBn8/vuG8Q4hNgU5Y32LVjfGUzZkwm1rGh9V0v1g6yCyh5dVBq2UdWKB3UK3MpwPcoHa1pkjEmsLhHx78fATqlnWgwX242mSdllmotsIsI8hVzx3U0ANIlt10uRK/dvVS24j1fT1hC3c7C3hUzm+C3nvPdjmaNmZnlMftpXHrB9jv6R3VpvA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA1PR12MB6212.namprd12.prod.outlook.com (2603:10b6:208:3e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 26 Jun
 2025 11:59:44 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 11:59:44 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: RE: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
Thread-Topic: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
Thread-Index: AQHb5BoUXKPusOin/kiYESw2fMoAA7QVWGyQ
Date: Thu, 26 Jun 2025 11:59:43 +0000
Message-ID:
 <CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
 <20250623083637.296041-4-lingshan.zhu@amd.com>
In-Reply-To: <20250623083637.296041-4-lingshan.zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA1PR12MB6212:EE_
x-ms-office365-filtering-correlation-id: 09819d72-5c09-43e5-1d5d-08ddb4a8f0a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KV466vWQTwl/lQE0eHND9pkmYVd0FB9mN5KwSpwuPXZ44FNE7Yu7eQHscPH8?=
 =?us-ascii?Q?XAAzkCmyM7Lxg2XVQrXSvM2iTKddjhKVF3n5K0KhiJIS1n6c4AjrmaR8iaCj?=
 =?us-ascii?Q?MdNl9bhIf2NMguG0k+qMQTVylSDpTW1OgFbOlVjKyEKAol8B/vW+kDmRPsAC?=
 =?us-ascii?Q?zzwjjFXGytx2KE/WPsgPv8XLRUMJVPn6UsxXyLrLlcnMErB2dt38gXrSsIMP?=
 =?us-ascii?Q?7Pc96LxxxllyePg5LtELX//aySwdoCIj+6qVTfAktc7aYGJGwZrM1KvLEahT?=
 =?us-ascii?Q?is7GD9VkcuME9yI5VxWbvBhU6r0NI7IOaH3JzMdB1H/URwh9EMd5ZCJEAIf0?=
 =?us-ascii?Q?yiAEUEyedlYWS+6ghdyM8B+p44DhbqSPeSsqROxlsZNUK4/otaXyEoLna6iX?=
 =?us-ascii?Q?dvm96cbSvomYP1mlgSgALGtAYlhIYlshs5wv1nlDrWiQJOT9pkRvgUvOfXrk?=
 =?us-ascii?Q?6Pl1II3JGd8TY1dS2eN0irqg2Xey5mACycozYDx0zh9MdCRQss9h6WeomA6M?=
 =?us-ascii?Q?DVD3FNZsSflWTYI/jxp2bEPETdoPs/hp+SUfWROkb1sy8LZrDfGgsDP/5da0?=
 =?us-ascii?Q?V4K0D84jmgKHLWCpEqxqqwKeLiweYI5ZxehJxkZVBOR/AveAn1WzxtYzIhTN?=
 =?us-ascii?Q?pzyeke+JKuYeWANcNRljJ8Xwq14zaznlBVhnY4CbzGS+DpmhqyCR6Ynea07O?=
 =?us-ascii?Q?CWv+gy8D21agvXyOcEdWVCdigiAe6HRqyIAXGoCe8VeHEIcLHeaMIfd9b8s4?=
 =?us-ascii?Q?3CMytDPFjtZmNghSqrZn0oSX88jxQxvujy1izhDAFvsoKgd8D+TFnasXdZT/?=
 =?us-ascii?Q?NO/VI5wP+e9NiXPNUFucRCZAd8PNi8hwGzDhhxmDFpL0smU5q5Jn6kd6CH45?=
 =?us-ascii?Q?H6Wpw7KkSEYINrUo2F8mPao3s6SHE+jBTi1qbQM+WzmabMTZXpo1u9nQmndm?=
 =?us-ascii?Q?p5/fqxiQh6sdczhwXDoN7uAZ9HhWEHNMfnM8KC9sBHAYAGoz6CvKp/lEJ/Gp?=
 =?us-ascii?Q?hR5NzjlCCxTPbTu7fn2+SBjC0b+rQWwpRQAoG/vee9DEgRHa8xY7EwDw27/8?=
 =?us-ascii?Q?ECpDK0+OZy6OgiYTf93AJzrIoxAkNww8VN9xgQlz9l98BWwx3CuROEl+a84x?=
 =?us-ascii?Q?/XlkWY7X72h1VvxxO5HgRI0Mpdn57QLvS4DPWeDr0KVVPFe5Zx7WnKKHb8Bn?=
 =?us-ascii?Q?qYc8ZtOKgzQnTpu+Sk5KQCauITOr7N1fn2UFuGVKyFsRHLRlwisFkkV0AIqI?=
 =?us-ascii?Q?eAxK3YHXZyD7kFiL21HBb5SFepTuVI/LRRogzRORnB3vcpghSNcvKewTs54D?=
 =?us-ascii?Q?ngPb0SnUfR+k/Rv2+Ko5xGltdhaWd8XDBGFjOK7/PazOlJkFz84dCi248DgP?=
 =?us-ascii?Q?mtxAA76QNq/sbcOj+SCdJ/AB4HoTzX7BDbP6MbpXdE1onyQHA5ooywwc6rCo?=
 =?us-ascii?Q?ijqlXHtBJ0pt1nT0wdJI00s194DlGRXydMqr6HLpoxWej0gOnd7iHg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DfcRSK0JrencFmquPgiGFjEq1NzxaasvF/Ofeo/RdAnBqTSGQBSarHIPCfAb?=
 =?us-ascii?Q?JYIuKqBeqtOM7GAzh1eiinZhNPBhK4rMP0U3BA3BNJfNsxSaJyxiBMF4ujpy?=
 =?us-ascii?Q?5lhx4N+z18yDiwNF9tJ0nBMOCMH7yrsWsPVtzdRMmgj+4MoNR8v3EsSOFhIo?=
 =?us-ascii?Q?G05bk+kypYiZn5TsBb5Ljow7kyN1Et9mVDVUpHm9fSfFRFJxjXRNWTzKEqtv?=
 =?us-ascii?Q?q4FMdcHxPqF3b452J1SZHnCmQ/t/4Pm8/mrYe2Hhy20+aDRiFZAC3CsJXRod?=
 =?us-ascii?Q?X3Xouzz0wbTzEw+ai1Kg6TIY1spFF9hrXuVtlOfZIuiqHQfvWQDTGW4yk1nG?=
 =?us-ascii?Q?/Z9s7nCULhoVQJo8w3cqr7Jwosnn80pGFWEu1cw6TbVKhDWNz/jrP1SLzWBZ?=
 =?us-ascii?Q?wP5ekMCbvUwNYydiuQH8Y410PaeG9+F8GKB9lm9nUTingV1RXawKftKjAD7l?=
 =?us-ascii?Q?0XGF+26i7qx3NjeLDaJRiaPR9x1CijuTdMsR1xU8b0ssvqTesZW2lj//laQv?=
 =?us-ascii?Q?2qd3UJd7c4umOxXIVLoWGmxfdFeFYlxsyuYsp03vbFqbhYavszXRIwWqerWT?=
 =?us-ascii?Q?LcqC0qWHlyZRFhuik1l8y26TjIijoe6SCPMwk2OpN77l/qnOYPbQ0ctCNd5h?=
 =?us-ascii?Q?z8sXkud/a8J8EeQNY6p2nU4YNSdF4wLW64iTsHfpNdDA8bB8labae263OJJY?=
 =?us-ascii?Q?urCWWfxVLqW3iSWA6YLBgsXgAK65fT2566gsyEkx8TRi8vemfvTYZFI2axLB?=
 =?us-ascii?Q?1yxHtnhsqTCtjdRtP3BRkPGaOLdWq+Qr7+79cMQhb0A7cDoIgalLa6H49d/y?=
 =?us-ascii?Q?BYI9Ji7WEEupkCPTGaKw6zQOOOvfsH9Gmr10sUL6pq9kSku8OiZVJANjiqmw?=
 =?us-ascii?Q?Ex7HVIsn1CvD70ZdSaRnBNbtKOI2jrgg92qHDr5+tPqZ//huphDICSjvW74p?=
 =?us-ascii?Q?exRQT0sqx8UYVSxuJrxuQ5CzbgmNLN7zuiTXVs4NSjyJK53F6lyyAeSI1tfS?=
 =?us-ascii?Q?l0r/6h2QZNdr5+RN2izgT31n2eCqgiovjf5v7TvYEopGukwhzc/egyRRuMim?=
 =?us-ascii?Q?tfmPhiuI+x9YN5SAxoH5kl3lg6rmfZB1hVnysDSx/Xc5ZmeCsbTMrGU3HK0O?=
 =?us-ascii?Q?MYXRBXgDF0mnS0q6jWFruqM2bJ7RxkRZdXlvb6KPYvO/RxtDWVYC3tC3+aXt?=
 =?us-ascii?Q?g0DrETVbsheDpUL5cdSzgLzDJVoNM40U7ZWrvpqrRvfvT3YEpzGL93U3X1fX?=
 =?us-ascii?Q?hBfdStv79a6IIQLrVb1im0kh4Q01zoKFMXlQOYPvTy+XYa/fIDOpSLFK3hQq?=
 =?us-ascii?Q?DoQzr+LtW2BtVNRbG5xxha0je6SnBleSplHiRFrh1JYqTueHg0JmXsxSsfUG?=
 =?us-ascii?Q?Wv6viqh0crmMUYqznVC8aXjM14sUHnV1licJYlGTNwvlSD8+QsIKIJVC+B2r?=
 =?us-ascii?Q?rA3g5+QEOZ7reeZ4KRQbvUs+9owTa39F3cxH8w25MYAABP+ZBA17WnsmMkFs?=
 =?us-ascii?Q?lL4J0QwKvUHwzx6LC9opCcedei2CXTDsNRtXRrKlFUPwxRMnPk+IDCoGiq6N?=
 =?us-ascii?Q?KZBpjg++1XC6BgXXT20=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 09819d72-5c09-43e5-1d5d-08ddb4a8f0a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 11:59:43.9795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQQdtDOTo9qWgwHYOA/Wmg8P4x+Lvi/TJWoZhxqMOvRauQzjnH7dGghxZZE0nTnIakrf27zyhstGoqW9nn1ehw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6212


> From: Zhu Lingshan <lingshan.zhu@amd.com>
> Sent: 23 June 2025 02:07 PM
>=20
> This commit allows the driver to suspend the device through a new device
> status bit SUSPEND and resume the device running by re-setting DRIVER_OK
> bit in device status.
>=20
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Fixes:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> ub.com%2Foasis-tcs%2Fvirtio-
> spec%2Fissues%2F229&data=3D05%7C02%7Cparav%40nvidia.com%7C3085ab
> 378f264b5c845808ddb2313478%7C43083d15727340c1b7db39efd9ccc17
> a%7C0%7C0%7C638862646595099882%7CUnknown%7CTWFpbGZsb3d8e
> yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj
> oiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DPf2ub%2FwVzdmf
> A1JjScOJ7D%2B%2BNea9XgVFYdvvDQxym40%3D&reserved=3D0
> ---
>  content.tex | 59
> +++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 2 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 2e8da46..c987334c 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -42,6 +42,9 @@ \section{\field{Device Status} Field}\label{sec:Basic
> Facilities of a Virtio Dev  \item[FEATURES_OK (8)] Indicates that the dri=
ver has
> acknowledged all the
>    features it understands, and feature negotiation is complete.
>=20
> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that
> +the
> +  device has been suspended by the driver.
> +
>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
>=20
> @@ -99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of=
 a
> Virtio Device / Feature B  \begin{description}
>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>=20
> -\item[24 to 42] Feature bits reserved for extensions to the queue and
> +\item[24 to 43] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>=20
Ignoring this delta as the fix of patch-2 will change this.

> -\item[43 to 49, and 128 and above] Feature bits reserved for future
> extensions.
> +\item[44 to 49, and 128 and above] Feature bits reserved for future
> extensions.
>  \end{description}
>=20
>  \begin{note}
> @@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
> Initialization And Device Operation /
>=20
>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) befor=
e
> removing exposed buffers.
>=20
> +\section{Device Suspend}\label{sec:General Initialization And Device
> +Operation / Device Suspend}
> +
> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
> device by setting the SUSPEND bit in \field{device status} to 1, and the =
device
> SHOULD set the DRIVER_OK bit to 0 once it has been suspended.
> +
You ignored the inputs.
I do not agree to add the "SHOULD" normative wording in the general descrip=
tion area.
The reasoning is explained already.
Please adapt to the existing style of this spec to keep the normative in re=
quirements section.

If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
device by setting the SUSPEND bit in \field{device status} to 1, and the de=
vice
sets the DRIVER_OK bit to 0 once it has been suspended.

Is this really that hard to write above way?

> +If the device has been suspended, the driver can resume the device runni=
ng
> by setting the DRIVER_OK bit in \field{device status} to 1, and the devic=
e
> should set the SUSPEND bit to 0 once it resumes running.
> +

Similarly,

If the device has been suspended, the driver can resume the device running
by setting the DRIVER_OK bit in \field{device status} to 1, and the device
sets the SUSPEND bit to 0 once it resumes running.


> +\drivernormative{\subsection}{Device Suspend}{General Initialization
> +And Device Operation / Device Suspend}
> +
> +The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or
> VIRTIO_F_SUSPEND is not negotiated.
> +
> +Once the driver sets SUSPEND bit in \field{device status} to 1:
> +\begin{itemize}
> +\item The driver MUST verify whether the device has been suspended by re=
-
> reading \field{device status}, examining whether the SUSPEND bit is set t=
o 1
> and the DRIVER_OK bit is set to 0.
> +\item The driver MUST NOT make any more buffers available to the device.
> +\item The driver MUST NOT send notifications for any virtqueues.
> +\item The driver MUST NOT make any changes to Device Configuration Space
> except for \field{device status} if it is part of the Configuration Space=
.
> +\end{itemize}
> +
> +\devicenormative{\subsection}{Device Suspend}{General Initialization
> +And Device Operation / Device Suspend}
> +
> +The device MUST ignore any operations on the SUSPEND bit from the
> +driver if the device has not been completely initialized by the
> +procedures in \ref{sec:General Initialization And Device Operation /
> +Device Initialization}
> +
> +The device SHOULD ignore any write access to its Configuration Space
> +while suspended, except for \field{device status} if it is part of the
> Configuration Space.
> +
> +A device MUST NOT send any notifications for any virtqueues, access any
> +virtqueues, or modify any fields in its Configuration Space while
> +suspended.
> +
> +If changes occur in the Configuration Space during suspended period,
> +the device MUST NOT send any configuration change notifications.
> +Instead, the device MUST send the notification when it resumes running.
> +
> +If the driver sets the SUSPEND bit in \field{device status} to 1, the
> +device MUST either suspend itself or set the DEVICE_NEEDS_RESET bit in
> \field{device status} to 1 when it fails to suspend.
> +
> +If the device has been suspended and the driver resumes the device
> +running by setting the DRIVER_OK bit in \field{device status} to 1, the =
device
> MUST either resume normal operation or set the DEVICE_NEEDS_RESET bit in
> \field{device status} to 1 when it fails to resume.
> +
> +When the driver sets the SUSPEND bit to 1, the device SHOULD perform
> +the following actions before presenting the SUSPEND bit as 1 and DRIVER_=
OK
> bit as 0 in the \field{device status}:
> +
> +\begin{itemize}
> +\item Stop consuming more buffers of any virtqueues.
> +\item Wait until all buffers that are being processed have been used.
> +\item Send used buffer notifications to the driver.
> +\end{itemize}
> +
>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>=20
>  Virtio can use various different buses, thus the standard is split @@ -8=
72,6
> +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bit=
s}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits=
}
> for
>  	handling features reserved for future use.
>=20
> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
> +   suspend the device by set the SUSPEND bit to 1.
> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Fiel=
d}.
> +
>  \end{description}
>=20
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> --
> 2.49.0
>=20

Rest of the requirements and description looks good to me.

Can you please fix these 2 small things in the general description and patc=
h-2?
