Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76C11C2315
	for <virtio-comment@lists.linux.dev>; Thu, 15 Aug 2024 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723714452; cv=fail; b=QL8+GWcPJdaDPyQBBW+BTYXPXVhHAy21PKkiNxp+/sjg1IVUPwXIuDQNoFY7J+SJ9mkI+twQmVD7aqb7U0bAWglJKaWXG3srQ8x8+DaGh37q32T+8ezjTmxUq993U+hP5ZW7jByyZ2JLVHuwqHvscwFVrWRnpEup/uTdkawZBa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723714452; c=relaxed/simple;
	bh=VYK781FHwG3eHJA/NXLN3nFviMZZbXBJkHnNQYbIEtQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DwJi1Sz8SdNIwO2ZNurxhqcKmXRl+Y9AT1bLPPQul0gp8KW3hzUQpC1XvWejW6L4TNQTfnTXlti3M500LZglN4AbSazK+DHWLA+jKr476rkA4+OnPNrEi3vR2E3F9h8NVVaWhkLXe60QKT9mEVrsAx1XQbWFbdtOVWew/WXZu9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zo1gVdgZ; arc=fail smtp.client-ip=40.107.243.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zo1gVdgZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drooFIbkDZp/YUJGkjQDfU6pwDWS0KqVvEzMAxwu2FjJpjBiLtEs1TfpgoxG8uQeYjZy4RgUSvDget19gkm8NHEuPbuPmi+/qKmYmn11MuwFNwMLyeEdDOZbiVKbLMMiSLz9ufNqwecN6O+U0ofjoJVSaKG2PJ4Y7Yajdv0XZ8yIDJAHWgtsNe+6BFyJ/S7C+9j8FLOztK1liU+lywdCxpQg9otIN+yxTR5pjoq+1ogLYuu8aLwS3QxEvJgxX2gKVM6771T68cNAI8RHABQP4OourFtrxRk+OGaLhYG4cYHUyvQQiZo/G+iKj3iaKEJuWDLkm3jDqDl6vQm4gbuYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh/UjJzyXUf0pVFQ4IQW1GXJ/InD+1XxkqLBXyx+P64=;
 b=wcwdDVcgqrxovOWvMXOWRFrGNdejO8R+KF6yy8IWvxpVSnbyVzhNOUjA8hfDKvz2JX6mrGDYYra2q6GdOOIaiBCfsLHI4gBhOzS02OfOmbX79FEy7mdY4E9nQc+5ISdOB2mn4WvgqV5fUs/f6sQFxqbTZ+MAY1RQi4xccGR2y7y+FKjfCZdY3sEy9jJ+TswxfoadoVAAL1wlTzMOOeOfBEE2Wxos1JvR3gBvtjAYJ2NDlmTvzatYT+DI7Cme0pkTj+jxF6c/JQP9iyOzKpVNdmpoJuAuT+Zl1Dba+wBbpajJRmAWqg4aJAy7/z8SO2kBbykw2ITF3532qHGMCnkp6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mh/UjJzyXUf0pVFQ4IQW1GXJ/InD+1XxkqLBXyx+P64=;
 b=Zo1gVdgZjrV89G5cM47MWOUOF/nibNUOxX2O4UqfRP6ryjH7SAoabEQ3LgDUWKFF98m5nlzH367Z/ld9lUG8K1O/xxKcvOl2NXy9acB6zgwG8/Wx7Km5PTq3K3ya5Un3Bq3dtNiovrlfAJfh2vIEXBu+vH22zCNy2w7U9tpwLqgvS7/74bRu0Xgxq9AuSiWhZZ9M51xfZ4r4BlWzYC1WP5SPuAVGvxY49dOUjKXOCCXZ/YD9mKTOTjE45ou6GMqy3/ybFV3pKUC+4FDXSl28nbBF0jLnu8LHcY2sJq/4W1SuzQqqEGjeDJDUTRxpwQ5zdIlvYJ9szwZvbj0nQRXK7A==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by SA1PR12MB6847.namprd12.prod.outlook.com (2603:10b6:806:25e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Thu, 15 Aug
 2024 09:34:04 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7849.021; Thu, 15 Aug 2024
 09:34:04 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	=?iso-8859-1?Q?Eugenio_P=E9rez?= <eperezma@redhat.com>, David Stevens
	<stevensd@chromium.org>
Subject: RE: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA0LrAIAAAIWA
Date: Thu, 15 Aug 2024 09:34:04 +0000
Message-ID:
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
In-Reply-To: <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|SA1PR12MB6847:EE_
x-ms-office365-filtering-correlation-id: b8d165c9-8d74-4b33-7779-08dcbd0d6708
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?uH16nYXkAi6xnZbyYFAqAs3AW9nts39KAnRKe/TtL6SRvqG9VVgdFvm4s7?=
 =?iso-8859-1?Q?iqvWo7GW1wQHD+VRQYm9uc4JSEp8KJCTkcbcUmL31Vei9RAZWOZl5h2QmX?=
 =?iso-8859-1?Q?yZ55yHDVsvVRe+5VCbJIXCBod7qANHj14qzExh/xoVnLOXo4MKMGeVtNbH?=
 =?iso-8859-1?Q?suDsDcOFGi1I4EipnM58M65Yiit1KXmHe+Y+Pn7pA9DTLQmsk0KtpZZJjf?=
 =?iso-8859-1?Q?kxdV8hc2bocoEBByiA2GTc1Dg4xSNCGg2H1Bokxfm8bMStW2dsIreIlbQp?=
 =?iso-8859-1?Q?4PBwm5AOzkmw+rJMulirZ80ruQ+SMPEm7uysk/3Z8aMh0CD3RwXZRUx9uJ?=
 =?iso-8859-1?Q?HZuF2Iuxyw0fhEVXeSUr47/ieLiXvPDeEM8WDTfWPMVJ3ELQSUhrG1Uo35?=
 =?iso-8859-1?Q?FZwg3LygFDxO8PirtCVtxvc2deaVZBoags52/V0+zkIseyKIN+wjbCjZ0x?=
 =?iso-8859-1?Q?3pg+38zjkDbD2YyRqdXSgwvtY+cYVP+UxsT+q6ApDHsY7/7LyAXAVdA48R?=
 =?iso-8859-1?Q?9kXFesUwY8IkYUVq5jvpKCDjal4sZ8yPotAZ6ubKbt7dEOFAidK9VR/fcQ?=
 =?iso-8859-1?Q?sB3L3txjL5iROwnat+sdfHhoVPqSotqglaKoBgOaXl3FgPrmlHdoi12GCa?=
 =?iso-8859-1?Q?I+5orx4IxqflQbfqmuWKzz6wxNUevl+m5AMX0iG/g15iA/IR5NIEaUQBn5?=
 =?iso-8859-1?Q?yJ6x0gzHPdkbmQE1DGjAl9astbv6WIHFzWhrUK78/+giaRZxA8O2Y62E8R?=
 =?iso-8859-1?Q?cbZK+pxzekkCYw5zrw5gmkCNModPloTvWaxzJ6DrwadLZsOV3J6DZIGyWR?=
 =?iso-8859-1?Q?N3gPwdUsv/6NyTUMjyVk1ZjvF5Owxx6Eh1BUNAkDLbcq6XB4t4kdHSUSHC?=
 =?iso-8859-1?Q?xC4Sqyhyqs+ZM40F16WtGLMsaqDBnTDfV3Vj1un0fYliNnPmQd6ziEtwQd?=
 =?iso-8859-1?Q?fErLM59jKrX9U8sSbaiZXjY2EQWaP6+RjkhsVGI44u28SDMl3VMkCHAsHI?=
 =?iso-8859-1?Q?YmW4gzLlBPjBQeWW3VQH0gob781jBxbkjhSHjMUfYTO/tx/MFcu+7TR5Dj?=
 =?iso-8859-1?Q?vMQePe6r2x1a93x2fWq3UO1CI6mbxbaTI7OFta3M1Hm7hTQ3e3tooFrGuN?=
 =?iso-8859-1?Q?ssGQfyVDjUKr0dFBXqZNr4KbA2b1Vik8saN6dypLrEn4m3bBQUIf6yka5C?=
 =?iso-8859-1?Q?cAYOsCIaNRkrFHBvRO33e3aKIeQtnCJz7KJ7EzGXIqI8jD7q/zE3LCvOth?=
 =?iso-8859-1?Q?ujOKn30fX9q06QXu2TB2O36eQDCUWKSxkL05el4UxvuZN4mbBA0pBjbse9?=
 =?iso-8859-1?Q?jREBrBLRdHiF7qTHSIVEgJNkIMWcewF4UHL5rdXq681rMo8gjzqihQ6pRs?=
 =?iso-8859-1?Q?UQfHwtWRzenrW/jCVZYqzEhU4tEC3YE4IdMNdng3I8Ul+P9Rt/+ZTxH8eL?=
 =?iso-8859-1?Q?BcWE/G/wuhiiJHnKvqMZN6V49WXdWos/sPIgow=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IYuOvkyNp4JnGijUNY1KmFsC4FziyynV035exCN/bK6rUZ9saA64FJ0Be8?=
 =?iso-8859-1?Q?+z5xCyK48lAlHGPsV5QFtqcM2cmGqydKuDAsvIBEh/oAS53qT/4OgVPMEK?=
 =?iso-8859-1?Q?YVnQiVf0OChnbZTi3UGJy36jCmWRsKHRvYvNUV1ug9CYcTZ6SZ2qQxjz+b?=
 =?iso-8859-1?Q?NHG9wnsCv8Hy3vD3B/Zo0M6LxZkzEJfpwnKjr8CdtGzXXppLLGZJn+qh4F?=
 =?iso-8859-1?Q?W5vZOElibnZDssTi265XxStWJoihjU/yLExsUxocRn6NydBbNfEDZ2sEQW?=
 =?iso-8859-1?Q?Zzruz4OzJeg9sgn53fcVT4sSdmY1OLKUBX9Z3JC36MYOlONbNXUWGq8QO3?=
 =?iso-8859-1?Q?MGwy6SqE3q2sEqBdgkC8x44bdJcADAqZ5FFieoC3K6G6GT0/JXuLULUC7i?=
 =?iso-8859-1?Q?xKhBrb0MvCC8Lw/ytGaRDqvJ4oJLhiSgF/Mcp7sK5vntMPA4C2ouTODeq9?=
 =?iso-8859-1?Q?+1IBcYHRXx8YBcZkhxJZRDdRPNJJPbpNslT/7+/KCh3h5Elx50jbrjlU7S?=
 =?iso-8859-1?Q?u1PhMRNSQwTYTYm0/X27tVOQbghptBT290wqJncCxVR9t15wF31L8YEdE9?=
 =?iso-8859-1?Q?3UFNfKSy5Vn2e/+NfwswNGm8d4YYsqiq2/NsLEH5MNINhwarEzt8aRvYrd?=
 =?iso-8859-1?Q?QBerEKlUeQZCDEjZORBwPsvENWAKkiW1ByZcB5OSqsEgNzly/xRuB7Ut/T?=
 =?iso-8859-1?Q?yZayoHNCPDzxjrYR/bpErFhLjhi5AfxWsxsyY8nBw0VEYFEmIW1icMB/Ab?=
 =?iso-8859-1?Q?xAGyRU4QHpalSLslXJyF35xlt5Ob2rYvJTxrVRv8J7lYxWfTJfwaxMLvUV?=
 =?iso-8859-1?Q?QXhcdJKgpYrTbrRvU6XyTD5f0b0kST2V8irm7bJSBOgtMQxWLURvCHieQK?=
 =?iso-8859-1?Q?FeTCH3gBP+bDw/qbUtV8DsVnVeA6cwCq/DxiYtkGHehhogugE5aSlpNUkE?=
 =?iso-8859-1?Q?puRMP2vExvyjY9WX5+imlCzESxxHRPJbCLQT9pDY/SU7/R39nM/xaebr7i?=
 =?iso-8859-1?Q?/KAh0GgchbBRTmZy8t/A8lG2D4E1QdVGrgTPBvF9SnBPnw+HlX0zm2kd06?=
 =?iso-8859-1?Q?OkFCyl44vAnFSR8Hln8G/9dGd3+clDyKsN2MFeENt7AXPsEWmoKvXlb/hK?=
 =?iso-8859-1?Q?lXM3UliB7/TZf6luxhFWKXXzjhnZChgELwcVznDL6+T688DVTXrLV/OX57?=
 =?iso-8859-1?Q?dlWI2NIebp9EHwwnT93tEClcGLBSFKibYvy94b5F91FhveesACW61/qzwx?=
 =?iso-8859-1?Q?0n830Fgd1vDabhD/lgfMdad3g0j/pB78C9yl3XfIIElV9X5O6j3kFqgNQn?=
 =?iso-8859-1?Q?B/9IdAY6SuVl45flOkhcHGRIxig21d0F20MFCxKssZfS1Sbo6oiWSPzy/I?=
 =?iso-8859-1?Q?rYsbQmI2VpOFN2LVoPLSTAPA0mVt+Onf/Bp0AxfOa5cEHUzgcXEUhD9WR+?=
 =?iso-8859-1?Q?Ca8ER0aG7p9D70oIC2By61jD7hDbRjCHky5C4g8o5bcA8Qk/kPixa253Hw?=
 =?iso-8859-1?Q?VH6zT4+g8oAqpardE0xzV9tHeidLcQBRHymNRrikcXFBW73hLmAdlbisNj?=
 =?iso-8859-1?Q?5++mnr7iDnp2Rp+1THyRvFNy33TS3Qv3wYVDItg5psTaoVvR99UvbmWE2d?=
 =?iso-8859-1?Q?yC0nbwkZjPp8I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d165c9-8d74-4b33-7779-08dcbd0d6708
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 09:34:04.0459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2fZPjCzG1hsGR9WTojaK2dV+iGgn1U9hQHCUwbEVH62FL0/Az6bBaGoADr5Kx0wuUlx2BIpip0gvYWmRPfxu2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6847

> From: Zhu Lingshan <lingshan.zhu@amd.com>
> Sent: Thursday, August 15, 2024 1:53 PM
>=20
> On 8/13/2024 2:55 PM, Parav Pandit wrote:
> >
> >> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Sent: Tuesday, August 13, 2024 11:44 AM
> >>
> > I removed the unreachable intel email id as every single email is bounc=
ing
> from it.
> > Please consider dropping that email from v8 as it will cause all review=
ers
> email to bounce.
> >
> >> On 8/13/2024 1:50 PM, Parav Pandit wrote:
> >>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>> Sent: Tuesday, August 13, 2024 11:15 AM
> >>>>
> >>>> On 8/13/2024 12:42 PM, Parav Pandit wrote:
> >>>>> Hi Lingshan, David,
> >>>>>
> >>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>> Sent: Thursday, August 1, 2024 5:05 PM
> >>>>>>
> >>>>>> This commit allows the driver to suspend the device by
> >>>>>> introducing a new status bit SUSPEND in device_status.
> >>>>>>
> >>>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
> >>>>>> which indicating whether the device support SUSPEND.
> >>>>>>
> >>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> >>>>>> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> >>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
> >>>>>> ---
> >>>>>>  content.tex | 75
> >> ++++++++++++++++++++++++++++++++++++++++++++++-
> >>>> ----
> >>>>>> --
> >>>>>>  1 file changed, 65 insertions(+), 10 deletions(-)
> >>>>>>
> >>>>>> Changes from V6:
> >>>>>> - the device should hold its config interrupt while SUSPEND,  and
> >>>>>> send config interrupt when the SUSPEND bit is cleared.
> >>>>>> - while SUSPEND, the driver MUST NOT access Device Configuration
> >>>>>> Space
> >>>>>> - minor changes.
> >>>>>>
> >>>>>> Changes from V5:
> >>>>>> - the device should present NEEDS_RESET if failed to suspend
> >>>>>> - allow the driver access device status in the config space when
> >>>>>>   suspended if it is implemented in config space.
> >>>>>> - language improvements
> >>>>>>
> >>>>>> Changes from V4:
> >>>>>> - re-order the device status bits section
> >>>>>> - kick vqs --> notify vqs
> >>>>>>
> >>>>>> Changes from V3:
> >>>>>> - allow the driver clearing the SUSPEND bit to resume the device.
> >>>>>> - disallow access to config space while suspended.
> >>>>>>
> >>>>>> diff --git a/content.tex b/content.tex index 0a62dce..2d1bee8
> >>>>>> 100644
> >>>>>> --- a/content.tex
> >>>>>> +++ b/content.tex
> >>>>>> @@ -36,19 +36,22 @@ \section{\field{Device Status}
> >>>>>> Field}\label{sec:Basic Facilities of a Virtio Dev
> >>>>>>      this bit.  For example, under Linux, drivers can be loadable =
modules.
> >>>>>>    \end{note}
> >>>>>>
> >>>>>> -\item[FAILED (128)] Indicates that something went wrong in the
> >>>>>> guest,
> >>>>>> -  and it has given up on the device. This could be an internal
> >>>>>> -  error, or the driver didn't like the device for some reason,
> >>>>>> or
> >>>>>> -  even a fatal error during device operation.
> >>>>>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and
> >>>>>> +ready to
> >>>>>> +  drive the device.
> >>>>>>
> >>>>>>  \item[FEATURES_OK (8)] Indicates that the driver has
> >>>>>> acknowledged all
> >>>> the
> >>>>>>    features it understands, and feature negotiation is complete.
> >>>>>>
> >>>>>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and
> >>>>>> ready to
> >>>>>> -  drive the device.
> >>>>>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated,
> >> indicates
> >>>>>> +that the
> >>>>>> +  device has been suspended by the driver.
> >>>>>>
> >>>>>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has
> >>>> experienced
> >>>>>>    an error from which it can't recover.
> >>>>>> +
> >>>>>> +\item[FAILED (128)] Indicates that something went wrong in the
> >>>>>> +guest,
> >>>>>> +  and it has given up on the device. This could be an internal
> >>>>>> +  error, or the driver didn't like the device for some reason,
> >>>>>> +or
> >>>>>> +  even a fatal error during device operation.
> >>>>>>  \end{description}
> >>>>>>
> >>>>>>  The \field{device status} field starts out as 0, and is
> >>>>>> reinitialized to 0 by @@ -
> >>>>>> 60,8 +63,9 @@ \section{\field{Device Status}
> >>>>>> Field}\label{sec:Basic Facilities of a Virtio Dev  initialization
> >>>>>> sequence specified in \ref{sec:General Initialization And Device
> >>>>>> Operation / Device
> >>>> Initialization}.
> >>>>>> -The driver MUST NOT clear a
> >>>>>> -\field{device status} bit.  If the driver sets the FAILED bit,
> >>>>>> +The driver MUST NOT clear a \field{device status} bit other than
> >>>>>> +SUSPEND except when setting \field{device status} to 0 as a
> >>>>>> +transport-specific way to initiate a reset. If the driver sets
> >>>>>> +the FAILED bit,
> >>>>>>  the driver MUST later reset the device before attempting to re-
> >> initialize.
> >>>>>>  The driver SHOULD NOT rely on completion of operations of a @@
> >>>>>> -99,10
> >>>>>> +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a
> >>>>>> +Virtio Device
> >>>>>> / Feature B  \begin{description}
> >>>>>>  \item[0 to 23, and 50 to 127] Feature bits for the specific
> >>>>>> device type
> >>>>>>
> >>>>>> -\item[24 to 41] Feature bits reserved for extensions to the
> >>>>>> queue and
> >>>>>> +\item[24 to 42] Feature bits reserved for extensions to the
> >>>>>> +queue and
> >>>>>>    feature negotiation mechanisms
> >>>>>>
> >>>>>> -\item[42 to 49, and 128 and above] Feature bits reserved for
> >>>>>> future extensions.
> >>>>>> +\item[43 to 49, and 128 and above] Feature bits reserved for
> >>>>>> +future
> >>>>>> extensions.
> >>>>>>  \end{description}
> >>>>>>
> >>>>>>  \begin{note}
> >>>>>> @@ -629,6 +633,53 @@ \section{Device Cleanup}\label{sec:General
> >>>>>> Initialization And Device Operation /
> >>>>>>
> >>>>>>  Thus a driver MUST ensure a virtqueue isn't live (by device
> >>>>>> reset) before removing exposed buffers.
> >>>>>>
> >>>>>> +\section{Device Suspend}\label{sec:General Initialization And
> >>>>>> +Device Operation / Device Suspend}
> >>>>>> +
> >>>>>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
> >>>>>> +SUSPEND bit in \field{device status} to suspend a device, and
> >>>>>> +can clear the SUSPEND bit to resume a suspended device.
> >>>>>> +
> >>>>>> +\drivernormative{\subsection}{Device Suspend}{General
> >>>>>> +Initialization And Device Operation / Device Suspend}
> >>>>>> +
> >>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
> >>>>>> VIRTIO_F_SUSPEND is not negotiated.
> >>>>>> +
> >>>>>> +Once the driver sets SUSPEND to \field{device status} of the devi=
ce:
> >>>>>> +\begin{itemize}
> >>>>>> +\item The driver MUST re-read \field{device status} to verify
> >>>>>> +whether the
> >>>>>> SUSPEND bit is set.
> >>>>>> +\item The driver MUST NOT make any more buffers available to the
> >>>> device.
> >>>>>> +\item The driver MUST NOT access any virtqueues or send
> >>>>>> +notifications for
> >>>>>> any virtqueues.
> >>>>>> +\item The driver MUST NOT access Device Configuration Space.
> >>>>>> +\end{itemize}
> >>>>>> +
> >>>> Hi Parva
> >>>>> Do we agree that
> >>>>> a. suspending a device is non frequent operation (in order of N
> >>>> operations/sec, where N is roughly in range of 10 or 100) per device=
?
> >>>> Ideally it should not be often in normal operations, but remember
> >>>> we can not restrict the behaviors of the driver, so we must be able
> >>>> to handle the scenario in which SUSPENDING is often.
> >>> Sure. the intent is slow rate, but one can do at unexpected times.
> >>> Do you agree?
> >> I think we don't have an intention of the frequency in the spec.
> > Sure.
> >
> >> The spec only provides generic mechanisms and interfaces.
> > Sure.
> >
> >> Don't assume it(or driver wants it to be) would be often or not, that
> >> depends on the driver.
> > As you rightly said : it cannot be assumed.
> > The driver will read the device status right after it wrote it. This ty=
pically is <
> 50nsec of time.
> > The suspend operation for a net device to store hundreds of queues, RSS
> table, flow filters, takes plenty of time (at least more than 50nsec :) )=
.
> > Similarly for the GPU to store some MBs of memory takes more than 50nse=
c
> of time, for example to store in a file for a software-based GPU device.
> > So a device cannot respond back suspend=3Dtrue in next 50nsec time.
> It's OK for the device to take longer time to respond, the driver simply =
re-reads
> device status.
Sure, the issue is, when the driver re-reads, the device must present suspe=
nd=3Dfalse within 50nsec.
(because device didn't suspend it yet).

As I explained in previous email, this requires building special circuitry.
Such circuitry can be avoided if the suspend interface is done slightly dif=
ferently.

> >
> > More below.
> >
> >>>>> b. A software-based device may not always want to force VM_EXIT on
> >>>>> read
> >>>> and write on the device_status register?
> >>>> Trap and Emulation is the basic of virtualization, and how to
> >>>> pass-through a device is out of this spec.
> >>>>
> >>> Sure, I didn't suggest to put such things in the spec.
> >>> My question is, whether to trap and emulate or not is a choice of
> >>> the
> >> software.
> >>> Do you agree?
> >> The device emulator does not know anything about whether trapped or
> not.
> >> Trapping and Emulation is a hypervisor thing.
> >>
> >> If here "software" refers to the device emulator, then Yes, it is not
> >> the emulator's decision. And the device should not be aware of
> >> VM_EXIT & VM_ENTRY.
> >>
> > Right. So a software wants to implement device_status as pure MMIO
> writes. (and not VM_EXIT).
> This is not always true, there can be VM_EXIT of pure emulated devices.=
=A0=20
I am not denying that VM_EXIT can/cannot be there.
I am saying, the proposal forces VM_EXIT based approach in my understanding=
 of this patch.
If that is not true, may be can you please explain how this can be implemen=
ted without VM_EXIT?

We should have an interface that can be done with and without VM_EXIT metho=
d at least for any new additions.

> The
> HW registers are sensitive resource and any access to them need to be tra=
pped
> and emulated.
This does not apply to PCI PFs and VFs which are HW devices (mainly PFs).
so this trap + emulation is narrow view that we better avoid.

If you think this is the way forward, you should put forward in patch as MU=
ST requirement.
and that does not look right to me.
I hope you also don't mean to force this method to device implementations.
Right?

> > And prefer to returning SUSPEND=3Dtrue at slow pace.
> > This means, the device implementation cannot immediately return
> suspend=3Dtrue right after it was written.
> > A MMIO read will read it back, as suspend=3Dtrue.
> >
> > An alternative would be, to forward CPU loads and CPU stores to differe=
nt
> address.
> > However, this does not work for the hw based devices.
> >
> > That means, PCI HW needs to return suspend=3D0, until the device is not
> suspended.
> > In this example, the device cannot build special circuitry to answer
> suspend=3Dtrue within 50nsec, or in other words building special circuitr=
y to
> return suspend=3Dfalse is too complex for the slow operation.
> why? The device can just not to change the value of the SUSPEND bit befor=
e it
> has fully suspended.
When driver wrote, it wrote suspend=3Dtrue,
And device returns suspend=3Dfalse while suspend is ongoing, right?
If yes, this is expensive because the device needs to operate within 50nsec=
 or less to answer suspend=3Dfalse.

And even worst, it needs to suspend=3Dtrue when unsuspending within 50nsec =
when resuming is ongoing.

> >
> > If this understanding of burden is clear,
> >
> > The proposal is, can you please extend the interface such that,
> >
> > 1. driver writes suspend command.
> > 2. driver reads suspend_status, and receives not_completed=3D(false). T=
his is
> the default value.
> > 3. When the device completes suspend, it changes the polarity of
> suspend_status=3Dtrue.
> >
> > This has two main benefits:
> > [A] This will enable software-based devices to write data to slow files=
 and
> does not have to force VM_EXITs.
> >
> > [B] It also enables hw based devices to not build special circuitry to =
answer
> within 50nsec, which can get very complicated for tens or hundreds of PCI
> PFs.
> I think we have already discussed on this before in V5, and Jason has som=
e
> insightful comments
>=20
Unfortunately, not. His comment was that it is not specific to suspend.
But here we are introducing a new interface and functionality that does not=
 need to suffer or follow anything that may not be efficient.

> https://lore.kernel.org/virtio-comment/20240612082055-mutt-send-email-mst=
@kernel.org/T/#mc817fc6ca12ff0bcbae62b43b6146a177ecf13a9

> >
> >> this is out of the spec anyway.
> >>
> >> Thanks
> >> Zhu Lingshan
> >>>
> >>>> Thanks
> >>>> Zhu Lingshan
> >>>>>> +\devicenormative{\subsection}{Device Suspend}{General
> >>>>>> +Initialization And Device Operation / Device Suspend}
> >>>>>> +
> >>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
> >>>>>> VIRTIO_F_SUSPEND is not negotiated.
> >>>>>> +
> >>>>>> +The device MUST ignore all access to its Configuration Space
> >>>>>> +while suspended, except for \field{device status} if it is part
> >>>>>> +of the Configuration
> >>>>>> Space.
> >>>>>> +
> >>>>>> +A device MUST NOT send any notifications for any virtqeuues,
> >>>>>> +access any virtqueues, or modify any fields in its Configuration
> >>>>>> +Space while suspended.
> >>>>>> +
> >>>>>> +If changes occur in the Configuration Space while the SUSPEND
> >>>>>> +bit is set, the device MUST NOT send any configuration change
> >> notifications.
> >>>>>> +Instead, the device MUST send the notification after the SUSPEND
> >>>>>> +bit has
> >>>>>> been cleared.
> >>>>>> +
> >>>>>> +When the driver sets SUSPEND, the device MUST either suspend
> >>>>>> +itself or set
> >>>>>> DEVICE_NEEDS_RESET if failed to suspend.
> >>>>>> +
> >>>>>> +If SUSPEND is set in \field{device status}, when the driver
> >>>>>> +clears SUSPEND, the device MUST either resume normal operation
> >>>>>> +or set
> >>>>>> DEVICE_NEEDS_RESET.
> >>>>>> +
> >>>>>> +When the driver sets SUSPEND,
> >>>>>> +the device SHOULD perform the following actions before
> >>>>>> +presenting that
> >>>>>> the SUSPEND bit is set to 1 in the \field{device status}:
> >>>>>> +
> >>>>>> +\begin{itemize}
> >>>>>> +\item Stop processing more buffers of any virtqueues \item Wait
> >>>>>> +until all buffers that are being processed have been used.
> >>>>>> +\item Send used buffer notifications to the driver.
> >>>>>> +\end{itemize}
> >>>>>> +
> >>>>>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
> >>>>>> Options}
> >>>>>>
> >>>>>>  Virtio can use various different buses, thus the standard is
> >>>>>> split @@ -872,6
> >>>>>> +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> >>>>>> +Feature
> >>>>>> Bits}
> >>>>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device /
> >>>>>> Feature Bits} for
> >>>>>>  	handling features reserved for future use.
> >>>>>>
> >>>>>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the
> >>>>>> + driver
> >> can
> >>>>>> +   trigger suspending the device via the SUSPEND flag
> >>>>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Stat=
us Field}.
> >>>>>> +
> >>>>>>  \end{description}
> >>>>>>
> >>>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved
> >>>>>> Feature Bits}
> >>>>>> --
> >>>>>> 2.45.2
> >>>>>>

