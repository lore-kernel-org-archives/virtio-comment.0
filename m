Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB5137B
	for <virtio-comment@lists.linux.dev>; Fri, 30 Aug 2024 03:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724986975; cv=fail; b=ZntXfQ50Fs7lkMok/xvWJr1kGBIiCaQHP/6n8SHe3FRdlKMAQjjJlh6WIgHRFMvR9U32gQSPzFoTxJMPtk1WnTr57R9OLdR/J5L21osLPGQH5mYsYY1FKO0+DE8/NEiRQUjPG/WRN86JVvTb+HyLYOu7bfPgsn4jkMTcNNtL8ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724986975; c=relaxed/simple;
	bh=ljWM7cl3EEvCkHNejDYcSapW+y4WYoHkKvy+s0bCiaA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IRtp0dMQ9Mh2NUvjmnxgueaDgIsmygcNJG7lpRbgosI4tyDTdPGaysgcC8k8Iv7lzZh7ZTmxKlVqnePHCJqYmtxMIz6yTRyAfZXsXBjvJveGNGLoMQjKObC9HvwSReRaKPNmPxBj0ql0vRifW4rMsVqUiT5zXkuCHipn3D0FXec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sQWQJbzo; arc=fail smtp.client-ip=40.107.244.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sQWQJbzo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVO31zkRmbYf9EiLzKvFSPzoXih0esRlcM/8wSWfwgrQVduCMFGQOyFlILvXSh1t5dJyBOR7Xjxnnpd88UwRR2TjmfwJOJ34wKw8qMRtCJbwVL0ZfoDnq/1/mL9ww8QsQCJnMjTgLDUO2Hv/MCdCdBxd5Vd2DWO7psyb1dDkvlKShuEYacs9ETP/Vq4UfXWHcqt5IL3nnwszhCuOCoWE3DaZOHbGv1jvrcO+2+D7lor0V6dx2Tz84KNjez1uHafa0tj5zFVqo/VOkrd9RR9x8eOGcjVZ4hoREQHqCOiKW2zdfNVvbh4fzytwCWEiMFIchoFYkOikYRbFXGk7PbguDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EP+X0q6Zfrfi6wETloIx9z9rC+L3E5lKB/fM5jif5X8=;
 b=csaHw5f55hCQiY0MPhUjHbn9OyW9HYUjzqe9BDXN9h5pG556zIG9XPUYvBa1xlDGRzHMkAKOOIcVoOMmYLL1D1CRoyD7PSTeoBy+Dz2Wb1wOlRrLFerkn0x6RjNUVrQrlWOj0ZHs5tGMFkxLzfnMKHJjh4UBsfsT7IbWgvdA6rR1TwFeW972CaYztfLjuvlUIm26/y+GGFVF8j8q4N6bD868LuTpI0hVHRy3/4Kw8CTYlD877UPKBixrSLcozTT1b+9F/wwflT3gifCIfnuHxJVwf+ORFGG3BqiNUnV/8H2wHDzFIzz9thgPLwMMefWMgHXFnBBoVsqqQP0GTDjZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EP+X0q6Zfrfi6wETloIx9z9rC+L3E5lKB/fM5jif5X8=;
 b=sQWQJbzoq9UNdLUfZ5rWDZpyNAJ9xQgPcItRxKKW0m0px2dtU63Wnz3PsCmVJtpyCfuzHf/DzYKd0kfbyVl+vfNLn3WPvLK2UJYc3KIcz1KvRyj1Ckf8kc1cOJCQ4UzeRwgCmtejks4E7p3/Vq8lEh6u3bKelV2fEQTskvHoCv8WX/zp5Wb/m504bptGZ6KKZbbyg9OR7ohjDmhkd1GmZoZQl+ecdbXnwZfOLzNMDDh5gpKWMldpKCOr3UXCnJB5QIpyCNcjUWIjQcCH/+eFicdscD83AOEvIt6G1nYSzZ7rjmGY0DAUakF8dVnhbkaddtD4gvSfdhy9Gyo/HIoWWQ==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by MW4PR12MB7191.namprd12.prod.outlook.com (2603:10b6:303:22d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 03:02:49 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 03:02:49 +0000
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
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA0LrAIAAAIWAgBcwMgCAAAT60A==
Date: Fri, 30 Aug 2024 03:02:48 +0000
Message-ID:
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
In-Reply-To: <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|MW4PR12MB7191:EE_
x-ms-office365-filtering-correlation-id: 3028be9e-b581-423d-2b1a-08dcc8a03b03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?OC7fwNmX3ymMc3jw33hMrirjoiMHJgzVHn5LTLtzAz6FXB/YGOSReNxtDb?=
 =?iso-8859-1?Q?JSIuZLdvdF7m5n4w3Lb20nPaouOnhwtJjR7kzeZgWDeWmI8lwjPbskHOhJ?=
 =?iso-8859-1?Q?ZGkCAzrKhnnW8uevam9gr/+ECtVFH8qSqvV2LMhP1BPBctZ6qIYf2a+dP9?=
 =?iso-8859-1?Q?iPTbovKY0KeJeniKUnp/jzj0wSgwS7OpVgEmCYmBetLyTqZaAVasIMl206?=
 =?iso-8859-1?Q?o5+C79TkMJy9c+YJ2gzS7IaQ/RhjKuGdi1G2gLWzh0GxGOIujM+lK0hGVA?=
 =?iso-8859-1?Q?2WYDLecWTLFry3N0W1lYWzA4RJ2gsqUwVSoP5owAt5TD/fOhkNCeS1n8j+?=
 =?iso-8859-1?Q?jKE2vwh0O0uEKR0kmc9O3gZ98sepScvPier4eQ/t323K67oHWlf5rbwki9?=
 =?iso-8859-1?Q?+gy+fvGfAhRdXsbkkisW8oLJv4qqPLDhPZ8l2HBjrZc916hcRnHj1bv+0c?=
 =?iso-8859-1?Q?EAFz1rDO9DpSjtHQ5fEuLkXdT/XPapEOshzx3JtQpgslPUdEXhXWSYmdUw?=
 =?iso-8859-1?Q?KcxjpOeziyzMeYOptKHPguhBjzd2u5J2G3FfARPNvCS+2YFP8fKCW6wYQk?=
 =?iso-8859-1?Q?Zv8Z1HRHNu1ZoUuFdgPluQBy6zMq5I+8ccWMJrfBiSIPAMEUlk2wl1vE41?=
 =?iso-8859-1?Q?nI17xXTbBdnxaxy/HcfYUvPf28R3RXb77kBxzubTu5ge8/gcE38VIgUt7H?=
 =?iso-8859-1?Q?mzLIoOkpkBvO3uBBkG80B5bRfXMo+4ZrgHRbOM1YZZHjKMqM2L56QRiEaP?=
 =?iso-8859-1?Q?R4hwAlYUrjk2FXG1wrLfwX8POzmYO4q+UJR3H2k3ibTLc2hthobzzwMFdd?=
 =?iso-8859-1?Q?ODzS+PQFytfK5MMIYestXmqb66ixUkHEDIEwcp3CoBZ3NZiNwfYdplYo6D?=
 =?iso-8859-1?Q?jO1Qat3xtsAbXc9OBMTIr5rIK8FpR9v4xY3kns/Bu/p1EWN/4++BXe3qLh?=
 =?iso-8859-1?Q?t1PI84hxPlI2jEX+2EiwQEKc+c91saPZ6lJQ1FKZ3YzUS54q3MjG1+zlym?=
 =?iso-8859-1?Q?oAuxU5CQmNdzs8pTbgv7+KVD98fQFqYzytnhF7O1KMK4h0YRgPDjPzC+kQ?=
 =?iso-8859-1?Q?xssYF/imluNEwbF4koiMy6cWETrKSb11Qr7PcfhZWKpS4SEzijptsEUHSy?=
 =?iso-8859-1?Q?PUDZzFHVsoRxv4/2cYSmbRGP6qjyGov2qvKJ6oQOTOcw3VIMlQIW8vjtT/?=
 =?iso-8859-1?Q?s0ernIAYN2mSK/YNEpkRcNVZIfu4kibHPrXvSa/BsSc9iMCOkjdhPEGFwJ?=
 =?iso-8859-1?Q?9DNj436/QPa/HOT3/N3GjVFvJ3A0dHKhsk16pZ3kxy//ixBULZe2gXkqJn?=
 =?iso-8859-1?Q?LHuOMfya1tEHLhNd8KW1WTJvti4S8S1QRuCcelt/43eVSfXG8k5atSXPN7?=
 =?iso-8859-1?Q?gkUcDLYc9He3KEGVqlIUplL0GfOpwjRExs3KQxIn7r0DFTqLB4/qo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gIirm9Zylsja6koCU1w3OXTPCMJlZSXbLRvREFuZmBshKIzSpfNdZmfrFV?=
 =?iso-8859-1?Q?fz41dE7UQ3xRJc0JATlbOG5lXX3rLpGb7awykuKlMHWUVjmiIPhTHQ5jc3?=
 =?iso-8859-1?Q?ytGDz4+v03tcU42CyJCmXPuf6zP3F9CpuuIwdbxIiXM84N+5g1eUghztA2?=
 =?iso-8859-1?Q?IUvZ9q/i0ep6XraeO3wwEJwmelepU95IVGaqXHbXnvAQanKfX6FDpiAP/W?=
 =?iso-8859-1?Q?zHvCXyRDKNR9v29139rGGfavPP15wiYi9CLJHHST87Lq/GZIByff/D2TKw?=
 =?iso-8859-1?Q?mf3ZxJLJ8CYzD+4Ryiim2yHJBiTNUL5hmxQEZJ6wVPiD671bR3sXgUKdOv?=
 =?iso-8859-1?Q?fcpxrVr0axODRdHdvsiYfV8YTdWHO+EiVmoGT+KhBA2b4e6WGAT+EUGAa4?=
 =?iso-8859-1?Q?HWVvbK8y1ngxauPL3mYdE5MXHko+yrMw0lyJfY6J+GOTtgF4f0D7JVXn/7?=
 =?iso-8859-1?Q?q2uiTdls/ZCaS6e5i5Y7hQNktV6eOHNoqazGwz/HrgdqQZx8/SVcIdmMnw?=
 =?iso-8859-1?Q?2XPiQVONH+6r9R+giWv7Ji7wbkqZV6QK/+lpzUtnfWCsBjYx3cu16F4IFc?=
 =?iso-8859-1?Q?XZG7NUL1un137Cev0wSPT/KFcqjB+CRo1QGPHpaqJ3tunyCHYChC5eLMFW?=
 =?iso-8859-1?Q?j+aQun6ZWJn8KgxIldM9Cd5MefqbbC/vOLXmkYWQZI7YH4Sq1WbUUJJ+WG?=
 =?iso-8859-1?Q?yZj49Tu4hXaAPuW/D7eE7rus+r9NHLifZfadYxDjfCxeTFCaMX6dS5oO4G?=
 =?iso-8859-1?Q?j/W6VEMxnnv3H4rwO/SsCdW8hdsm5VVmwB+E/5eD2muc/cW6HuA9dZfSzR?=
 =?iso-8859-1?Q?WXngDpjs8QrYhyfiLNvQoElka1rI3G6Q3pzQlxrW07pUZEdstysWaYCKVq?=
 =?iso-8859-1?Q?RfY1Lk4SPsbRkVDqvv+2mD8LkhqAZT6tNm2hIt8jJt+1Og77ib+UHgeh1n?=
 =?iso-8859-1?Q?4VnrBvkwqeMfHXD40zf/tKdW1h14LufX4CXutxrJFYS53tj7plcjQqRn6t?=
 =?iso-8859-1?Q?TLPksDc+8fsYochXI7Wz/WJY4JA0L7UVejhDE31mzmSTB3sK9fI01mfvCn?=
 =?iso-8859-1?Q?jvigDRx9eWT3GYP2kgTCoSfJ/XZpJ9Ik7iLSX3jDhZajTNwrXhHU4LJE1C?=
 =?iso-8859-1?Q?h7ELXAEAKjLZ9jzm/59VXIBo4QBAC/1nOMBi09V7wOk/3ctC0m6qubFaT5?=
 =?iso-8859-1?Q?B4DXIDsgdcNwgL/gpLOGuBYhv5dslQSXboJNCOo96qtNwtxDUjFaVKZu2e?=
 =?iso-8859-1?Q?647q00uAnGTyG+2P0cMF5+jBx1HW2cee8HjY07Zy7MfAj7s/+OATTKHW5m?=
 =?iso-8859-1?Q?gRbPXKEAwCLD0l7OfzB1w0OWL4Fffo+amrXEafGFt2775KyZ3G9RW9SGg/?=
 =?iso-8859-1?Q?/M8p6dpaFSK7Akg6imSm/4cb1C03bcq+xIEmbashbZFBTTJHb7SOJerwJh?=
 =?iso-8859-1?Q?9qI8NsqPpVCC8zEOHsSEUEZjyuskYFJq603oaaRolazajleEsLe66AAWWf?=
 =?iso-8859-1?Q?GCReZUAMG4SwPm0knVxfC8arAfL8RQrnE7nwVmuA0N4J1X09tGIINgIE3N?=
 =?iso-8859-1?Q?MPwnFEY8vvCD6EAw5nekw8yie9Xlq0NW2YRKbpFjzFAIGdlFfnj82BYU0m?=
 =?iso-8859-1?Q?7zbj6jY023j/Q=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3028be9e-b581-423d-2b1a-08dcc8a03b03
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 03:02:48.9738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rOjFKb7GoR0vBnkf8M9E82XUeoZQsgQW+tx4GBv54B5BNeKnD+BSt+4TUbV/4mzpcp73Q8Y5akpho9Jn2HrGqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7191



> From: Zhu Lingshan <lingshan.zhu@amd.com>
> Sent: Friday, August 30, 2024 8:02 AM
>=20
> On 8/15/2024 5:34 PM, Parav Pandit wrote:
> >> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Sent: Thursday, August 15, 2024 1:53 PM
> >>
> >> On 8/13/2024 2:55 PM, Parav Pandit wrote:
> >>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>> Sent: Tuesday, August 13, 2024 11:44 AM
> >>>>
> >>> I removed the unreachable intel email id as every single email is
> >>> bouncing
> >> from it.
> >>> Please consider dropping that email from v8 as it will cause all
> >>> reviewers
> >> email to bounce.
> >>>> On 8/13/2024 1:50 PM, Parav Pandit wrote:
> >>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>> Sent: Tuesday, August 13, 2024 11:15 AM
> >>>>>>
> >>>>>> On 8/13/2024 12:42 PM, Parav Pandit wrote:
> >>>>>>> Hi Lingshan, David,
> >>>>>>>
> >>>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>>>> Sent: Thursday, August 1, 2024 5:05 PM
> >>>>>>>>
> >>>>>>>> This commit allows the driver to suspend the device by
> >>>>>>>> introducing a new status bit SUSPEND in device_status.
> >>>>>>>>
> >>>>>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
> >>>>>>>> which indicating whether the device support SUSPEND.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> >>>>>>>> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> >>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
> >>>>>>>> ---
> >>>>>>>>  content.tex | 75
> >>>> ++++++++++++++++++++++++++++++++++++++++++++++-
> >>>>>> ----
> >>>>>>>> --
> >>>>>>>>  1 file changed, 65 insertions(+), 10 deletions(-)
> >>>>>>>>
> >>>>>>>> Changes from V6:
> >>>>>>>> - the device should hold its config interrupt while SUSPEND,
> >>>>>>>> and send config interrupt when the SUSPEND bit is cleared.
> >>>>>>>> - while SUSPEND, the driver MUST NOT access Device
> >>>>>>>> Configuration Space
> >>>>>>>> - minor changes.
> >>>>>>>>
> >>>>>>>> Changes from V5:
> >>>>>>>> - the device should present NEEDS_RESET if failed to suspend
> >>>>>>>> - allow the driver access device status in the config space when
> >>>>>>>>   suspended if it is implemented in config space.
> >>>>>>>> - language improvements
> >>>>>>>>
> >>>>>>>> Changes from V4:
> >>>>>>>> - re-order the device status bits section
> >>>>>>>> - kick vqs --> notify vqs
> >>>>>>>>
> >>>>>>>> Changes from V3:
> >>>>>>>> - allow the driver clearing the SUSPEND bit to resume the device=
.
> >>>>>>>> - disallow access to config space while suspended.
> >>>>>>>>
> >>>>>>>> diff --git a/content.tex b/content.tex index 0a62dce..2d1bee8
> >>>>>>>> 100644
> >>>>>>>> --- a/content.tex
> >>>>>>>> +++ b/content.tex
> >>>>>>>> @@ -36,19 +36,22 @@ \section{\field{Device Status}
> >>>>>>>> Field}\label{sec:Basic Facilities of a Virtio Dev
> >>>>>>>>      this bit.  For example, under Linux, drivers can be loadabl=
e
> modules.
> >>>>>>>>    \end{note}
> >>>>>>>>
> >>>>>>>> -\item[FAILED (128)] Indicates that something went wrong in the
> >>>>>>>> guest,
> >>>>>>>> -  and it has given up on the device. This could be an internal
> >>>>>>>> -  error, or the driver didn't like the device for some reason,
> >>>>>>>> or
> >>>>>>>> -  even a fatal error during device operation.
> >>>>>>>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and
> >>>>>>>> +ready to
> >>>>>>>> +  drive the device.
> >>>>>>>>
> >>>>>>>>  \item[FEATURES_OK (8)] Indicates that the driver has
> >>>>>>>> acknowledged all
> >>>>>> the
> >>>>>>>>    features it understands, and feature negotiation is complete.
> >>>>>>>>
> >>>>>>>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and
> >>>>>>>> ready to
> >>>>>>>> -  drive the device.
> >>>>>>>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated,
> >>>> indicates
> >>>>>>>> +that the
> >>>>>>>> +  device has been suspended by the driver.
> >>>>>>>>
> >>>>>>>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has
> >>>>>> experienced
> >>>>>>>>    an error from which it can't recover.
> >>>>>>>> +
> >>>>>>>> +\item[FAILED (128)] Indicates that something went wrong in the
> >>>>>>>> +guest,
> >>>>>>>> +  and it has given up on the device. This could be an internal
> >>>>>>>> +  error, or the driver didn't like the device for some reason,
> >>>>>>>> +or
> >>>>>>>> +  even a fatal error during device operation.
> >>>>>>>>  \end{description}
> >>>>>>>>
> >>>>>>>>  The \field{device status} field starts out as 0, and is
> >>>>>>>> reinitialized to 0 by @@ -
> >>>>>>>> 60,8 +63,9 @@ \section{\field{Device Status}
> >>>>>>>> Field}\label{sec:Basic Facilities of a Virtio Dev
> >>>>>>>> initialization sequence specified in \ref{sec:General
> >>>>>>>> Initialization And Device Operation / Device
> >>>>>> Initialization}.
> >>>>>>>> -The driver MUST NOT clear a
> >>>>>>>> -\field{device status} bit.  If the driver sets the FAILED bit,
> >>>>>>>> +The driver MUST NOT clear a \field{device status} bit other
> >>>>>>>> +than SUSPEND except when setting \field{device status} to 0 as
> >>>>>>>> +a transport-specific way to initiate a reset. If the driver
> >>>>>>>> +sets the FAILED bit,
> >>>>>>>>  the driver MUST later reset the device before attempting to
> >>>>>>>> re-
> >>>> initialize.
> >>>>>>>>  The driver SHOULD NOT rely on completion of operations of a
> @@
> >>>>>>>> -99,10
> >>>>>>>> +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of
> >>>>>>>> +a Virtio Device
> >>>>>>>> / Feature B  \begin{description}
> >>>>>>>>  \item[0 to 23, and 50 to 127] Feature bits for the specific
> >>>>>>>> device type
> >>>>>>>>
> >>>>>>>> -\item[24 to 41] Feature bits reserved for extensions to the
> >>>>>>>> queue and
> >>>>>>>> +\item[24 to 42] Feature bits reserved for extensions to the
> >>>>>>>> +queue and
> >>>>>>>>    feature negotiation mechanisms
> >>>>>>>>
> >>>>>>>> -\item[42 to 49, and 128 and above] Feature bits reserved for
> >>>>>>>> future extensions.
> >>>>>>>> +\item[43 to 49, and 128 and above] Feature bits reserved for
> >>>>>>>> +future
> >>>>>>>> extensions.
> >>>>>>>>  \end{description}
> >>>>>>>>
> >>>>>>>>  \begin{note}
> >>>>>>>> @@ -629,6 +633,53 @@ \section{Device
> Cleanup}\label{sec:General
> >>>>>>>> Initialization And Device Operation /
> >>>>>>>>
> >>>>>>>>  Thus a driver MUST ensure a virtqueue isn't live (by device
> >>>>>>>> reset) before removing exposed buffers.
> >>>>>>>>
> >>>>>>>> +\section{Device Suspend}\label{sec:General Initialization And
> >>>>>>>> +Device Operation / Device Suspend}
> >>>>>>>> +
> >>>>>>>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
> >>>>>>>> +SUSPEND bit in \field{device status} to suspend a device, and
> >>>>>>>> +can clear the SUSPEND bit to resume a suspended device.
> >>>>>>>> +
> >>>>>>>> +\drivernormative{\subsection}{Device Suspend}{General
> >>>>>>>> +Initialization And Device Operation / Device Suspend}
> >>>>>>>> +
> >>>>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
> >>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
> >>>>>>>> +
> >>>>>>>> +Once the driver sets SUSPEND to \field{device status} of the
> device:
> >>>>>>>> +\begin{itemize}
> >>>>>>>> +\item The driver MUST re-read \field{device status} to verify
> >>>>>>>> +whether the
> >>>>>>>> SUSPEND bit is set.
> >>>>>>>> +\item The driver MUST NOT make any more buffers available to
> >>>>>>>> +the
> >>>>>> device.
> >>>>>>>> +\item The driver MUST NOT access any virtqueues or send
> >>>>>>>> +notifications for
> >>>>>>>> any virtqueues.
> >>>>>>>> +\item The driver MUST NOT access Device Configuration Space.
> >>>>>>>> +\end{itemize}
> >>>>>>>> +
> >>>>>> Hi Parva
> >>>>>>> Do we agree that
> >>>>>>> a. suspending a device is non frequent operation (in order of N
> >>>>>> operations/sec, where N is roughly in range of 10 or 100) per devi=
ce?
> >>>>>> Ideally it should not be often in normal operations, but remember
> >>>>>> we can not restrict the behaviors of the driver, so we must be
> >>>>>> able to handle the scenario in which SUSPENDING is often.
> >>>>> Sure. the intent is slow rate, but one can do at unexpected times.
> >>>>> Do you agree?
> >>>> I think we don't have an intention of the frequency in the spec.
> >>> Sure.
> >>>
> >>>> The spec only provides generic mechanisms and interfaces.
> >>> Sure.
> >>>
> >>>> Don't assume it(or driver wants it to be) would be often or not,
> >>>> that depends on the driver.
> >>> As you rightly said : it cannot be assumed.
> >>> The driver will read the device status right after it wrote it. This
> >>> typically is <
> >> 50nsec of time.
> >>> The suspend operation for a net device to store hundreds of queues,
> >>> RSS
> >> table, flow filters, takes plenty of time (at least more than 50nsec :=
) ).
> >>> Similarly for the GPU to store some MBs of memory takes more than
> >>> 50nsec
> >> of time, for example to store in a file for a software-based GPU devic=
e.
> >>> So a device cannot respond back suspend=3Dtrue in next 50nsec time.
> >> It's OK for the device to take longer time to respond, the driver
> >> simply re-reads device status.
> > Sure, the issue is, when the driver re-reads, the device must present
> suspend=3Dfalse within 50nsec.
> > (because device didn't suspend it yet).
> >
> > As I explained in previous email, this requires building special circui=
try.
> > Such circuitry can be avoided if the suspend interface is done slightly
> differently.
> why there is a constraint condition of the time?=20
Because this is what driver does as you explained in [1] indicating "we mus=
t be able to handle ..."

[1] https://lore.kernel.org/virtio-comment/c4d5eed3-774b-4d35-a007-f9dff28c=
e884@amd.com/T/#m6f081f96ef9dcea29c64a88b633eb21d50e8c410

> Are there any similar
> constraining for other states like RESET or DRIVER_OK? Don't assume any
> other states transitions are faster than SUSPEND.
DRIVER_OK does not suffer from it because it is async notification.
A device may start slow after DRIVER_OK.
SUSPEND operation cannot rely on such async behavior.

RESET also suffers from similar inefficiencies.
But that is because it is inherited from the past.

Here a new functionality is being proposed and it has a chance for efficien=
t device implementation.
Therefore the request is to improve it.

> >
> >>> More below.
> >>>
> >>>>>>> b. A software-based device may not always want to force VM_EXIT
> >>>>>>> on read
> >>>>>> and write on the device_status register?
> >>>>>> Trap and Emulation is the basic of virtualization, and how to
> >>>>>> pass-through a device is out of this spec.
> >>>>>>
> >>>>> Sure, I didn't suggest to put such things in the spec.
> >>>>> My question is, whether to trap and emulate or not is a choice of
> >>>>> the
> >>>> software.
> >>>>> Do you agree?
> >>>> The device emulator does not know anything about whether trapped
> or
> >> not.
> >>>> Trapping and Emulation is a hypervisor thing.
> >>>>
> >>>> If here "software" refers to the device emulator, then Yes, it is
> >>>> not the emulator's decision. And the device should not be aware of
> >>>> VM_EXIT & VM_ENTRY.
> >>>>
> >>> Right. So a software wants to implement device_status as pure MMIO
> >> writes. (and not VM_EXIT).
> >> This is not always true, there can be VM_EXIT of pure emulated
> >> devices.
> > I am not denying that VM_EXIT can/cannot be there.
> > I am saying, the proposal forces VM_EXIT based approach in my
> understanding of this patch.
[MARKER_1]

> > If that is not true, may be can you please explain how this can be
> implemented without VM_EXIT?
> >
> > We should have an interface that can be done with and without VM_EXIT
> method at least for any new additions.
> VM_EXIT is out of spec, it is a hypervisor and the processor thing.
You keep repeating VM_EXIST is out of spec.
I already replied at [MARKER_1], sure it is out of spec, the current approa=
ch forces one to do VM_EXIT based approach.
And if not, please explain, how can it be achieved?

> In non-pass-through case, any register access are sensitive and will trig=
ger
> VM_EXIT. Like RESET or DRIVER_OK needs to access device_status, nothing
> different.
I don't think you understood the point.
Let me repeat, The question is, if the device implementation wants to achie=
ve the functionality without VM_EXIT, what is the way?

> >
> >> The
> >> HW registers are sensitive resource and any access to them need to be
> >> trapped and emulated.
> > This does not apply to PCI PFs and VFs which are HW devices (mainly PFs=
).
> > so this trap + emulation is narrow view that we better avoid.
> This is how *basic* virtualization work, once access sensitive resource, =
trap it.
> >
> > If you think this is the way forward, you should put forward in patch a=
s
> MUST requirement.
> > and that does not look right to me.
> > I hope you also don't mean to force this method to device
> implementations.
> > Right?
> Again, VM_EXIT is a hypervisor thing,=A0 out of spec. Whether there is a
> VM_EXIT when setting SUSPEND totally depends on the virtualization
> solution. And SUSPEND is nothing different from DRIVER_OK.
>=20
Please avoid repeating the point that VM_EXIT is hypervosor thing.
No one asked to put this in spec. Please re-read [MARKER1]. You probably mi=
ssed that.

SUSPEND is different than DRIVER_OK. I explained the timing constraints and=
 the required circuitry needed to fulfill the proposal.
And with the additional register, such complicated circuitry can be easily =
avoided.

> Means, if your virtualization needs to trap SUSPEND, it also needs to tra=
p
> DRIVER_OK, and don't assume DRIVER_OK is faster than SUSPEND.
DRIVER_OK is by law of physics is faster than SUSPEND because it does not d=
emand the driver of reading back.
There is no driver side loop to check if the device accepted DRIVER_OK or n=
ot.
Agree?

> >
> >>> And prefer to returning SUSPEND=3Dtrue at slow pace.
> >>> This means, the device implementation cannot immediately return
> >> suspend=3Dtrue right after it was written.
> >>> A MMIO read will read it back, as suspend=3Dtrue.
> >>>
> >>> An alternative would be, to forward CPU loads and CPU stores to
> >>> different
> >> address.
> >>> However, this does not work for the hw based devices.
> >>>
> >>> That means, PCI HW needs to return suspend=3D0, until the device is
> >>> not
> >> suspended.
> >>> In this example, the device cannot build special circuitry to answer
> >> suspend=3Dtrue within 50nsec, or in other words building special
> >> circuitry to return suspend=3Dfalse is too complex for the slow operat=
ion.
> >> why? The device can just not to change the value of the SUSPEND bit
> >> before it has fully suspended.
> > When driver wrote, it wrote suspend=3Dtrue, And device returns
> > suspend=3Dfalse while suspend is ongoing, right?
> > If yes, this is expensive because the device needs to operate within 50=
nsec
> or less to answer suspend=3Dfalse.
> >
> > And even worst, it needs to suspend=3Dtrue when unsuspending within
> 50nsec when resuming is ongoing.
> again, there is not a 50nsec constraining and please take a reference of =
how
> DRIVER_OK work with virtualization.
There is. The device is expected to return back the desired value to indica=
te driver that suspend is ongoing.
It is different than DRIVER_OK.

> >
> >>> If this understanding of burden is clear,
> >>>
> >>> The proposal is, can you please extend the interface such that,
> >>>
> >>> 1. driver writes suspend command.
> >>> 2. driver reads suspend_status, and receives not_completed=3D(false).
> >>> This is
> >> the default value.
> >>> 3. When the device completes suspend, it changes the polarity of
> >> suspend_status=3Dtrue.
> >>> This has two main benefits:
> >>> [A] This will enable software-based devices to write data to slow
> >>> files and
> >> does not have to force VM_EXITs.
> >>> [B] It also enables hw based devices to not build special circuitry
> >>> to answer
> >> within 50nsec, which can get very complicated for tens or hundreds of
> >> PCI PFs.
> >> I think we have already discussed on this before in V5, and Jason has
> >> some insightful comments
> >>
> > Unfortunately, not. His comment was that it is not specific to suspend.
> > But here we are introducing a new interface and functionality that does=
 not
> need to suffer or follow anything that may not be efficient.
> >
> >>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor
> >> e.kernel.org%2Fvirtio-comment%2F20240612082055-mutt-send-email-
> mst%40
> >>
> kernel.org%2FT%2F%23mc817fc6ca12ff0bcbae62b43b6146a177ecf13a9&dat
> a=3D05
> >>
> %7C02%7Cparav%40nvidia.com%7C619c82b60b824ca03f8808dcc89beb4a%7
> C43083
> >>
> d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638605819247985989%7CUn
> known%7C
> >>
> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> CJXV
> >>
> CI6Mn0%3D%7C0%7C%7C%7C&sdata=3DVqmJmqt3k5tf3x4ihjE5Bd7u59GadOn
> OaOfJ5lvG
> >> 1DE%3D&reserved=3D0
> >>>> this is out of the spec anyway.
> >>>>
> >>>> Thanks
> >>>> Zhu Lingshan
> >>>>>> Thanks
> >>>>>> Zhu Lingshan
> >>>>>>>> +\devicenormative{\subsection}{Device Suspend}{General
> >>>>>>>> +Initialization And Device Operation / Device Suspend}
> >>>>>>>> +
> >>>>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
> >>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
> >>>>>>>> +
> >>>>>>>> +The device MUST ignore all access to its Configuration Space
> >>>>>>>> +while suspended, except for \field{device status} if it is
> >>>>>>>> +part of the Configuration
> >>>>>>>> Space.
> >>>>>>>> +
> >>>>>>>> +A device MUST NOT send any notifications for any virtqeuues,
> >>>>>>>> +access any virtqueues, or modify any fields in its
> >>>>>>>> +Configuration Space while suspended.
> >>>>>>>> +
> >>>>>>>> +If changes occur in the Configuration Space while the SUSPEND
> >>>>>>>> +bit is set, the device MUST NOT send any configuration change
> >>>> notifications.
> >>>>>>>> +Instead, the device MUST send the notification after the
> >>>>>>>> +SUSPEND bit has
> >>>>>>>> been cleared.
> >>>>>>>> +
> >>>>>>>> +When the driver sets SUSPEND, the device MUST either suspend
> >>>>>>>> +itself or set
> >>>>>>>> DEVICE_NEEDS_RESET if failed to suspend.
> >>>>>>>> +
> >>>>>>>> +If SUSPEND is set in \field{device status}, when the driver
> >>>>>>>> +clears SUSPEND, the device MUST either resume normal
> operation
> >>>>>>>> +or set
> >>>>>>>> DEVICE_NEEDS_RESET.
> >>>>>>>> +
> >>>>>>>> +When the driver sets SUSPEND,
> >>>>>>>> +the device SHOULD perform the following actions before
> >>>>>>>> +presenting that
> >>>>>>>> the SUSPEND bit is set to 1 in the \field{device status}:
> >>>>>>>> +
> >>>>>>>> +\begin{itemize}
> >>>>>>>> +\item Stop processing more buffers of any virtqueues \item
> >>>>>>>> +Wait until all buffers that are being processed have been used.
> >>>>>>>> +\item Send used buffer notifications to the driver.
> >>>>>>>> +\end{itemize}
> >>>>>>>> +
> >>>>>>>>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
> >>>>>>>> Options}
> >>>>>>>>
> >>>>>>>>  Virtio can use various different buses, thus the standard is
> >>>>>>>> split @@ -872,6
> >>>>>>>> +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> >>>>>>>> +Feature
> >>>>>>>> Bits}
> >>>>>>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device /
> >>>>>>>> Feature Bits} for
> >>>>>>>>  	handling features reserved for future use.
> >>>>>>>>
> >>>>>>>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the
> >>>>>>>> + driver
> >>>> can
> >>>>>>>> +   trigger suspending the device via the SUSPEND flag
> >>>>>>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device St=
atus
> Field}.
> >>>>>>>> +
> >>>>>>>>  \end{description}
> >>>>>>>>
> >>>>>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved
> >>>>>>>> Feature Bits}
> >>>>>>>> --
> >>>>>>>> 2.45.2
> >>>>>>>>

