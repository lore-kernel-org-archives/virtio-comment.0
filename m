Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3206E28D821
	for <virtio-comment@lists.linux.dev>; Fri,  4 Jul 2025 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623110; cv=fail; b=lLA8efoG9CqEYg6FdRNW3euXtbvXxOngCKgKrdxo9mg0Kvuvn9vMUwGxDJZrvYg5T1Vs1ek1EzLLui6Kg9tpULz70m+UIUp2YA3+HG/676ovPw4IDzhYr5kuHtddK5XRmma9ENRBb+vVEokJx+FvtAvpoR+5fMNOzO4Cw8pm4DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623110; c=relaxed/simple;
	bh=6sTmYtUuu6IveEzdwTdB14aY6cUGzWX18xz+aOyFU4g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ajAtb1YiQa+/N8Yo9NZOzUnrDclbmxyhiheQ55FZhdINjgTU0YYKRaS7swP+QSAE++vTmNXfpp17AQffVthNvbWZpdFWoEr9/igahRdQ0a+61wIleVHWdVZ2TkAKo80VAzFpM/7617GbjVde6DSqZ8Kgdohum9bhvr/6vq1QLnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=STVGps1v; arc=fail smtp.client-ip=40.107.94.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="STVGps1v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZH6nq0KLzjvUDg5Q9N3YZz4Fp2/l36nyGB5gPTUM3JCT4xL4Qcwuqc8NNixqtsa+39jB7EkDaSufe5luYcgKWA+MdlbJBFQkHOhbY9lDb4JtZ+NCbWnC+M0guzqIYc2HU9IsDwNn6Bbg6kKQsuCFP/IPmNBLLUH9EsaWpD+DgteXOehMDbrq+Eye8Kq5sCEh80SpHE02X+J1Anfjv+WQahNvfRyxg0iaPtD/+TywclM8qRl2R8Q1Y2kv3lvcuTlvfFdv0yspFbZCEN7NdfIOa9Es4j5foKSEtwX3fZTzEhJRo4H+uwdOs0+4jIR9hm2kO1eonj8ahB4pqlulnjKGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sTmYtUuu6IveEzdwTdB14aY6cUGzWX18xz+aOyFU4g=;
 b=izJcnVFb6tXtndU29dCAYbNd5I1qe9ov1Sh1oHDQiDTKVTGz4/8xN8DgtjUF3BH5geh8YgRNXpIrnLHUCBohYKZa9TmfTAAqJxMbUBooR15782ZCNe6jZoJOcTyWvtSDjIffQtqbBXW+OW+EUFlI8SdK5f2RSKQUnLkdNfEiUrArhXYbOWPifWwIEqRr2CRYgXwXHrjgYxmNvdUYgQoY3eKU958fF4vlsCrURRzSbNNl1n14K2yHYm62r7d4HV9/oT1mPtN25BQjy+vpUf/i3DLYGAxglJ8UCVR5mUYb/8udD4HX8yODwyhKY9/3bbMeVc6OoK5+Tf0pXdNSk47rhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sTmYtUuu6IveEzdwTdB14aY6cUGzWX18xz+aOyFU4g=;
 b=STVGps1vKN7vAkfTwDwLWGEZhO61W2vtnwoqj9HQlWW20/FrevaA+09YG0UgE/9L+uXfS4mAyVkACC0o1an7Rb5GiFHJz/wHQJRU3X/hKOmlckeh/EsGiBrRMwPsPv8Hsy9SSK+GrwrtDVbAPDPO1sPAElV0A4UzlXHeoCQJnKs9+85rpiYpJEuWSeYK4XoSsyBjQ/ZReHYzKoFpir/gmz30Y1pWi81yACIFNDMeh07gModJf1Kk+qudv8BQ6sZvGqBmS2YjdEV1PcbFfBvYYNpBmgW5J2bOhaybB3TMXaHShB1mjlWWEQnwvwb3c5LJ4SCQFelhhHWHEXMZV/6OuA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH1PPFDA34A4201.namprd12.prod.outlook.com (2603:10b6:61f:fc00::625) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 4 Jul
 2025 09:58:24 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8880.029; Fri, 4 Jul 2025
 09:58:24 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@amd.com>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: RE: [PATCH v4 3/3] virtio: introduce SUSPEND and RESUME feature
Thread-Topic: [PATCH v4 3/3] virtio: introduce SUSPEND and RESUME feature
Thread-Index: AQHb6y79DuFcUWVxaUecUxWoowoDm7QetfQggAMHFoCAAABZIA==
Date: Fri, 4 Jul 2025 09:58:24 +0000
Message-ID:
 <CY8PR12MB71958545CF33AAB4A21C2FA5DC42A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250702085421.342224-1-lingshan.zhu@amd.com>
 <20250702085421.342224-4-lingshan.zhu@amd.com>
 <CY8PR12MB719508FFEF43584586B6CFDDDC40A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <d7a75d56-ed55-4b97-89f2-2e4c4afb8d3b@amd.com>
In-Reply-To: <d7a75d56-ed55-4b97-89f2-2e4c4afb8d3b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH1PPFDA34A4201:EE_
x-ms-office365-filtering-correlation-id: 73c04432-816e-4c6e-b643-08ddbae150d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6no+Mvq89m6lYmG6NKXm4OFXNHJQdbn/yX2KiNguzz5r/crYZkHfmpveQLGH?=
 =?us-ascii?Q?ILrOQfnj0erdopFaqMNvYmrIWVcnpdX25vewdZxaASr098fztCKiKI3hcT+l?=
 =?us-ascii?Q?LQQRfNzFdQB4caK56RS/LwmPqlCrJT6owdkVy2iJiTRGnzex04LrIH+MipNx?=
 =?us-ascii?Q?jqUkUVhIZcapUVMaUpCSYwYim0FwRbFvPWHROY44pKl9iaIGTXPxR7gyuMBs?=
 =?us-ascii?Q?jL+eWxs98X7OTYTSoysZ+JTMobXF18N54pgD7KXEXF3VHV0cdBUvaiWr5AcG?=
 =?us-ascii?Q?r0uP4znB6+ospqFFWufxV+ptfiIbonn7wSbuM7WrywK00jT+d21iCfoOCpHu?=
 =?us-ascii?Q?MadDxu4FyayYw8xXOCA74QEZdik2GWbNrkyj2DfE6mMowfEk4Rszv//MtaLF?=
 =?us-ascii?Q?phq5B+DHA5n9ewnXFEOmR9idkW8+CxH6cAqKfqGP68TI9OOWkGqZgykWOS1Q?=
 =?us-ascii?Q?BdmVlWFzfCiApK17yYR6F4Xhjp6THMpoXOKvV8gS1Lll0892hxQOkVKuR665?=
 =?us-ascii?Q?a3aQ6D32UHApGYb6pGjsmqXrzpulslyRgrRp4BjYnm4Sd2S0u9V78d+LW6OL?=
 =?us-ascii?Q?LBLGYKJggfeLoPCi6otG5e0na3KWNoyp6jQsJbYp02UWLC/YXWD+fQyY/3mo?=
 =?us-ascii?Q?B8VkxmdbJjW+uXytfPA12RZ9jWTpkjoTuzYWVimnE2pQWWEG5vzkbXB5l7+r?=
 =?us-ascii?Q?NhF6Bku42mEMap87KsAxUu6uGKjZjgA8GXl04IkCCTebPDGoDFOPH8BoYJg6?=
 =?us-ascii?Q?0bLxmhsmUXx8JjncewcNFchigpeQJJi4uxYQckB/A023UAHSx2u6yMj+dZoe?=
 =?us-ascii?Q?TWkSja9jWddPX/+SawD+ZLTqHZ306tYRSc9k9cJEbIfpmrtiXfEPwxRShzLH?=
 =?us-ascii?Q?auPnOokA7yLgQCRZ3yV4+eT0/+BMZflL7OoUWctLZY+TFdQihSa2/DZC/LtW?=
 =?us-ascii?Q?H/6BsKpXtWl6FGRASBXv6nu4pP+glqnHOOtMrNFeqCO7ONVxT50Tot4saD2x?=
 =?us-ascii?Q?GI6Hz8EFxuOJbg1KzCk3UcswQTyAxuT/L2YoDDEC8p0YS93apTZ/q58ULiPc?=
 =?us-ascii?Q?fSpqtnlQOBN8jWjvFugYNNkoMP3hb9wK0cOm4MY638R3YsgHO/yJe01yHqid?=
 =?us-ascii?Q?HFWbC6O1jNyeofG9RC+aUOGaqaPP7UGz9v6PLvxik3duhj/fojfE8VkAFCTG?=
 =?us-ascii?Q?tuy1a7g6KOzDfF5llCOEwQ/lg1IqEfTRnCTzS/Xhd8csHY3eXYOU6kAfrQ5U?=
 =?us-ascii?Q?98qsYP+1g4jig/C/y5YvicNodacXn/pXMu/7+wSSoD/Ydb/ti9NDBUO9/8v7?=
 =?us-ascii?Q?hUnyYtSgHmtfk06hIUGAYGG+0MJb1stbQq1Q8t2IEeRYbyn0VWgNbzzX3W2G?=
 =?us-ascii?Q?p5wBDUQdlp7S266h30uxO9oh6asypZOyvFVBD5Uhri/BajrxhScj49ipnjge?=
 =?us-ascii?Q?vGhxb1zuXpr0W5kBxT+xGHcc2gu7p8U785pXLniY7qxZAHRjiRYfJXHWMco0?=
 =?us-ascii?Q?sDJUjEG1VXu+IpQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?whhxOSvrRxvyW2uTzxQJOZGW+rJqT6HTRDOcep9hT176MpDMQHFVrfGk/bY+?=
 =?us-ascii?Q?SsfTYflboVkXXtUJPaheWgJTQx6oVqg3M9Jf91P3PgXNGW2jTUUlpxq5QW1s?=
 =?us-ascii?Q?hJAOPDjYHXSyaDisFlv3Cfd8eeSedzotQWiueXY+4saBgvwC9U1Fwfx5Min3?=
 =?us-ascii?Q?dUJCaHrB+UqRtsrFA25BTRma6O94luT4md3MMZzoSHpZNLCtSPSec5Vz1m5N?=
 =?us-ascii?Q?tPjkFjGgHPhdLth/T3am+p0LqX54UGrpnOkzXwwhBgMXJeJ2Wg32eLB7SSUb?=
 =?us-ascii?Q?mqUtDPT3DbBSIMvavG1nzPlv4isHmR4EX+9enWfU2myBQjmUboVwRX3I/OHI?=
 =?us-ascii?Q?dmmj+ilk3h2+j+AQBaeq9nJfFIPCqh4HaOyV5hVMFP4SBNNRfA752bn76p0L?=
 =?us-ascii?Q?hCbaiELGqr3Y+C+MBTNdjGA74kn7ov1sphXtsHeuHa9C3oWe62SFd7dAYy3j?=
 =?us-ascii?Q?8imbG2SBfJUjcKQ4b18LKw3iEqIqMvCRU7VAGCZq44JY5VJNMHc7uj34V+kN?=
 =?us-ascii?Q?J3DYSWMYAW2pRp/yv+8gAzyt6SdRlMYqQR8iVrhKLSi18YvPGjfH1Hg9N8++?=
 =?us-ascii?Q?i1vfSa2MOBMKEW8K0/UzZc0QSIzIx3iy5LcR5WTTI9XMNolIKm1NIl/yXEql?=
 =?us-ascii?Q?gSE4W8HuCDMr1ABZzblNVAeK8HSvHzv5J6WiTwOE19nu9P+A8UitNNJnaN05?=
 =?us-ascii?Q?+f1arofkUBjKP/tq6rq6D92u8w0kBn5eplOINGCX3mwkGulKMqQAyBrOr3Ek?=
 =?us-ascii?Q?4y+UhiKajpQQnfHoVAzSop5rLT1TBAkQAmgD9EVUg0L3A80nLEYz4QKza0lr?=
 =?us-ascii?Q?1vkJR6Wq5U6OKygVH+i6v6sxV14jxx6HGdhMofXQXZjStsIlk9gY/LMahd27?=
 =?us-ascii?Q?brsyOYsCO65AayR6fi0q7f3ETqxL5wh5JLXNnwElklMlNF0IZVdow8fZV729?=
 =?us-ascii?Q?zrRUhECLGVsnTq63yssbHd0nFwEvz94ULcWrWu0uJyNv5nWLMg41xBdHuywK?=
 =?us-ascii?Q?+ni+THKGE3Ozhg+1WHCPhEap0xCloDBBKvy0bHEKFaKZMo8wzJR7l2Wyo1oO?=
 =?us-ascii?Q?NGSztH/qVVxmP2hZl0hG9G0IoC7tUgHv7jkNUnHZvDI0fYCwOUDX+YGa3RV6?=
 =?us-ascii?Q?s2rFqBhE9UXyDjONyUEO+ghK0wy9mm4BGrFvl3PrkZtTFrH9xFTO4zDhyE2c?=
 =?us-ascii?Q?DEOQf79ANf5+dOI3vyRnhvS1MoXWqLaw1LbxGZzogDdViRtiWx1qX3KyLgaB?=
 =?us-ascii?Q?tRLxAqVQvrdYdGDUMQII8Wc00MFjheUBRwICdDURdh97pM4bn7/8ZOQUaCVc?=
 =?us-ascii?Q?XSM6y1SBiwY4Cr2Xweo1WGUxLgnxp47ixaZ1fqUmp8JoSZFz7wSyp3Lz5gIe?=
 =?us-ascii?Q?4BaNw/0BqAnUBq6R9hLgickI5hDUyAZlF2dD9XvQRqhCMogycpOOcsNW8Lbf?=
 =?us-ascii?Q?0hQM7MrAzPSkhcGoyzuJxT4J6A5OujIPQttmzOE9VeqU8Xg92EI8kTvmoBVP?=
 =?us-ascii?Q?6XbMD5Nz7iTCbIYPza1H0tJ5jcoFLJno2T6baYpHUiE7TgvzQMcIdjoRhPI5?=
 =?us-ascii?Q?QiU+7dPpZnqB+EXw8y8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c04432-816e-4c6e-b643-08ddbae150d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 09:58:24.2490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VEih0Q0fM9YOudqVfaiLt7cZuQdY1i0aq0PtEtJ8w6h/ipDBE1MY41x7nRtXhRvvNeWPV01wkWLdi28yIBEgEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDA34A4201

> From: Zhu, Lingshan <lingshan.zhu@amd.com>=20
> Sent: 04 July 2025 03:25 PM

> And I think what you mean is:
> "When the device has been suspended, once the driver sets DRIVER_OK bit i=
n \field{device status} to 1,
> the driver MUST wait for the SUSPEND bit in \field{device status} to turn=
 0 and DRIVER_OK bit in \field{device_status} to turn 1
> before any normal operations."

Yes. LTGM.

Please try to use the text format email so that one does not need to reform=
at on reply.
