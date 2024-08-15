Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7257DA92
	for <virtio-comment@lists.linux.dev>; Thu, 15 Aug 2024 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723719592; cv=fail; b=GBSGGzdDTMLW9X6gUU4r0jlpw1se9Vo5z0gr+VbFvrMW/ksV5ZkSX3r+8zHDWxFjlwAhBw5+IxwDBIuNpiGZ+kJeSUz07wXn5iwtislc+MA9uTe/gaK4AC1XJc6++oecoVt35DHM1JWQ16i5r4uxJ8XqodvU7Diga4koNwmxeOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723719592; c=relaxed/simple;
	bh=eE5xsw//Rk3ETM3JvKbnOSazB9IWlug3cm2yxKdRVTE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FrRBojM3eDO0KoI6tNXQNwAkCiIAzpaJsvO6bIihs7toepEd7KudbmNJ0nue+yuEQrZpD2mWrpvktw3JxD7ntnwvB3GSjOwtj3OvT885Mrmsff94LaZ/dLHBm88BHlQe76om0Ws0NZg8apuRwgZJszkMBSdoe0y9pUWc94l8zh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sX0vApV4; arc=fail smtp.client-ip=40.107.101.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sX0vApV4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4MYqUMKy6gDbALFZMts9n4VXFc8UVdPCKrY/t8m59Qh062G6CQ12jQBujyIw65LHJIFRtvj2w8hB4IL1r4rql8rA5ef9eePRjRiPI+g+c0Wr0eZiTiJAQibCRAV6UDTrJoSBNDlxUbkIS6y7BRgMDauriEGLCm3lkwW0r0plQUnrCxZwsu2MUvJs6D2HlnIQIaVZtd+CCKcdieXT4Hw22DsR24k0PJVJr+OWIfkZuvAMr9g5RS41dZhKUdhHBC/VvKzBUGdJgNHCf6efjz4fCoMz90HKbgWbi1/56aGLOUEiWB7b6o9Pn2B3/SEEr08U2xGNtaIiv7873uoHDf7/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eE5xsw//Rk3ETM3JvKbnOSazB9IWlug3cm2yxKdRVTE=;
 b=Ux/Q+E74pV8ZQdWPKp6mVCFtkP7yyWAlANixn/e5XPeF4+TQZqyKhyKn8OkXnqC/EyBa3rzQiqMwUJCkaSW4HiCvLgZUr+DTWCIGtdL3N4hnHwBRtOehm1IiSg951RVtOJ70WWaC4OU08k2vuyTHT162MhM/wNGBolqXJdIqCGbTlC2EwmrJsH+CFhx/mZZ1Bhdr1a2Df0HYlDkCh+w6m6G2ynAaK5o43WaDQY2tulpXpPbFDpHR3iTGiuBIhjFfqNXrl+HYr9CesEa9pma/8hhDCvW+hiXHOfagSxB34SEDP9a7dYd1C5OUlDD7cwtgJL5FdeDIWx1YWesyCfMR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eE5xsw//Rk3ETM3JvKbnOSazB9IWlug3cm2yxKdRVTE=;
 b=sX0vApV4J20dubqeZi5ql/hVlbT9cXzxGnWhi/fXXOqCom8tDo6+bDj2UEbsvGaIbhr3f7ilD7EAolwxoye3bdlie0O3QZK+tsHDRqNtGFCLpeN4NnZrqwur9ybbLAWVOd0VTSBF+6f7ZZwjfdSOI5x2LJ4mSLwIwiQC3xyyDw0lO/Jr6QQC+5qbg8TOvc3nqjR9MJ/EEncxgmlVbMYNXD5OimrnVmrLG+sw6A8Kf5yp/qZoVPI8DP49KZ3r3TSQ37IgNPx+4F7MB7TrvVHOiTj+uUY6UwuOpWU5BmyT6WF38cBlQeFRsdDSqUbRJF1sHyeVQGcRk5ICFXVNTjwMmg==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by MW4PR12MB6828.namprd12.prod.outlook.com (2603:10b6:303:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 10:59:45 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7849.021; Thu, 15 Aug 2024
 10:59:45 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Zhu Lingshan <lingshan.zhu@amd.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	=?iso-8859-1?Q?Eugenio_P=E9rez?= <eperezma@redhat.com>, David Stevens
	<stevensd@chromium.org>
Subject: RE: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA2yqgIAAAXfg
Date: Thu, 15 Aug 2024 10:59:45 +0000
Message-ID:
 <IA0PR12MB87139D0ABCD441C9EB10F5EFDC802@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240815065136-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240815065136-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|MW4PR12MB6828:EE_
x-ms-office365-filtering-correlation-id: a4a9886a-5424-4c97-dc7f-08dcbd195fac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?pQBZP3hN8b0RvzPxzdH+b3Xtzm8+U7QwrsJADwsy3crQa/dUrxutKTDrOH?=
 =?iso-8859-1?Q?JxF9svbBK+DRwxvm6ugWsuRyxdvwT6UoPbQd18jo8KSKAqrUHXuvaYxZV+?=
 =?iso-8859-1?Q?aITfJwyJfX6wmMsqTpugWolpVqHB15HB7Z2H84dQW3AVqJD7vTNhTWqfBJ?=
 =?iso-8859-1?Q?wYyqsRfxl0A5JhiOQGxPAmETd4j/rnq/MGbhwxaA7lowlsDrg++my6v1XY?=
 =?iso-8859-1?Q?HltEWFvznE8OMSksWL1sDanyfmpw0frIK8S1C1ycRC98zuIJgj6MztcpaB?=
 =?iso-8859-1?Q?Na1PdNnnKzcwztB3CcCza47FmVFHykm9oc2VphlHFk8bEehJ8JIJ8cOwkw?=
 =?iso-8859-1?Q?KXFpHBtwzVWvRI/2k0nO9t1GOcOC9dp5BUIvCbJ9JwfayoInGx4Q6MgDRA?=
 =?iso-8859-1?Q?psuPN43bXad713Q6URWLfazFll3lqbCMB8RFBG4jB04UgdT/A7XPVkJCM2?=
 =?iso-8859-1?Q?spYgpn3T010so2EHJaI2JhMp8OV37S8xkd5s4gPsXB1EwZiViJG0pclMjL?=
 =?iso-8859-1?Q?15xk/FA3320BmHrB0xYMCYUonl0syiHACA7VWmHm2Igyfzo3EXDjypbq9a?=
 =?iso-8859-1?Q?RH5el4i++LF3BgW5z3jatDqOKPCLDfhv9GhRsHPkCyVg9PCLPJo6ZUyA1O?=
 =?iso-8859-1?Q?4Gc49Z/+Ndvv89oA25SSB7UjuwxYRRmzdbPvgnGgSc/tr4wTx4Wvk5YHCg?=
 =?iso-8859-1?Q?G04HYZ5ms7GkXlQHshuVXSJTNti4g3HQOiM+bGxYDEt274d1BxuR/zCKa0?=
 =?iso-8859-1?Q?DJIHblkPSkL9bo3LXX1l+z/4+pHimLZE9TEBYlnsXJZWfWYn1m20viOV7E?=
 =?iso-8859-1?Q?Bazt9oHrmov1nuMPb8mVNfFXsc5EYST2ZAA7h9TQZI/mIZ5ixbZXZ8WA9N?=
 =?iso-8859-1?Q?A6fvIcuBZ9hgSGmpEKKQHlhYmv/DO7krmrukSSS1ks7nL7OlX1DnxGPMQ1?=
 =?iso-8859-1?Q?HtVXKLvXEcheJmgf5zwT+UhGkipk0ULkrIZGuTWDMl+/C4HLNZWO8nQLBD?=
 =?iso-8859-1?Q?swlTEqnLGa2uTL1CmcOcp/m4+/VX4t70Y+npGLYPq+Nd/oK2mc1v7iitE/?=
 =?iso-8859-1?Q?gcunapjQqcx7NQq2j0fTP2MBWK1MKsfA6mxIC14hVXKMSUiXX94Y2Bj6aQ?=
 =?iso-8859-1?Q?F3ot9rtFuMxnTbvuYBKbz7qZatAv2+4dz6hwXucLIqGjoRnRltFK+Ad0FI?=
 =?iso-8859-1?Q?d9/FYQzoaVvLkTuROWwyecFRuBZIvquYexwePcW30PpdSryPypvDVT4kt0?=
 =?iso-8859-1?Q?XaOoboMepKyeh7MmlCunHWXZ3++8L03q9bhU1YJEqGyxFxOtPQqiTR6Ch3?=
 =?iso-8859-1?Q?tRGQKgPNVUMqhiz7hdS6yv/dZqDtqPWryQ8tAcqTjApLWw6eIeebx8heuW?=
 =?iso-8859-1?Q?Eh5d1EIaJQfIzWknnYczBZB7cRFYrJGJnz9atTN+eyYFBjtmMZ6C/gHeO2?=
 =?iso-8859-1?Q?mmSMM4MTu0SyxTJT+SxMmYNwJFB1EyGnnHBmfA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kIxCVax3J0E5qTh9yW2IeojzpvwvFtn57UZJZ+C6leYU/mqEqfJxDZPfim?=
 =?iso-8859-1?Q?fA5f4bOtQGJqEiqNXtPq5z9t57tCysToulZy/ezj0AGWcJEsWqM1/g6Erj?=
 =?iso-8859-1?Q?FLCPtroMT5p1I1btDKgE1NPlIqj0zI23t1iTY2sAIx3hxEccGlwoQPYkXg?=
 =?iso-8859-1?Q?B5VGHEqKcYu1Hkjs6N7a1dSzSzVAoAhg/zCSCuigsTJYrLKAMHw7tc0mUh?=
 =?iso-8859-1?Q?OfwVU9b4COFG98VPb9MhdZL5Cap9rx8ImYrbRoZs0MykR65WvpknmsSiCy?=
 =?iso-8859-1?Q?7LUqOXqxWcNOxS8g+xgE5MdQ2hj3um/Fiohpqp3Fd/0dnR1eGooi76PPMS?=
 =?iso-8859-1?Q?8iWViuWte+lHDntVm4z25g1p910PLigaENRd0o9XpTiz4dXufUSfH6aXxu?=
 =?iso-8859-1?Q?euRljPKepnynTJQbAT7y1j+PLMCi+8mIg5KADxznZ/NMNjmwivZZSt8UXX?=
 =?iso-8859-1?Q?GqRdfKdO7IyGtGnP0S3lOIN8xeViu8RdPBkQOvwNWetozXO/ZdA6gS7zwg?=
 =?iso-8859-1?Q?NigjDdWR+4s4YFpgr62CXYPbfPrqypwSThI1GSuXiqJf1uwyDm5gss/Vd8?=
 =?iso-8859-1?Q?uWwa9/c9cYlPZo9LoxurLtj4yBeEpIgsDpJrQrQuMeHI1pZZCLTQG/D/1m?=
 =?iso-8859-1?Q?a2elB5YnmXE9xWLkEh/Ie8KiDryvmt28k48oCEKsLL0HyJX9HGnQHxxdvS?=
 =?iso-8859-1?Q?+cVW7cDsZFITIQ++TI3t3EwAI5OtU9H0Rn0pc4hX0Oq9u5DBNv0UEc06sl?=
 =?iso-8859-1?Q?hQIiGwCbhuldwy7gCh1sM7W6atH9N0qNR2EVkwkgFWXINKD1aTZLtcA9iY?=
 =?iso-8859-1?Q?xXu5iK4BIjoEGlCg/YDCQNBG+RayJ5wfW+c0HJ6+fc9FUeCFjt8tmnTdPv?=
 =?iso-8859-1?Q?SzfMDVZ5oBsLCjy8ftrx6Ohf7tB+JLNxHSvKulY/Oz4OXTDv2hebCxsI/1?=
 =?iso-8859-1?Q?tk+MlLIdvBHjl01c0+5t6GzMecis4L5BqyIOSLSE/8SUtcwuEbTP3AMNxZ?=
 =?iso-8859-1?Q?rTJ+ikgxIsctcMLGMyroh3/wM2XEO2eKcxm51O0Wqo0ljappNl6i5DOxmj?=
 =?iso-8859-1?Q?bb49PAR+1Xqzqt9WeM6wZQ7RKJdlQdfY5EyqniEweBm8ymm+Nnd0omnBfN?=
 =?iso-8859-1?Q?yiI7LhMS3IOWXZ3QpIPWo6KhOkQAnjJhDNRVV4SwpTm177Fpf2Ik8MXC++?=
 =?iso-8859-1?Q?gT2yIsHKnAU2jP2SMjNbZ7UhpqA+L8cutqEieUtTZseS+3WvRl8I7dTzSs?=
 =?iso-8859-1?Q?0r3D+ncGTeDuCuyIoC7XrFmTPbB0kCn1aou/2n2L0mm+sdI+TzFYHf/so5?=
 =?iso-8859-1?Q?BjJaCv3QoWVKzDgpI/J0Wyx7PGq3Ow5rm5UmNNUOc//QU8wU5sHlBBWGG1?=
 =?iso-8859-1?Q?Gc3fPiXQJefK0Nn4ohucyQl0vVr7kk5njT2H2vtrGh6X/Url6BlvhP/VlS?=
 =?iso-8859-1?Q?Bt6Iim9SSsrxEfPBj9QRXC9JRpKUGCo0awwvlC4Gxz8ld2iavIz7lRh2vD?=
 =?iso-8859-1?Q?YXMEkCHHebdnyn58fDsGdUvfdsbVLu28kfC3VOZSZnGQs0BTA44y+8amPD?=
 =?iso-8859-1?Q?S2Z1mOXtnqrF6l8RSVuzhMYgf85zi9Kt0qLzaKkXcZvAasAS29wuCJ1mPO?=
 =?iso-8859-1?Q?WKuphzu6z9ndA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a9886a-5424-4c97-dc7f-08dcbd195fac
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 10:59:45.6432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ieWUQk6hWpZ0UoM/3retKnhrBZ1mlynOqkEQQcsr85TwBWbXTYayP9+dt/Zvld2XN18J8aZZ/utc8pNP3RfgfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6828



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, August 15, 2024 4:23 PM
>=20
> On Tue, Aug 13, 2024 at 06:55:04AM +0000, Parav Pandit wrote:
> > That means, PCI HW needs to return suspend=3D0, until the device is not
> suspended.
> > In this example, the device cannot build special circuitry to answer
> suspend=3Dtrue within 50nsec, or in other words building special circuitr=
y to
> return suspend=3Dfalse is too complex for the slow operation.
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
>=20
> I read this several times, and I don't understand what is proposed.
> A special register for suspend/resume? Is this the difference?
>=20
Yes, a command register for suspend/resume operation.
And device_status new bit that Lingshan defined returns the status of this =
operation.
