Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7CF35970
	for <virtio-comment@lists.linux.dev>; Wed, 11 Jun 2025 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749653627; cv=fail; b=H0TEkkK+mmwP133GYgspqA+FzGwJP4Nibu2I0fYFIQK88eplyEHOvEIVkPaMbAReNK1PmF3m+khQaKhn+xALu7yS76AdvUF8K2wrXgA88dLx+LrloQ7WPgimCXrvHknLX9Y9c4eqYEj3GBBj2JT3yLhBbh9FCh84XldazzDx8YM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749653627; c=relaxed/simple;
	bh=aUbhf7576ryND9dAgn9ldhYwb+47ebfy0Aw6Tq90uHs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bloLrKauF2QI05E8szcxvq5/rpuTyZGcs18Ab/EgmMiDQ3N3fj2iSLBhtvH466Z5efZ0oNRzQa5W99tGknFSoFK/jXI9Cbz/cF9P7FrazsikZO2HAG8UCpHeZ9lY7FQXpv8O/mJKf1d+qlii3FqZDge45cGytWl9uKNRnf8ffPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oCyHmqw5; arc=fail smtp.client-ip=40.107.223.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oCyHmqw5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9qVB9Pcy83dnRdktzcRL17+/CJrK3CnUyAj3YjIxDU4Ldsp8DMivJ2I6IQjnXgpfByij63x4L8+Zxnm/zHwT9KFFenJGAe8I7dl2G4M3WRe5yZNR8HpgmSMBad/vcfv0VpiB7mT58wfFfLGCEN/HNnlqb/PEoZKXqfDrf2EJS03s6zzq3vmEQXb4vymx67d3CmSFgafO7+paCAVr7qSNj/6mXY0rP7VcntmqEyUqSqF6pb5J3Gy3Z9KVbTFhsHBDYUJeoyfKztJr/PQkPZ3GZNfT9vjZYntEg/UyJ5PMj4rvauMKvY5B32Gxq9Ba0meG5COVXqh4XjYrQXg/9K9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUbhf7576ryND9dAgn9ldhYwb+47ebfy0Aw6Tq90uHs=;
 b=GpLQ2QE6XDKYyA9N0GSOm4yLpcR7JSRhkd0gzgKr15UafNzmrFwqRXbB7afP/jt+ng/3Ljwrv7kRszG4YoUn8Lj8d4mGTzWCIiWjLpnaZGk8xzmQEbsoRus7Ss7NpZsIT3qk6vJLSdXpCohJ3dxvTIakJOC9ipgWdt/WckYnwo+8RSgaU46dRP0lDeBPtXaRTaVUW3WShXvYG+GY0s82QxJLNKXtk7LETqAh30A8g9Kt2UWnPdTzKOueK9XsCkabb1bmdnx/T01TqXYvdezrRMGqn6kUkGX48LN7BZyvYbfz+ze9/sF0sXp2i3eqfdR1fbL01pPs0z6E9+F9S+dBzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUbhf7576ryND9dAgn9ldhYwb+47ebfy0Aw6Tq90uHs=;
 b=oCyHmqw5OL5oV9KtC+sF15iUbhyAJbhXwdpmj1c/TlSmfo/L9sPGhM3O2m5PdpNbSREVE2p37r1ZTXBlRS7qBge9tHWn6qxq9VlhIb00R+zjaoHIGgjBUjx8nvG8juWHmY4pi4HdyZ+D17TDYIgIV/kWoRFHNomuXsFo5W8O+9luhKsNc1r3ML4GwEmJ1nUFRP8f0tKJRHVPPupXSGVrwUZV1sHXVVN1wQlLghcPBno0WE2zfxK17Q9F9c/ZAevtnsdfJ790MTemfo0z398C7C/5YeZ9nez2tnqXIR10WqiRG9I3iUtHvPOxjMyDgnaauAE8/7YSEk/PfQrWHrKTLg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SN7PR12MB6957.namprd12.prod.outlook.com (2603:10b6:806:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Wed, 11 Jun
 2025 14:53:41 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%5]) with mapi id 15.20.8792.033; Wed, 11 Jun 2025
 14:53:41 +0000
From: Parav Pandit <parav@nvidia.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
CC: "fupan.lfp@antgroup.com" <fupan.lfp@antgroup.com>, "mst@redhat.com"
	<mst@redhat.com>, "niuxuewei.nxw@antgroup.com" <niuxuewei.nxw@antgroup.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Topic: [PATCH v7] virtio-vsock: Add support for multi devices
Thread-Index: AQHbq7cy7Mcj3ywZwU+rYtE4WxELUrPZJsIAgADFHgCAJH1aAIAAAE1g
Date: Wed, 11 Jun 2025 14:53:41 +0000
Message-ID:
 <CY8PR12MB71959B28D8104F8CF8A916FEDC75A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250519093736.3076953-1-niuxuewei.nxw@antgroup.com>
 <20250611145136.869465-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250611145136.869465-1-niuxuewei.nxw@antgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SN7PR12MB6957:EE_
x-ms-office365-filtering-correlation-id: 84dbe7db-1d44-440e-b0ec-08dda8f7c1a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dwRwoHdEhDV/uiYivlj+LkvlrJ7QQhOypdYpZCpdoEwoBgTDr8E8D2MscLxt?=
 =?us-ascii?Q?NgsQ4NrJJz9k1/xPRZ++xPxVytCKxSJCdpW+LgZrwUMn+eI25Th9nzV5/Vrm?=
 =?us-ascii?Q?a9eRbSjObM4lszrgYpzu0XAu4Kq0iYvbQLc4j2sxE9hBsLzBwOTPMObWGYWM?=
 =?us-ascii?Q?elpua4RO/CRz5ntuYNjscBsT4VybHAPhutPk8006oApl55hOwxO2IVboEcMx?=
 =?us-ascii?Q?kCZJcLmL7xymY7CU08NBRi8dLAqPo1nEx4ncDFL5xLh7YO2UPX8/br3zax+R?=
 =?us-ascii?Q?MrWxFgbpPZSWtU7kaSODd2764Wpv5iWuUnRmFfdm9KV/pFNlM7hFJ0xMPoJ5?=
 =?us-ascii?Q?gIHD59olZiM3px8TM4x0efrvb4oLzYSizswVKUEZza8b5HI12qudkos/4rsC?=
 =?us-ascii?Q?morqFkbYScmYFrMmcJkavcAk5CQq0lQGNHBS2WSLx3g47X2jgbkS6RroAvva?=
 =?us-ascii?Q?YQQS7npkyQ3NbSeuk/iZYhzKDy7ATJzN6uVsKHm641zUZDOIM+PjNqZa0nGk?=
 =?us-ascii?Q?AfD9amqK2qHp3QdOQC1WmRueTBPcN/KmhYT/UEnqPmBI0n/TTdR1c8rfvX2p?=
 =?us-ascii?Q?sxTDDBU5TUcb3q0hIIKWsiPRTdCa8t7/Xy3XBdOZfkM0YeUCaqZu7zanoegN?=
 =?us-ascii?Q?I31NYBmvXq3zVyB2TL0T7xbMDfZvVnsOhomk5N2UICFYXI6DsxE9ufZr332s?=
 =?us-ascii?Q?YpDxHgfhB9YEtVj/QYpgm9KhfPaPG8NsaghQ4mblQ2n30qPwq1LH5CXrOH/3?=
 =?us-ascii?Q?EPs9fMA9fU+A4ZSXz2841m4Wy/XJNwVe7IZF60dERGglVI8K05OYscWfFxob?=
 =?us-ascii?Q?vv8Q8tPAgp78ruN4dhIsBCaWnoItztKGLGg9aNFdP8S9kpXLogtNch6VDIsW?=
 =?us-ascii?Q?YgKIdCHBUvB5ymH3xoeL/RBjDwMvylB19uvAjGkJQyGa9DXF5artMbWRtwpB?=
 =?us-ascii?Q?CZ96ELczND5t2MacZ9bJx1jpVfPH1TugVmt/Ub/Iv7gGVibh/Z2P8dQBwgrB?=
 =?us-ascii?Q?5va9GH8NK104GFvd2ioBS4AVncaiD0wMmUybBaMe0HTEFfqCaho7tu6hEG5G?=
 =?us-ascii?Q?BLWGHM1vZBfx5QUsVl46QgZtj1lXfJVEdM7wxo6WZwQCivUMfe86n87mDdny?=
 =?us-ascii?Q?5o4iMJFXCos0uYDd5ZIBaMTxC0+Uula/islr4TlMEnXWlvTulw3fs2D9cnaP?=
 =?us-ascii?Q?+obXjfWtCotcpCHLzxB4t/sRxMyrljjMAR6n3LyezP+1PsMwOlXBaQzHY2eb?=
 =?us-ascii?Q?Mcke9ZJ4d0xkRczFwKVGY6H5uQk4eYyIDwyh2EIVMndEZPrwKHFEgmmGBnJE?=
 =?us-ascii?Q?bR7Rg1tZ/aLj6EukFVLh9s5xjaM06LLbFx7UNjGTqpD9JH9dDku+5rvmRpfd?=
 =?us-ascii?Q?FEm+bV763rDl+LjIE6aD29pkMfUIxS215wDncJXkGF+u5cKXcOAIH5hEhdJy?=
 =?us-ascii?Q?ANr/zeakLJ3/S07sXDERwXD0TDQgIk3gD9muNy8R/V7sfG6ywy0sEcv5qVjq?=
 =?us-ascii?Q?1Alg9NUo4A4N8N4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?btj7TSGKcQoY0kefwow6aCZnBeTiZW6vgBWqlylDqUxs6UHrJrxqkwNuaAB/?=
 =?us-ascii?Q?z2FAaX4dFaYlLG2r2dGDGDBbeUG37HDeMV0lVq/+71aXMggqiG6NA74ut6m7?=
 =?us-ascii?Q?6KRqe+NVMhtGAbJcfmCjk963H2WonIGpz5wy3ChCgpPP08GozJAfU+tD8Ub1?=
 =?us-ascii?Q?2KPlqjIKhDpAda7HqvqO8fSqLpW5fkK+h6cexYXw8WVTK+pkIAgTnZeTT2q0?=
 =?us-ascii?Q?HnjQluUT5nwrwHUk7qEn/vH3gv8zBoup5wEp36siKoNJU43Z9zVos+v3zc/E?=
 =?us-ascii?Q?Yugx/Sq3asTi+xjt9V7pWbuXwzjH+bmPcFA7At/g849Pv1CiGEEZq4i/Vdr0?=
 =?us-ascii?Q?BdCzbVmtGErxS8hQfwafd4AjbUv79E66+d/w0cuRpfTdCznH9NRzCpeKTt/Z?=
 =?us-ascii?Q?bghKVYvFfBo/swV04UwmmjJ9SigGrm0kTFI6obX5KQEicZXXxcKViuI+2Ipj?=
 =?us-ascii?Q?yGYr85U6ZpVljza5OQtTZsMO7gOWKYL/nbylRZLwEv5dk/djvyBfHu8P+n5g?=
 =?us-ascii?Q?/mOHshEp3M4gOr2HJyQ2BBKr8bu0Bar6pjX+jcjDGNgcxRO9cjkbHJQorW8H?=
 =?us-ascii?Q?tutxGVAU+JZjxlQ8ac8IJdETK/XxxRcWeH3jaSOk+/TUdfyh5f0zJj4kE88V?=
 =?us-ascii?Q?8Uu/EVlLjnE2MrVZ7sGxsgQheBM6T5QjJMBmEEwxNBq6SpcY2/BU7+WTsIi4?=
 =?us-ascii?Q?FjJpa6RkRTzHeoEm7dQIr57J+oy84NTJCqVl5CgrvnCgSd/YXHiZierBq3vs?=
 =?us-ascii?Q?Hk+NJrhr2H3CpxMv1msTCT/hCXAIcliEUH08J5LVETfFCEE2PjQxnUQ1X4OV?=
 =?us-ascii?Q?suZJkoiSQw39GU5dGw1FveKlQYjcpy/JcOl7LwZpvnGIZ8DRVW2w/DcSWR5r?=
 =?us-ascii?Q?9HHyw5acnSwYEV1dJVeipwP6sVKMsUq6bNJhIbMeXJm7aFAgowwi4OO0kbyQ?=
 =?us-ascii?Q?d5NksGFvSGj9TmruQdKNp4IzHrOYk/cIkqrRtgH8Ic3Nnnvo08pE71mJ3lj/?=
 =?us-ascii?Q?/Z0qiRP9tnhv+XuRZMaFkeEPY0pajqhaUON+FM5TIVECe2reggcMi0aMusAE?=
 =?us-ascii?Q?6GR0URcjI9/hnkc9065Ibz3UR/4XBY9bT9A64N7v1gJXdB6Ebh1QGElQepF2?=
 =?us-ascii?Q?b+7JwHUh7vJDgzgbFY/yv5anTPTM3oD1p6ggM0MnCY8SSqNIX7slse4olK4A?=
 =?us-ascii?Q?cKfYbq8r14EP8jDll8Dqa/KmXX4Eg9+Bpx8LcQfTu2KRDOdaQb4K9JRRXVgC?=
 =?us-ascii?Q?/rTjWZcTOidxBzwfGlHkgMDwQO2CnYOl6S54DvfFhmKyIBawSgkEVk0vRkIt?=
 =?us-ascii?Q?5RwOq8EdfPXInCj5XBAS+Nd5zUaFkE5OowY5frlsgsU/VieywXKS7Jsl1wh5?=
 =?us-ascii?Q?TMUIDhqIaoD4ndLa15bgoyGeg0E94HOLcPe1Ii0vKMOR+q1UGJkvYSj2774V?=
 =?us-ascii?Q?5hiGJ+niBMxO7DTmghvwRc9k3WDmCvwdTxRyE6XKTHrJK3xpVTaqW+f90j6m?=
 =?us-ascii?Q?NOC/Alw16Vep60PolCteftb0XIg8oUREp0towthmbpK3DRfleAI+aIs5P9ud?=
 =?us-ascii?Q?+XYOoOVKOOaKpmNm27s=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 84dbe7db-1d44-440e-b0ec-08dda8f7c1a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 14:53:41.5556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vvmYJ2F/VANT4JuODjGnchskkv0y/v1M8NaNgcCLhVScnIW1cZtn+SaVEwfY/Uoc6x22vgg6Za4IHkvY1c4Ghg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6957


> From: Xuewei Niu <niuxuewei97@gmail.com>
> Sent: Wednesday, June 11, 2025 8:22 PM
>=20
> Hi, Michael and Stefano,
>=20
> No comments since last month. Does this patch look good to you?
>=20
> Thanks,
> Xuewei

I missed to review v7 as was off-on working during your v7 posting.
Will review before 14th Jun.

Parav
