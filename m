Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2087.outbound.protection.outlook.com [40.107.100.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6691AD26D
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725359319; cv=fail; b=ZtmeXshjgAVM8ae06iaAt2n162ZEVXKPRSTQ7TPS1HulDcU7LiGxIBdje7TFhrDcA0ycYijowOmOlJ+BLYSTlhCLYAkiOUj51eow7Ydaa9cSlPtK5FhB+VxD+RM5RTzzeww1tv2HbeUrtIU3N0E6FBuKDfmB83I0MAscpj9Gpdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725359319; c=relaxed/simple;
	bh=Algp4Uf6SldXHa2hujgRJnnGTSJu5Y2opRG5knW53J0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KpzCtKhvLK68DiAboI7Fe+1I8+2J9NUMTjmcmvTXVEulkTfFkmrQnEch64ObMmAQYqa/QJnUTjXj2xQZDdyjyHx7ElsN4ozUVnAMi6Li0UCnKHRDIkGSZAMQnU14yl+Sv80URAW/vvsnTP8hL+Vy7gv7Q1l83yBCfEEvmdZiTfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AzCy7+cU; arc=fail smtp.client-ip=40.107.100.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AzCy7+cU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRh3ryZCbZDnZdgauqcuXd/Bali354Tsowxlq+8lsBZiIfaqAyuSvmxKqClZaB+apS94faUdqm97/p9RQJyX+nB6virbdtdZDvYTAQWcKc2OpJK7LHGQcLXPJlsjHQGCEWFrgNlQ7UvPffBpdZvlFOoFZ61AysEG3nql8Mo01MHHxBtWsyC1taf5SyaKwo0UZ/hVV3PhRzx1Wx3CM0NI+eASjdAOSQzRRxcM8EYGoJ80AbrCIaIKSNo9jJ7R8UZJrprdjciN1Yxs/GZN4rm4lU/ITwcUDKJikNzOOuTOHEVsKD1ra25imwIWJRuXy3wig/i2Lo7RrmXZq4lnNWUoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayhtbWsLu0x5TKIQysTco7CKA4Lnw+zmhHhf0HhY+J8=;
 b=rTCUaMbfzPj8iLvBQXp4+NAcw9VdB1dWaJhPpuCCn1RVk9npMzJEIdE4AGHEZr98lHCMcYK0SRQ/LRJmQAsQZSV+NSfC8PjGVisUadrcK5/oSyVtNHjiSiDkdMxonVjh3qZLi9mOzcvwkDbHFR16Iow9Hwx9CMkanNKWGw4hY0xri/f0Yh5mwAx+9IaWGd42YSn9SMsrp66hEy5L8nIEYupp0X7T+Sv/jszYswLXfuIM6itMnAmV1JE85fL82taz5hMFwREY9HSbCo+aQivUmWxTJ5/WsxKuPJzA6a/9lDiTF8BuNspI8EZeitAeulI9SGU6A0xv311jLTuXE8rSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayhtbWsLu0x5TKIQysTco7CKA4Lnw+zmhHhf0HhY+J8=;
 b=AzCy7+cUCNg35NipdYJCHyLhw5SBZ6TneQIg+TOfOwnE47Dhk/R5H7sEVV+drg7xd0lZsu0jSw5wrSlNKOjGIwHGLaK5zpbWuVPp0bGvsqGsX2yfaTHqE/cINnGQYUWNQck3Nw7kW+pp8jbgAITcxr7vHqnNLNTDBVW5t0weJrvvu+rhscUYbRlDp5/WTTCL6IvMmFH+sa8sheg1/fgzEXrqFmwnGn4UiljWHWmY+j8t2Gre7bSOmT+TzMlMv6qG5SoCds6cz++tE3pVMXbTyZtQ4/hG7FMXkZ0V7RGWJAyn+XLSUkNcjgMmV2mQooOMRdG7esiLmBnQLcGAXIf+1g==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by SA3PR12MB9200.namprd12.prod.outlook.com (2603:10b6:806:39c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 10:28:33 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 10:28:33 +0000
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
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA0LrAIAAAIWAgBcwMgCAAAT60IAGsmcAgAAUIXA=
Date: Tue, 3 Sep 2024 10:28:33 +0000
Message-ID:
 <IA0PR12MB8713A9B32BED215EE545C7A5DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
In-Reply-To: <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|SA3PR12MB9200:EE_
x-ms-office365-filtering-correlation-id: 3f9feffa-6dc6-4cce-305c-08dccc03295d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?dxoDkSuMxo1FpjzQjOR2AhKTF0W1YpnUJz7R03IcKi5/coeeO3k5NyAhOL?=
 =?iso-8859-1?Q?pVIaPQ/e/5HhaY1IbGfv4FL3dNCJmvM/Dndf/QeOI/srYsy9mbP/yw4535?=
 =?iso-8859-1?Q?TKf7uPE3ZUdwMYC8tAPND9txjRtIIDy+YHuQRFtiUc1p74XrDhN7Q6dDde?=
 =?iso-8859-1?Q?6+qlsxKced40FlYcgC+YMuaWW2StZUVAD+EtRJTWNBbJqxSboBwX57HaBm?=
 =?iso-8859-1?Q?arlzDogkxMxrNgTHHdc+zqTq2p7fYxTgGjXpqfamOToj8myOKb78HRyby4?=
 =?iso-8859-1?Q?kBEVNGg50FxyIn+A0Zz0cqvd23lKPzPZtElZxxVRcVUvWqR143ZyyGM21q?=
 =?iso-8859-1?Q?c7/ZHRkbcIZDKWpdSN0/b3S5WwE4KF9NKxiX/OkUpsiqWx742FvNAx+IJn?=
 =?iso-8859-1?Q?+lknVmQBxlUPCeCUZVDxSLSY/3kjlz3IHkIOGJcqtkOZJ1PT6DsYbpnZ/C?=
 =?iso-8859-1?Q?aSgWuPqolqGYJHN2TIRfmneAvTNBzzo2VRuQ4hRBZKPQx+syOmtXxtV/FK?=
 =?iso-8859-1?Q?usrK4EkUs7WY4d534xc3FnlCVRaxh9t7XdIWFyuNVvGjajxjHVZ8f7kw4F?=
 =?iso-8859-1?Q?6tXBsMloSwqda4xO/ZwO2L5UE1VJQYq5DuOR9RQfWYmI5JM3aDrogqAJzG?=
 =?iso-8859-1?Q?DlfD73Kg3C17cEotMRa6DHT+EPJJUx2d/kXA/cXh76E4heoRzbztnQniQX?=
 =?iso-8859-1?Q?yUUlwibYkwMSB8RVIZnSfHuJRSY9Y5JQUeMi0TMepf+/s4KGnOhpyIr5DS?=
 =?iso-8859-1?Q?yvOHZZDiNS4obA3N56J5fM5KEnNe44IdN4x8KCyZUpnMpl9tXEMujoeEFY?=
 =?iso-8859-1?Q?J2nkj3PZxxUNNrjdiqJ15/pwJ6FrLZE/nNzIUVOFfjAH/sQfsWrZylCAMD?=
 =?iso-8859-1?Q?VIVXpx8xfkvbJj2avGlnYuiq6QC4UGjAwBMPvgAEzVDfUf7lxqQbQBo7/n?=
 =?iso-8859-1?Q?ME89vmx3gNUkdu/VOfRinLM4RtXNhp3zp714ZZXCjdyNjBRABU/NRrqlzx?=
 =?iso-8859-1?Q?RQvg49mmL5k38HVGzJQV+TKe7BhmB0Uw+7u0LUU15+MXYFB1mSSxpOT5+Y?=
 =?iso-8859-1?Q?nB6Q5GmqxQjDOiaO96YIsacFpGo/SY6Sd0MdaX1CUeZbaStqVV+GOdeak3?=
 =?iso-8859-1?Q?5fQVtscOGq8SPVZOPUyLtr649kcpfzMP5sXx5IqlplR5gURVMu8qsliqjo?=
 =?iso-8859-1?Q?AHYS5pT+KsGL8Xj4aW/zBFMykxQlCOnXD9ttnjoGw7OgAGYZamsItSPLrv?=
 =?iso-8859-1?Q?8pdaCocbdJvo7seghsX1wCXQWf8wo41s9ZJgGEhBDJxyKSOFtyNZ1PBSr2?=
 =?iso-8859-1?Q?3qYBGrV2ZQ2up86ohsOrCBdB+zO6BakWIQXYlMF3wMZTq5qvXuBlZqM6Bg?=
 =?iso-8859-1?Q?8Q/qdDeQlzzuiSFFRnMBHayZ+OczXdzlEfiaT5eYjqd9u/ZUqLcHNngu9Y?=
 =?iso-8859-1?Q?74EvilS5danmW1bjK/uXczDyKxzcLUBmXSvtnQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DADcAVk4SW1hbNK6pu6FQ39fCTYG23h72g2vOi1ifegU8da9jsyY4L5oYt?=
 =?iso-8859-1?Q?9dMEu1yq6pertGwp91FAGkqF9atzk/VrLR15riLAZroIPEkPcyg6SlEN8e?=
 =?iso-8859-1?Q?lzQg2cpPgPg+WlK2xt2Dy7QL0sIhbujs8lhIbesZ1q2jFEaM4NHyL0a8Eo?=
 =?iso-8859-1?Q?i/K1hx92yAMPJtEUvk/V1WkQxIYOBCOAz4SNtC8Snnu5NYzF94Oqg14VBe?=
 =?iso-8859-1?Q?H13k8N/DEuHtXkrhzojSeBmFm8Jpp4ucw2S50MS1eKvzxz25nmHadsYt/2?=
 =?iso-8859-1?Q?t9bNmmie+v0vOs5ILWOJINXi/bC3ntYUTVkzLSP9o/HXpiw6S8qdzgy8Ai?=
 =?iso-8859-1?Q?inyNzzIQAEfwxPlcShfJUrCqkytq1xb5V/f4c/pCnSNvSf82gJuj3D69yF?=
 =?iso-8859-1?Q?weS7BAwcp8ik6UMEHS9EjXrUgk1ZT6dcj4N4aR09RlITkmDlApO0wzf84F?=
 =?iso-8859-1?Q?gkBFXlRXahcIFUyhpsAwOqBqi5hgKaXplcvatdElQCZOHnMqce2YIOGSCB?=
 =?iso-8859-1?Q?aVb8MrkGD+OueoT6M+QGGFwPIpKEoFxd03KsAYwS05VwOfUkvLpa2Arf2J?=
 =?iso-8859-1?Q?T24j1vNIIrlLfYKniy6+4WZIHe6kBF+nsyfjNjhMQu6Y8/Bsuuwt6KkG/D?=
 =?iso-8859-1?Q?mvFxI5SzdLA3C+fnOA053XOtlwEhS30IlMBQ4l7g8dl9LIVoJJRdG8wgIm?=
 =?iso-8859-1?Q?wJCVExd2NRiQFpI4STvXIVKt4MbOBKF4tXy7XxNWhtkC3C7zqqHCHR7StT?=
 =?iso-8859-1?Q?zWMAiBysdj5xeV45vBK4o5xfiZTmKKp9tU3lNTDr2n2+hTbddRTk7Re3Vw?=
 =?iso-8859-1?Q?FyyKkdauAEh9/GYOKW4IsgRit56f3IS6CfRKlKC9C2TwdVg4WV++4Dw+dm?=
 =?iso-8859-1?Q?GxsVTRRIjLMUhHBJv8gnsGeithK3HYKohca3N2da9DsyQI3sN3AFBRmEFa?=
 =?iso-8859-1?Q?4NzJ6L+m5qZaf+leNhZ8AGKqRLF5kYGjEYqMOaPuauJDKZW8LgeA8aI2ma?=
 =?iso-8859-1?Q?DUsoacnNS3DQjnimgBR78QR76IIxf+fxZUOZXJL55+ccmNgxV1dr+wGJ2g?=
 =?iso-8859-1?Q?4RDd9iC5NM76s8R4kJ9+yabXdU1RWdtqfU7FIMR4kDQw5JazOp7/7RcAlm?=
 =?iso-8859-1?Q?a3xV8tTRfzER+BELvXaUdoG5m6nlevjS5KMoLXSXohL9RVhchFqOA44SYo?=
 =?iso-8859-1?Q?BcqlRB7Gwwai917bZa8tK3EEuLei9FoHvksw6YGMHeWqZAt1XVFWX1BRbX?=
 =?iso-8859-1?Q?UoPNnOX47mqu1cde4E9qIRaaj6JetFrUNip3hQO4yGMEUb5XeNsrx6o+Yv?=
 =?iso-8859-1?Q?4FEWswGSzXiWnPO5i+Wr4tWJr2dBK/eR2W3tHMx7HfXDh9uFMglbxfsBt8?=
 =?iso-8859-1?Q?ZTDu+Cpju6CqMNYnRk3yDRNreC0svnYjurNYvhOW5MFIwYu5RNBObPzFeQ?=
 =?iso-8859-1?Q?EuY7aHp2QhfBuiQAC3+QuG38D76a+fvM+/jBKt5+7IY9Qg+Dks8YxUyC3x?=
 =?iso-8859-1?Q?09QGS2nB8Y6Jnz4DCo1rn35iBPHS53qlH9l+RyBUzj2Q+4yRseQq+0aEfO?=
 =?iso-8859-1?Q?20xVdPI54lvkFKt3cOuPuBCYuPkNChPflyC+U/jgvVGXiY24wV/yFGTEpj?=
 =?iso-8859-1?Q?W+dV98KAGWnk+2AAPlktPAEVNCXqHLEq5KcrVeiSR6EKLHub1Un1lcB7YP?=
 =?iso-8859-1?Q?xV0Yt5sNtZMLJV9/oHUhUdAOjuemNzCc6YcOarDq?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9feffa-6dc6-4cce-305c-08dccc03295d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 10:28:33.0415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJWestKcObv8EgOVZoiWMoIL8ckvBlzQo3Js9yDp+DczuHVvFF/Vr99CPN9/ctHrVBDAz5DpP/N+7eeNVnxPsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9200



> From: Zhu Lingshan <lingshan.zhu@amd.com>
> Sent: Tuesday, September 3, 2024 2:36 PM
>=20
> On 8/30/2024 11:02 AM, Parav Pandit wrote:
> >
> >> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Sent: Friday, August 30, 2024 8:02 AM
> >>
> >> On 8/15/2024 5:34 PM, Parav Pandit wrote:
> >>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>> Sent: Thursday, August 15, 2024 1:53 PM
> >>>>
> >>>> On 8/13/2024 2:55 PM, Parav Pandit wrote:
> >>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>> Sent: Tuesday, August 13, 2024 11:44 AM
> >>>>>>
> >>>>> I removed the unreachable intel email id as every single email is
> >>>>> bouncing
> >>>> from it.
> >>>>> Please consider dropping that email from v8 as it will cause all
> >>>>> reviewers
> >>>> email to bounce.
> >>>>>> On 8/13/2024 1:50 PM, Parav Pandit wrote:
> >>>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>>>> Sent: Tuesday, August 13, 2024 11:15 AM
> >>>>>>>>
> >>>>>>>> On 8/13/2024 12:42 PM, Parav Pandit wrote:
> >>>>>>>>> Hi Lingshan, David,
> >>>>>>>>>
> >>>>>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>>>>>> Sent: Thursday, August 1, 2024 5:05 PM
> >>>>>>>>>>
> >>>>>>>>>> This commit allows the driver to suspend the device by
> >>>>>>>>>> introducing a new status bit SUSPEND in device_status.
> >>>>>>>>>>
> >>>>>>>>>> This commit also introduce a new feature bit
> VIRTIO_F_SUSPEND
> >>>>>>>>>> which indicating whether the device support SUSPEND.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> >>>>>>>>>> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> >>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
> >>>>>>>>>> ---
> >>>>>>>>>>  content.tex | 75
> >>>>>> ++++++++++++++++++++++++++++++++++++++++++++++-
> >>>>>>>> ----
> >>>>>>>>>> --
> >>>>>>>>>>  1 file changed, 65 insertions(+), 10 deletions(-)
> >>>>>>>>>>
> >>>>>>>>>> Changes from V6:
> >>>>>>>>>> - the device should hold its config interrupt while SUSPEND,
> >>>>>>>>>> and send config interrupt when the SUSPEND bit is cleared.
> >>>>>>>>>> - while SUSPEND, the driver MUST NOT access Device
> >>>>>>>>>> Configuration Space
> >>>>>>>>>> - minor changes.
> >>>>>>>>>>
> >>>>>>>>>> Changes from V5:
> >>>>>>>>>> - the device should present NEEDS_RESET if failed to suspend
> >>>>>>>>>> - allow the driver access device status in the config space wh=
en
> >>>>>>>>>>   suspended if it is implemented in config space.
> >>>>>>>>>> - language improvements
> >>>>>>>>>>
> >>>>>>>>>> Changes from V4:
> >>>>>>>>>> - re-order the device status bits section
> >>>>>>>>>> - kick vqs --> notify vqs
> >>>>>>>>>>
> >>>>>>>>>> Changes from V3:
> >>>>>>>>>> - allow the driver clearing the SUSPEND bit to resume the
> device.
> >>>>>>>>>> - disallow access to config space while suspended.
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/content.tex b/content.tex index 0a62dce..2d1bee8
> >>>>>>>>>> 100644
> >>>>>>>>>> --- a/content.tex
> >>>>>>>>>> +++ b/content.tex
> >>>>>>>>>> @@ -36,19 +36,22 @@ \section{\field{Device Status}
> >>>>>>>>>> Field}\label{sec:Basic Facilities of a Virtio Dev
> >>>>>>>>>>      this bit.  For example, under Linux, drivers can be
> >>>>>>>>>> loadable
> >> modules.
> >>>>>>>>>>    \end{note}
> >>>>>>>>>>
> >>>>>>>>>> -\item[FAILED (128)] Indicates that something went wrong in
> >>>>>>>>>> the guest,
> >>>>>>>>>> -  and it has given up on the device. This could be an
> >>>>>>>>>> internal
> >>>>>>>>>> -  error, or the driver didn't like the device for some
> >>>>>>>>>> reason, or
> >>>>>>>>>> -  even a fatal error during device operation.
> >>>>>>>>>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and
> >>>>>>>>>> +ready to
> >>>>>>>>>> +  drive the device.
> >>>>>>>>>>
> >>>>>>>>>>  \item[FEATURES_OK (8)] Indicates that the driver has
> >>>>>>>>>> acknowledged all
> >>>>>>>> the
> >>>>>>>>>>    features it understands, and feature negotiation is complet=
e.
> >>>>>>>>>>
> >>>>>>>>>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and
> >>>>>>>>>> ready to
> >>>>>>>>>> -  drive the device.
> >>>>>>>>>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated,
> >>>>>> indicates
> >>>>>>>>>> +that the
> >>>>>>>>>> +  device has been suspended by the driver.
> >>>>>>>>>>
> >>>>>>>>>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has
> >>>>>>>> experienced
> >>>>>>>>>>    an error from which it can't recover.
> >>>>>>>>>> +
> >>>>>>>>>> +\item[FAILED (128)] Indicates that something went wrong in
> >>>>>>>>>> +the guest,
> >>>>>>>>>> +  and it has given up on the device. This could be an
> >>>>>>>>>> +internal
> >>>>>>>>>> +  error, or the driver didn't like the device for some
> >>>>>>>>>> +reason, or
> >>>>>>>>>> +  even a fatal error during device operation.
> >>>>>>>>>>  \end{description}
> >>>>>>>>>>
> >>>>>>>>>>  The \field{device status} field starts out as 0, and is
> >>>>>>>>>> reinitialized to 0 by @@ -
> >>>>>>>>>> 60,8 +63,9 @@ \section{\field{Device Status}
> >>>>>>>>>> Field}\label{sec:Basic Facilities of a Virtio Dev
> >>>>>>>>>> initialization sequence specified in \ref{sec:General
> >>>>>>>>>> Initialization And Device Operation / Device
> >>>>>>>> Initialization}.
> >>>>>>>>>> -The driver MUST NOT clear a
> >>>>>>>>>> -\field{device status} bit.  If the driver sets the FAILED
> >>>>>>>>>> bit,
> >>>>>>>>>> +The driver MUST NOT clear a \field{device status} bit other
> >>>>>>>>>> +than SUSPEND except when setting \field{device status} to 0
> >>>>>>>>>> +as a transport-specific way to initiate a reset. If the
> >>>>>>>>>> +driver sets the FAILED bit,
> >>>>>>>>>>  the driver MUST later reset the device before attempting to
> >>>>>>>>>> re-
> >>>>>> initialize.
> >>>>>>>>>>  The driver SHOULD NOT rely on completion of operations of a
> >> @@
> >>>>>>>>>> -99,10
> >>>>>>>>>> +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities
> >>>>>>>>>> +of a Virtio Device
> >>>>>>>>>> / Feature B  \begin{description}
> >>>>>>>>>>  \item[0 to 23, and 50 to 127] Feature bits for the specific
> >>>>>>>>>> device type
> >>>>>>>>>>
> >>>>>>>>>> -\item[24 to 41] Feature bits reserved for extensions to the
> >>>>>>>>>> queue and
> >>>>>>>>>> +\item[24 to 42] Feature bits reserved for extensions to the
> >>>>>>>>>> +queue and
> >>>>>>>>>>    feature negotiation mechanisms
> >>>>>>>>>>
> >>>>>>>>>> -\item[42 to 49, and 128 and above] Feature bits reserved for
> >>>>>>>>>> future extensions.
> >>>>>>>>>> +\item[43 to 49, and 128 and above] Feature bits reserved for
> >>>>>>>>>> +future
> >>>>>>>>>> extensions.
> >>>>>>>>>>  \end{description}
> >>>>>>>>>>
> >>>>>>>>>>  \begin{note}
> >>>>>>>>>> @@ -629,6 +633,53 @@ \section{Device
> >> Cleanup}\label{sec:General
> >>>>>>>>>> Initialization And Device Operation /
> >>>>>>>>>>
> >>>>>>>>>>  Thus a driver MUST ensure a virtqueue isn't live (by device
> >>>>>>>>>> reset) before removing exposed buffers.
> >>>>>>>>>>
> >>>>>>>>>> +\section{Device Suspend}\label{sec:General Initialization
> >>>>>>>>>> +And Device Operation / Device Suspend}
> >>>>>>>>>> +
> >>>>>>>>>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
> >>>>>>>>>> +SUSPEND bit in \field{device status} to suspend a device,
> >>>>>>>>>> +and can clear the SUSPEND bit to resume a suspended device.
> >>>>>>>>>> +
> >>>>>>>>>> +\drivernormative{\subsection}{Device Suspend}{General
> >>>>>>>>>> +Initialization And Device Operation / Device Suspend}
> >>>>>>>>>> +
> >>>>>>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set
> or
> >>>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
> >>>>>>>>>> +
> >>>>>>>>>> +Once the driver sets SUSPEND to \field{device status} of the
> >> device:
> >>>>>>>>>> +\begin{itemize}
> >>>>>>>>>> +\item The driver MUST re-read \field{device status} to
> >>>>>>>>>> +verify whether the
> >>>>>>>>>> SUSPEND bit is set.
> >>>>>>>>>> +\item The driver MUST NOT make any more buffers available to
> >>>>>>>>>> +the
> >>>>>>>> device.
> >>>>>>>>>> +\item The driver MUST NOT access any virtqueues or send
> >>>>>>>>>> +notifications for
> >>>>>>>>>> any virtqueues.
> >>>>>>>>>> +\item The driver MUST NOT access Device Configuration Space.
> >>>>>>>>>> +\end{itemize}
> >>>>>>>>>> +
> >>>>>>>> Hi Parva
> >>>>>>>>> Do we agree that
> >>>>>>>>> a. suspending a device is non frequent operation (in order of
> >>>>>>>>> N
> >>>>>>>> operations/sec, where N is roughly in range of 10 or 100) per
> device?
> >>>>>>>> Ideally it should not be often in normal operations, but
> >>>>>>>> remember we can not restrict the behaviors of the driver, so we
> >>>>>>>> must be able to handle the scenario in which SUSPENDING is
> often.
> >>>>>>> Sure. the intent is slow rate, but one can do at unexpected times=
.
> >>>>>>> Do you agree?
> >>>>>> I think we don't have an intention of the frequency in the spec.
> >>>>> Sure.
> >>>>>
> >>>>>> The spec only provides generic mechanisms and interfaces.
> >>>>> Sure.
> >>>>>
> >>>>>> Don't assume it(or driver wants it to be) would be often or not,
> >>>>>> that depends on the driver.
> >>>>> As you rightly said : it cannot be assumed.
> >>>>> The driver will read the device status right after it wrote it.
> >>>>> This typically is <
> >>>> 50nsec of time.
> >>>>> The suspend operation for a net device to store hundreds of
> >>>>> queues, RSS
> >>>> table, flow filters, takes plenty of time (at least more than 50nsec=
 :) ).
> >>>>> Similarly for the GPU to store some MBs of memory takes more than
> >>>>> 50nsec
> >>>> of time, for example to store in a file for a software-based GPU dev=
ice.
> >>>>> So a device cannot respond back suspend=3Dtrue in next 50nsec time.
> >>>> It's OK for the device to take longer time to respond, the driver
> >>>> simply re-reads device status.
> >>> Sure, the issue is, when the driver re-reads, the device must
> >>> present
> >> suspend=3Dfalse within 50nsec.
> >>> (because device didn't suspend it yet).
> >>>
> >>> As I explained in previous email, this requires building special circ=
uitry.
> >>> Such circuitry can be avoided if the suspend interface is done
> >>> slightly
> >> differently.
> >> why there is a constraint condition of the time?
> > Because this is what driver does as you explained in [1] indicating "we=
 must
> be able to handle ..."
> >
> > [1]
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore
> > .kernel.org%2Fvirtio-comment%2Fc4d5eed3-774b-4d35-a007-
> f9dff28ce884%40
> >
> amd.com%2FT%2F%23m6f081f96ef9dcea29c64a88b633eb21d50e8c410&dat
> a=3D05%7C0
> >
> 2%7Cparav%40nvidia.com%7C4a248d6982514660015808dccbf79c55%7C430
> 83d1572
> >
> 7340c1b7db39efd9ccc17a%7C0%7C0%7C638609511605195425%7CUnknown
> %7CTWFpbG
> >
> Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> Mn0%
> >
> 3D%7C0%7C%7C%7C&sdata=3DGj4oG8Z1O7wEl%2B7Mbud%2BbP31aMDMAFA
> H9ElHJSvBTUA%
> > 3D&reserved=3D0
> The sentence is "we must be able to handle the scenario in which
> SUSPENDING is often", where do you see any constraint conditions of time?
If the device takes X usec, how can the device inform that, it suspending i=
n progress without flipping the polarity?

> >
> >> Are there any similar
> >> constraining for other states like RESET or DRIVER_OK? Don't assume
> >> any other states transitions are faster than SUSPEND.
> > DRIVER_OK does not suffer from it because it is async notification.
> > A device may start slow after DRIVER_OK.
> > SUSPEND operation cannot rely on such async behavior.
> The driver can set suspend and re-read & wait. This is a common routine i=
n
> the driver.
> >
> > RESET also suffers from similar inefficiencies.
> > But that is because it is inherited from the past.
> >
> > Here a new functionality is being proposed and it has a chance for effi=
cient
> device implementation.
> > Therefore the request is to improve it.
> sure, as long as we confirm this new register apply for all device status
> transitions, not only for SUSPEND.
Alright, please do it as you suggested here.

> >
> >>>>> More below.
> >>>>>
> >>>>>>>>> b. A software-based device may not always want to force
> >>>>>>>>> VM_EXIT on read
> >>>>>>>> and write on the device_status register?
> >>>>>>>> Trap and Emulation is the basic of virtualization, and how to
> >>>>>>>> pass-through a device is out of this spec.
> >>>>>>>>
> >>>>>>> Sure, I didn't suggest to put such things in the spec.
> >>>>>>> My question is, whether to trap and emulate or not is a choice
> >>>>>>> of the
> >>>>>> software.
> >>>>>>> Do you agree?
> >>>>>> The device emulator does not know anything about whether trapped
> >> or
> >>>> not.
> >>>>>> Trapping and Emulation is a hypervisor thing.
> >>>>>>
> >>>>>> If here "software" refers to the device emulator, then Yes, it is
> >>>>>> not the emulator's decision. And the device should not be aware
> >>>>>> of VM_EXIT & VM_ENTRY.
> >>>>>>
> >>>>> Right. So a software wants to implement device_status as pure MMIO
> >>>> writes. (and not VM_EXIT).
> >>>> This is not always true, there can be VM_EXIT of pure emulated
> >>>> devices.
> >>> I am not denying that VM_EXIT can/cannot be there.
> >>> I am saying, the proposal forces VM_EXIT based approach in my
> >> understanding of this patch.
> > [MARKER_1]
> >
> >>> If that is not true, may be can you please explain how this can be
> >> implemented without VM_EXIT?
> >>> We should have an interface that can be done with and without
> >>> VM_EXIT
> >> method at least for any new additions.
> >> VM_EXIT is out of spec, it is a hypervisor and the processor thing.
> > You keep repeating VM_EXIST is out of spec.
> > I already replied at [MARKER_1], sure it is out of spec, the current ap=
proach
> forces one to do VM_EXIT based approach.
> > And if not, please explain, how can it be achieved?
> It is not the current solution force the hypervisor & guest to perform
> VM_EXIT.
I read it few times but couldn't parse it.
Can you please explain how your proposal works WITHOUT VM_EXIT?
If not, you can say, that current proposal is limited to force VM_EXIT.
Please explain.

> In basic virtualization, any access to hypervisor emulated HW registers w=
ould
> be Traped and Emulated, means a VM_EXIT and a VM_ENTRY.
That was not my question, my question is how to achieve without VM_EXIT?
You are suggesting a spec that forces VM_EXIT.

> >
> >> In non-pass-through case, any register access are sensitive and will
> >> trigger VM_EXIT. Like RESET or DRIVER_OK needs to access
> >> device_status, nothing different.
> > I don't think you understood the point.
> > Let me repeat, The question is, if the device implementation wants to
> achieve the functionality without VM_EXIT, what is the way?
> Map the register to guest address space, out of the spec.
And which component will flip the bit of suspend before driver reads it to =
indicate that device is still_suspending?

> >
> >>>> The
> >>>> HW registers are sensitive resource and any access to them need to
> >>>> be trapped and emulated.
> >>> This does not apply to PCI PFs and VFs which are HW devices (mainly
> PFs).
> >>> so this trap + emulation is narrow view that we better avoid.
> >> This is how *basic* virtualization work, once access sensitive resourc=
e,
> trap it.
> >>> If you think this is the way forward, you should put forward in
> >>> patch as
> >> MUST requirement.
> >>> and that does not look right to me.
> >>> I hope you also don't mean to force this method to device
> >> implementations.
> >>> Right?
> >> Again, VM_EXIT is a hypervisor thing,=A0 out of spec. Whether there is
> >> a VM_EXIT when setting SUSPEND totally depends on the virtualization
> >> solution. And SUSPEND is nothing different from DRIVER_OK.
> >>
> > Please avoid repeating the point that VM_EXIT is hypervosor thing.
> > No one asked to put this in spec. Please re-read [MARKER1]. You probabl=
y
> missed that.
> >
> > SUSPEND is different than DRIVER_OK. I explained the timing constraints
> and the required circuitry needed to fulfill the proposal.
> > And with the additional register, such complicated circuitry can be eas=
ily
> avoided.
> Please read QEMU code, that can help you find how the trap - emulate
> mechanism work for guest when it tries to access sensitive resources.
I am not suggesting trap and emulation. Please come out of this looping tho=
ughts.

I repeat my question, please explain how does suggested solution works with=
out VM_EXIT?
From your response, I derive it cannot. Can you please confirm?

> >
> >> Means, if your virtualization needs to trap SUSPEND, it also needs to
> >> trap DRIVER_OK, and don't assume DRIVER_OK is faster than SUSPEND.
> > DRIVER_OK is by law of physics is faster than SUSPEND because it does n=
ot
> demand the driver of reading back.
> > There is no driver side loop to check if the device accepted DRIVER_OK =
or
> not.
> > Agree?
> Why do you assume so?=20
I am not assuming. It is the current spec. :)
Please read the device initialization sequence, that does NOT say that driv=
er must READ DRIVER_OK.
Hence by law of physics it is faster.

> In some vendor implementation, DRIVER_OK can be
> slow. Can DRIVER_OK implement a deferred initialization even deferred
> resource allocation? Does the spec say that DRIVER_OK must be faster?
No. it does not. But your suspend proposal says so that device must respond=
 back before the next read arrives from the driver.

> >
> >>>>> And prefer to returning SUSPEND=3Dtrue at slow pace.
> >>>>> This means, the device implementation cannot immediately return
> >>>> suspend=3Dtrue right after it was written.
> >>>>> A MMIO read will read it back, as suspend=3Dtrue.
> >>>>>
> >>>>> An alternative would be, to forward CPU loads and CPU stores to
> >>>>> different
> >>>> address.
> >>>>> However, this does not work for the hw based devices.
> >>>>>
> >>>>> That means, PCI HW needs to return suspend=3D0, until the device is
> >>>>> not
> >>>> suspended.
> >>>>> In this example, the device cannot build special circuitry to
> >>>>> answer
> >>>> suspend=3Dtrue within 50nsec, or in other words building special
> >>>> circuitry to return suspend=3Dfalse is too complex for the slow oper=
ation.
> >>>> why? The device can just not to change the value of the SUSPEND bit
> >>>> before it has fully suspended.
> >>> When driver wrote, it wrote suspend=3Dtrue, And device returns
> >>> suspend=3Dfalse while suspend is ongoing, right?
> >>> If yes, this is expensive because the device needs to operate within
> >>> 50nsec
> >> or less to answer suspend=3Dfalse.
> >>> And even worst, it needs to suspend=3Dtrue when unsuspending within
> >> 50nsec when resuming is ongoing.
> >> again, there is not a 50nsec constraining and please take a reference
> >> of how DRIVER_OK work with virtualization.
> > There is. The device is expected to return back the desired value to in=
dicate
> driver that suspend is ongoing.
> > It is different than DRIVER_OK.
> where does the spec or any code say 50nsec?
Your spec and your previous comment implies that when device is busy suspen=
ding, it must returned the toggled value than what driver set it.
Isn't it? It means device needs to react before the next read arrives from =
the driver, isn't it?
I took that read as 50nsec example as you explained previously that driver =
will read very fast.

> >
> >>>>> If this understanding of burden is clear,
> >>>>>
> >>>>> The proposal is, can you please extend the interface such that,
> >>>>>
> >>>>> 1. driver writes suspend command.
> >>>>> 2. driver reads suspend_status, and receives not_completed=3D(false=
).
> >>>>> This is
> >>>> the default value.
> >>>>> 3. When the device completes suspend, it changes the polarity of
> >>>> suspend_status=3Dtrue.
> >>>>> This has two main benefits:
> >>>>> [A] This will enable software-based devices to write data to slow
> >>>>> files and
> >>>> does not have to force VM_EXITs.
> >>>>> [B] It also enables hw based devices to not build special
> >>>>> circuitry to answer
> >>>> within 50nsec, which can get very complicated for tens or hundreds
> >>>> of PCI PFs.
> >>>> I think we have already discussed on this before in V5, and Jason
> >>>> has some insightful comments
> >>>>
> >>> Unfortunately, not. His comment was that it is not specific to suspen=
d.
> >>> But here we are introducing a new interface and functionality that
> >>> does not
> >> need to suffer or follow anything that may not be efficient.
> >>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor
> >>
> %2F&data=3D05%7C02%7Cparav%40nvidia.com%7C4a248d6982514660015808
> dccbf79
> >>
> c55%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6386095116052
> 07133%7
> >>
> CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB
> TiI6Ik
> >>
> 1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DVGOfVe0deSDilzufY7NH
> gU5RmciNh
> >> dXMMQiVUSiP%2BKM%3D&reserved=3D0
> >>>> e.kernel.org%2Fvirtio-comment%2F20240612082055-mutt-send-email-
> >> mst%40
> >>
> kernel.org%2FT%2F%23mc817fc6ca12ff0bcbae62b43b6146a177ecf13a9&dat
> >> a=3D05
> >>
> %7C02%7Cparav%40nvidia.com%7C619c82b60b824ca03f8808dcc89beb4a%7
> >> C43083
> >>
> d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638605819247985989%7CUn
> >> known%7C
> >>
> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> >> CJXV
> >>
> CI6Mn0%3D%7C0%7C%7C%7C&sdata=3DVqmJmqt3k5tf3x4ihjE5Bd7u59GadOn
> >> OaOfJ5lvG
> >>>> 1DE%3D&reserved=3D0
> >>>>>> this is out of the spec anyway.
> >>>>>>
> >>>>>> Thanks
> >>>>>> Zhu Lingshan
> >>>>>>>> Thanks
> >>>>>>>> Zhu Lingshan
> >>>>>>>>>> +\devicenormative{\subsection}{Device Suspend}{General
> >>>>>>>>>> +Initialization And Device Operation / Device Suspend}
> >>>>>>>>>> +
> >>>>>>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
> >>>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
> >>>>>>>>>> +
> >>>>>>>>>> +The device MUST ignore all access to its Configuration Space
> >>>>>>>>>> +while suspended, except for \field{device status} if it is
> >>>>>>>>>> +part of the Configuration
> >>>>>>>>>> Space.
> >>>>>>>>>> +
> >>>>>>>>>> +A device MUST NOT send any notifications for any virtqeuues,
> >>>>>>>>>> +access any virtqueues, or modify any fields in its
> >>>>>>>>>> +Configuration Space while suspended.
> >>>>>>>>>> +
> >>>>>>>>>> +If changes occur in the Configuration Space while the
> >>>>>>>>>> +SUSPEND bit is set, the device MUST NOT send any
> >>>>>>>>>> +configuration change
> >>>>>> notifications.
> >>>>>>>>>> +Instead, the device MUST send the notification after the
> >>>>>>>>>> +SUSPEND bit has
> >>>>>>>>>> been cleared.
> >>>>>>>>>> +
> >>>>>>>>>> +When the driver sets SUSPEND, the device MUST either
> suspend
> >>>>>>>>>> +itself or set
> >>>>>>>>>> DEVICE_NEEDS_RESET if failed to suspend.
> >>>>>>>>>> +
> >>>>>>>>>> +If SUSPEND is set in \field{device status}, when the driver
> >>>>>>>>>> +clears SUSPEND, the device MUST either resume normal
> >> operation
> >>>>>>>>>> +or set
> >>>>>>>>>> DEVICE_NEEDS_RESET.
> >>>>>>>>>> +
> >>>>>>>>>> +When the driver sets SUSPEND, the device SHOULD perform
> the
> >>>>>>>>>> +following actions before presenting that
> >>>>>>>>>> the SUSPEND bit is set to 1 in the \field{device status}:
> >>>>>>>>>> +
> >>>>>>>>>> +\begin{itemize}
> >>>>>>>>>> +\item Stop processing more buffers of any virtqueues \item
> >>>>>>>>>> +Wait until all buffers that are being processed have been use=
d.
> >>>>>>>>>> +\item Send used buffer notifications to the driver.
> >>>>>>>>>> +\end{itemize}
> >>>>>>>>>> +
> >>>>>>>>>>  \chapter{Virtio Transport Options}\label{sec:Virtio
> >>>>>>>>>> Transport Options}
> >>>>>>>>>>
> >>>>>>>>>>  Virtio can use various different buses, thus the standard is
> >>>>>>>>>> split @@ -872,6
> >>>>>>>>>> +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> >>>>>>>>>> +Feature
> >>>>>>>>>> Bits}
> >>>>>>>>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device /
> >>>>>>>>>> Feature Bits} for
> >>>>>>>>>>  	handling features reserved for future use.
> >>>>>>>>>>
> >>>>>>>>>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that
> >>>>>>>>>> + the driver
> >>>>>> can
> >>>>>>>>>> +   trigger suspending the device via the SUSPEND flag
> >>>>>>>>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device
> >>>>>>>>>> + Status
> >> Field}.
> >>>>>>>>>> +
> >>>>>>>>>>  \end{description}
> >>>>>>>>>>
> >>>>>>>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved
> >>>>>>>>>> Feature Bits}
> >>>>>>>>>> --
> >>>>>>>>>> 2.45.2
> >>>>>>>>>>

