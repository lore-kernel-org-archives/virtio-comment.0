Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8F12E7170
	for <virtio-comment@lists.linux.dev>; Thu, 26 Jun 2025 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945224; cv=fail; b=ZcmvU1/V/lqVbU7xT6eF5VkdEQk/MLzBrKt0e4cL1dyZvtwjquUVSaZDeFH3uIG9o8eippdx9+JQgZkaN3ErO7bdCPOotE9XF4kl6u/aYCcG3gZurkYnVhuu8wyWaXQkKPO+zQOUJEikn5etM4De1exaRM1qoGCJ2OakhxR1g8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945224; c=relaxed/simple;
	bh=0D22hMZSQn/eXWV3100uFaMnGfHr008xK/p+//xvTOY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j1bfQX2q7fvFHv/2wD541N5WbC8jQSai3IAOee9YkrRU+SSAVVb/YTFb1Kl4qIA/yxvCoFDClUAW9fdq9IrmuAReBtaNNc4wFkTNYUHfcWoG20YqJS8dsXaJ/kCH/Dd21Kxp16nlL4bxJYpoRlUDbp6e76B6lT0GcDGSyzTAqhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tcuQK+J+; arc=fail smtp.client-ip=40.107.244.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tcuQK+J+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nic2lOoRrZcAEcc3lQVXfmbjQ4m03z+j42SUnehz1MC0jn7NidBn5SFSs/OjvL8UumC0VIbhfZ8BWboFnFlsMdl0ska2OyRCMzi0EqWTwXsoT4RYhRdF3wVIQY0muho4mnTeGZkRFqCZr6SwfiZuqVv+3AsleW1CHktcxK4eHPU3Q48UyZr8HvDaqdNnwbW86beTG+l/QgMy5NXal397YFYxkRxNNF+cadyNCUWXn/Cu8PIbe/nx5YCGyAOHKEjffZAR1zKQD+1rxkvxBK7DVrwbQ8D67g0F7KwuzwzyKto7Dtja6l7AH3Ei3xL5JudJJGb+Y5wQekYpZmDMkXxoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0D22hMZSQn/eXWV3100uFaMnGfHr008xK/p+//xvTOY=;
 b=KK17Vw0R2RjNKkSlRRmM1WIuGn+748Eo2naQLnNewsj3FIkR8WJ6Se+vXGGTAMCTMnwFGA8ldjsZm59IMx8vcfjpxo3bP+jZK+WB8MuL4Gt6fWEBYLBOl414MI2EXswLB8l3c75e8tEv63zUbITD+2eYZPqkw7NY46HeD5aUk9JAxgZID16U72nWfo01dsQc8wmKfT/tBL8yUeRuBTJzon0TWcijJmB7SLl1SHrHlb0zTr/GfOgBIU4bUtMP3Zx6ru1mV1MDkP/KJ98d21zzpcskvY8/2kzifkOSwFULHz9Jw8rxnXrxXGNXp/IuiT6hVhEavyYmaHTA/lTxd40Qmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0D22hMZSQn/eXWV3100uFaMnGfHr008xK/p+//xvTOY=;
 b=tcuQK+J+6ABSLLVaQWtAutfp4Gu6fsQrjB5Owo/7BEDA5yx5LFUDOI0M3pEp/8mqqv3qmLk6MUevtlj8lU2CNBwfRZzJ0xAk079rF6gE/DAEnvgw9pqWuAhcKshHtz3kNug4ntHm3SjWk5dNS9SjQdXnadriTxBM7u8QymmN4vVAKyvF/aSGbMqlTvt6JsOVxdTIXfv5cGJUlZ1hiG1/SPqWCgwT+6lRuNLZ/qgz8Q7+FJqvb5kPTp2FJYyzHNNtIPNqRX1UyyJB4r1CkGQy8Ncv+w3PfZRweWB/McY4pXKKcIVBDc7ebUBr/cjvV0WfwD8DcyBkEIuKQDAh1lwHpA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CY8PR12MB7124.namprd12.prod.outlook.com (2603:10b6:930:5f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 26 Jun
 2025 13:40:19 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 13:40:19 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@amd.com>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: RE: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
Thread-Topic: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
Thread-Index: AQHb5BoUXKPusOin/kiYESw2fMoAA7QVWGyQgAAbAACAAACOUA==
Date: Thu, 26 Jun 2025 13:40:19 +0000
Message-ID:
 <CY8PR12MB7195279118F1D536979C12E3DC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
 <20250623083637.296041-4-lingshan.zhu@amd.com>
 <CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <092e01c6-1756-4293-8183-8efea6720548@amd.com>
In-Reply-To: <092e01c6-1756-4293-8183-8efea6720548@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CY8PR12MB7124:EE_
x-ms-office365-filtering-correlation-id: a6cef17f-615a-4e93-8853-08ddb4b6fdf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hyI36p5E43RqE6Kmp4B+Lc/3feAgWTBbE6YTjEsrULQQj2/Wc732vOKaIUN1?=
 =?us-ascii?Q?IcmfHMord4atzQ1eRdqR6bjev/N/cWz51u5qPrsMGPRpvzwOpspUDK9LlErc?=
 =?us-ascii?Q?mwCG+vzwrP38qQmAH0FYXe8LmbYPufjfY1rN52zR+u6NzIoGje/3uudDVlo1?=
 =?us-ascii?Q?kaOEK/6502/JjbKzmjchW9oceAwQhCeurhDh2BezXVbFPsiOYfeYH3ejeZ1n?=
 =?us-ascii?Q?P3iVAEM6hwwCwp9XSJZyDkJl1hGYYLxzaevGR6tEx/IXHEAmv66vM/JJ5GmK?=
 =?us-ascii?Q?SF094ek0a4PfuK/ic2xm6j/Ed7aXL+GrXYHtB5gvkMEeaQ1A52ADxc7CIJyi?=
 =?us-ascii?Q?9hIp05+S7MAnta3nMTyqBRnlTD3BcgnsftMJgmWk+QumNcQGI6obybMpU/kj?=
 =?us-ascii?Q?DvTlz5bdq1ZfsSob/aW76NkpG+dLAQRQ46g5lMbUHV138cdwDYH7fgCbQRoF?=
 =?us-ascii?Q?epgHbjKnXQ0ShsxRWy9DaIsGSmVgRQy1m8RJYR0jrFlrjkdiDTf0L1QkjgCv?=
 =?us-ascii?Q?ceI5EwhpAn8d62v1xWkj9HRp1qas83GpNvFWQF38Dcx6/9qoXsxxxgS3/6nD?=
 =?us-ascii?Q?gfJ568T8P058ikYS8MEhgL9w2CflT5bADXQ6yG24qf2H2Y1Xk+1mVerHX1s9?=
 =?us-ascii?Q?YoazhDSrpsr04jx7Hfv2FF2cwh5YTG71ZUzZc7b70L2EfXOeWR/7THd28aQy?=
 =?us-ascii?Q?ZgvqXSGdavfN772O7D11OcqnPXoUmZXHFZ9mNBfX5gP1ZMrSU8tevjpmd/kR?=
 =?us-ascii?Q?/aTIHorpSk9LgHy+ttARhqSQrSPaA12zmCyBpC4JawG15bmPQEX6M7Q1k9rq?=
 =?us-ascii?Q?DsVbKultnM2VGy/1FcegVpXTRi7AbaIwjYoF1VOzXW4LpSCZShI6jxv2gEEQ?=
 =?us-ascii?Q?y4laxoKwZD+iDlPkbcCbCppgGr5/u6sRIbpeOriEt40RmaF54ugFLFCMnDWA?=
 =?us-ascii?Q?OxTwbPs0UbX6AnuMsQUWKPd/7RyF8cKhcos57fb70r+erAVA5YczLsA9c++h?=
 =?us-ascii?Q?7RR20ehraGBJKcPso7ZCgtyDFo/z15SqnGwz0PfJYMvGbtcL3vxhByt+Duii?=
 =?us-ascii?Q?TYi90jQeyjxFlOnGdl++hoEyx767m05vAFtQSHS+P7sfL/6LQ1/4SpbfzAFd?=
 =?us-ascii?Q?PYE3yb6VyZ5O82/Sk7u6BpMbwYClf/uM7S+venlkArebGY7uXVK4AN9Z3jAT?=
 =?us-ascii?Q?Vv6pxKyJD6KATajrUJvB4+7bixHegbldNncyeRpmQIPMf91RNFpT2/orQt3B?=
 =?us-ascii?Q?V/JVCCq+r3y5CZ+FfrzRZ+QX2p/2BN0nUO3L2K1SlkDxhhA1vfFMqelNSh3/?=
 =?us-ascii?Q?i1mhPmC8Crv4Armcext8JeQVX5Zn+UYlPKEVDbmgSZEz8u5PfVs+o83tsj73?=
 =?us-ascii?Q?gwTS124z/tmPqI8dFX83QrZVuz/9xBuE+8IQihTxkuthNqhnULzCmKQDjLaP?=
 =?us-ascii?Q?h8XnlQa4n3Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9PaCnINkJ/NWWy59I1Fjn078T/Cc7c0jeNTQSGX3FJf+C637KkWemDiL+SmQ?=
 =?us-ascii?Q?Lns5q0eMKGEOzTKWPqyTx1jTxZ6EJTMMnUr44Dlm7Y9UZTf93UxBWBkkniX4?=
 =?us-ascii?Q?BJEQ1Pp7NlkFptq3kRZ8b6GS5jIM4RqVXE48u3FYUPbhKJYL7ptZXcxus5gY?=
 =?us-ascii?Q?x9VCQb5Cy7lKMqyN38w1yo5tt1WQWhtqve0QkrTZzLv4mxxYhIwM+MmEioTM?=
 =?us-ascii?Q?qCHMMwxUbfj1UDzZEJSuuTwvnzHvppRK1fyZx0GWJp1ufRzkz9o86lv+8HW8?=
 =?us-ascii?Q?U7Wi9siLR/UlmrUkkVJZIqF8MJCrKM7No1cOoW/qz/0pm/e2cZQ2ejZi2Qtx?=
 =?us-ascii?Q?PRVzDy1UBKqU0GbKHXESFW9NqMUidjFFFsn3fRBeOIFP11FMGawdjwP3CKTC?=
 =?us-ascii?Q?U+nnJ39ueGvF+aq49/AHc6K2CTKnf/+F9UcSsht/ofQV4oPozb7LF6P1lYWy?=
 =?us-ascii?Q?xeEITO1gv2im8X/ffIP/RKmnpRUyey29hoG4Wim+QQcdwgZwJZzPMl3UZsA9?=
 =?us-ascii?Q?QD3X58kcZIYMd3UJKz4z3n8QbZOOFuZQpg7chvULyqhERu1dSAC/NQgtyedL?=
 =?us-ascii?Q?7mqNwC2LOhdWjIkgWQX5zTccs6fxFjiecLFENsuE/RqHo8Sq557j4UmwnGCi?=
 =?us-ascii?Q?P/kS1zCOjKQ6hcrWCHX1U/0GfU8o/BLddLzwfmERLdYDt5Z62994keod7zJ9?=
 =?us-ascii?Q?shaTuwdr96Pg9zOVL64wzpJfYjWYQjTZwwMQz8YXRLyNAUYSI0240NNSGeDy?=
 =?us-ascii?Q?bMLbTvicSO57OWmxEOj/EeyHrVNxeLFdObyd/qXrxKRvHyZBdxpYqb1d6U9x?=
 =?us-ascii?Q?O4nGG5R2AXnQ1mp6mj+EiQ4JB+SBCTMRupeFQNqkNguitcLqgqoIzN3lvgmj?=
 =?us-ascii?Q?ia/HAIlpoUUABYmuWZ5PgT40QZ8NIzExlTCV+GRVolBVyVzqZ8Csy+HV86+/?=
 =?us-ascii?Q?ysEx8/gX2vb75gwzIKNNSWUu6UyDJu8Smdit0vdHoJz7gRSjv9wyfURBwScT?=
 =?us-ascii?Q?v714psLHPdkU1dal/pN3NatfN1co6vSs8UB6+AC4+LlU0c7ydmOvOEJmEU1t?=
 =?us-ascii?Q?6YXmvP12qB/scf7GFtC7V63ijKxZTHt8TLNbV5+ELimgYrn0FatcuuFL2FyH?=
 =?us-ascii?Q?AfsrNZpKnnU/bzGUrfBScVRbLtXqBK/1yf+Fh9Ojjb2tko3cnWPggqabrUWd?=
 =?us-ascii?Q?CpHuETMDTnaJmk7FdUZsU4IUYp/XI2SQRIUNgujCuxxs7FI90SpUZ8+hUCQY?=
 =?us-ascii?Q?Es+scKQKl155B9TDNRlLK3mKnQDJqk4q03RTkJQY5/BXrpSQqh/OYL4UHsRb?=
 =?us-ascii?Q?1aScntLMJ22pdLkaKgvjfY23lHB0o0PpInvgQjyxe6ZJ4Pb2Wk7kt/C6+O5C?=
 =?us-ascii?Q?zZnyZ94hNKfTvmowQijjM2Fid0/0a2NVFI/fqLPLRiXV6QIkOWGfN6uQAL7R?=
 =?us-ascii?Q?6NIf/DV6cMd7/zKabFFk1Utwr+XZja3j2mW9BYx+NuKM5hyfo+p3fSJyifRs?=
 =?us-ascii?Q?H9RamH+FyD7Cnq3A/cjlSdBAnY4aYmdvzqoo+wGW+u7hGWQqrLxLuAhAnNbb?=
 =?us-ascii?Q?nkGHc9aEPCD88A5ikWI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cef17f-615a-4e93-8853-08ddb4b6fdf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 13:40:19.4264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OzqipMLsjdBT1qJAMtnUhEFq66/SB75eZcDY7Ixk8wwZ6/Vhin1juO6LlPZYJitqV1V9k4CmT71an99TQeyzXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7124

> From: Zhu, Lingshan <lingshan.zhu@amd.com>=20
> Sent: 26 June 2025 06:56 PM

[....]

I wont be able to reply to this non text format inline.
So please find the reply here.

I will not be able to take RFC 2119 keywords sprinkled in general descripti=
on into the spec.

Even worse, they are sprinkled non-consistently sometimes "SHOULD" and some=
times "should" in your patch.

Virtio spec restricts usage of those keywords only in the requirements sect=
ion.
Existing spec is an example of it in all the sections.

Please refer to the rest of the spec for such nomenclature.
The reasons are also explained in [1]. Please refer [1].

You didn't answer 'why is it so hard for your patch to follow the current s=
pec nomenclature.'=20
i.e. to change 4 words...
If there is no reason, I do not want to debate on this anymore.
Both of us have more important things to do in virtio and otherwise. :)

And I didn't ignore your comments, I replied with [2], which the last email=
 in the thread.

[1] https://lore.kernel.org/virtio-comment/CY8PR12MB71957FB8A0337FB62A1CDB4=
1DC6AA@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m3ea175d50e7ffc9816a32238=
4e6766492215469f
[2] https://lore.kernel.org/virtio-comment/CY8PR12MB71957FB8A0337FB62A1CDB4=
1DC6AA@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m5d09faabdaf91a97b5844b04=
0a19f5700c377870
