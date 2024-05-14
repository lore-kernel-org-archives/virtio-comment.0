Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD28D6D1A7
	for <virtio-comment@lists.linux.dev>; Tue, 14 May 2024 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715700022; cv=fail; b=XOhDrJ8dGBNNs4jEYUCM6aehle6DzXxQF5d8UlCv9+0c2hzv2CHKhVTVt2y9FWSn1G1iE1TAvyWhn2r3gfAZ+0plPOsHUMthSRWDlbqDPwgjxF4QsKgxrIVRkZcSEu3BOAmGDODPGFP76Vqk5nF4FLYpldps7VEeddItlkm7dc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715700022; c=relaxed/simple;
	bh=7BnwiBs7ZiEhLVCcVTYANswtf9Gke2HR9LmxNGs4Sl8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iDtKiuLHa5TrMCnjt1LTTumkOo62uO4W+QD2pAYD+RIEKIScOfnbI1TlLkMJ/UrrNKW0u82EX5RfxnbPOMOdb0gip8a9ZKZy49/afLaDO4uf1SboYX224KOjyhh8yqtqbRq6TQ5vgtmdux2/hoRbO6cLvX1abgP3qqRz8DPXehc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bCYuFx5a; arc=fail smtp.client-ip=40.107.236.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bCYuFx5a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJhcmFHx/mXQQ6xAdyJ0/gjztZmhJMDdibje41mFgFK67KZ32yk/GXxUKz3F/FNaOqKkmYZmxHNwpP6amnW1H06oTcDpbrYwQVYl+yf5rMse9MoNF8Ppp/1qm1ooAjVM5KMnuU+FD3UXjbXuA/1EGmsHqNTlGRe5JizC3q6vq850DY1xCGeNeVBUYIK2R7RopF2JyXtcyQPVsaTDFfz/N2z9OBju2zBigcGYk7OUF6fIj6WHYsBAWBvu0kzxyu0QgKrEYhCJhE8qxA90YmbqnsrYYfOm0kmIR8NfWgNWONYm8uuWKza6gIBjn3EhYelsUMZOXTQD3C1AhnGe9Mpr0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BnwiBs7ZiEhLVCcVTYANswtf9Gke2HR9LmxNGs4Sl8=;
 b=P+6p57VAlgl1BvVCtizzgkVVzaaOyrh1TrZyqQcTp5CQUFSDEE2UveEHA08A4k4Gvg78X7W1WhOHTzsXDxFz30MD0AGWCHeWLBnrAD61nMMm1UHdo6ZdjpELE7cKvWYCfZTVm1GdM2s9rhI6prFv6Vh8Dkhppf+xLS55g+dVSsCL1xkGetBzaT4R/V0dU2hrmTIi//+mIIvpo16YqzPOZGA8dWysXp7xmmbBwykvarBFhJViEniS1gI4vmFZ8jMFr685y9xjpLrZXSK9u8scDCOcydBjV8Q4Xi6ZeaV8cSYCOnJ3W+oz3YjjC3JF/vea2zvh1mN8LdzQx6vntJLlFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BnwiBs7ZiEhLVCcVTYANswtf9Gke2HR9LmxNGs4Sl8=;
 b=bCYuFx5aaFiCChlbJNlu8q73ggdJNUPiCWPHKYTgpgVDJrPXEdjZDS6E4ste2kHEuY+ItkbauTgi0Yb1g0tVDuDgV6pZ5F+Zmimdoc9JcNZvz7yJ4uJ+XO3CW5pcX9dm/6kD7//svG6WnfDonLMgRkRL0cbsnYWd0cZWpftZ3zTGsnxkWB4IyOM7PbzKhK3jbk53TOe0nWSjOaZRcMzxlD8JTPxdaPHI72hp3L9cWK3RM8WaypTu+hMelNSnPYy28Z+ifm1CjkuMwhPTLG7nobTdDCVO7bqKLKynWO+v2foWcj/IYkSG+D25pHlkNcoInmo1z3sqJERaJwAIT6rc5A==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CH3PR12MB8511.namprd12.prod.outlook.com (2603:10b6:610:15c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Tue, 14 May
 2024 15:20:17 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 15:20:17 +0000
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: test email 1
Thread-Topic: test email 1
Thread-Index: AdqmEjjNqBMoHAKuST+jCTvpCZQ97Q==
Date: Tue, 14 May 2024 15:20:16 +0000
Message-ID:
 <PH0PR12MB5481F51C8BFE4BE1E1907BEADCE32@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB8511:EE_
x-ms-office365-filtering-correlation-id: 6f5143c9-afd5-492b-66b5-08dc74295c48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZmAs4gQPC1dehMJdSsxjVsIg7GLd/+yAl9Y93pbqjQCgrIbiZiRuSCfKRTkm?=
 =?us-ascii?Q?Z0CRDeEiMvCsMkJ928pu8QgLUHcE4adoFf7LwU6letgN4RELvIR84knQ8ZrK?=
 =?us-ascii?Q?CIgHRUO5vsnVztPIz63uh43GlM+9t5MAhgBZ9NOn/41P/xifwf9KU3UZjVf9?=
 =?us-ascii?Q?B1zsoStAOXJ5jXLthgkpRJAmesQXEbzLci4BTt6UjnwmFdvHjkQI3p11xly6?=
 =?us-ascii?Q?pXhBpB5EGoTWnaB+oHeTKuWrLuH+1IvtTaS2+MKtHyZUYcYkhSSQkdv0Nn1t?=
 =?us-ascii?Q?2YtLOZKmaWBsiqWlEOs5kMjI1S9p8KqM+RcgT9GIO2K8L86HELL9+f8v01nJ?=
 =?us-ascii?Q?JuY+Pjw4nu3wCr5eXZpxRasu63KSov6KN44Mu/GqzEVUnnYVFIZ99slM9+Pd?=
 =?us-ascii?Q?bPIcrD3SeY0Q8ODQOUtBPsLNApH+Ue4lrpabg20VmbOql67e8aXaG6ZyOd1M?=
 =?us-ascii?Q?YAOOCxb5BXnBLiRTMWYlzkQE5B2JS4VV4w3Ha/N5VvGggcCuwv6VeCNC1Rao?=
 =?us-ascii?Q?ltJMtkF1q9DeXBsbDQ5GGMtHHDETIZ1rreg4+vdf319WGe+wTOlF3MiQkgt4?=
 =?us-ascii?Q?a4+zUZJEZgQe0I/DcIgSro8nbPiQ8SvH39J9S5lAHi+Y2g+gBQHXGt/ipYrJ?=
 =?us-ascii?Q?BnGxJHs6x3X1lGHagkA5YAtXyGFA7fPQtRJQSGGUnOdHXyAnO+abMWX4L2zJ?=
 =?us-ascii?Q?XDNDtARAeuIi2bdXbmx/8gPb5jW9yYtNpoaRJPKLAek23nscc4Jt9+5V86jU?=
 =?us-ascii?Q?yzn1FXD3yQxOWFTbQVfQuK35W4N+vNqxM6DNKs4AtF+dUAnDwkBx7IyhQ/9g?=
 =?us-ascii?Q?203STOtfdZiSFkHuws7JdraY997EHIuxLAKLlU9i/qW3ukZF0cyFkHXRzMKi?=
 =?us-ascii?Q?XUHl7oYWVuKo0Nba54MTemK4B/0K8TqJ4Fqg5DppBjrf8uzqWodbdzy5C6gs?=
 =?us-ascii?Q?hKLe02fJe4AucKJK1WbvU/QkG1QZdyN6dqFQlCUApvtFPWSKQa+2Pse3UWC+?=
 =?us-ascii?Q?Kdq30qDUk/o4XTb8dofR5RQ4Og9EE4tmqYte/aXhCG24CDuRFmngf9tkhAwS?=
 =?us-ascii?Q?581eO5tBE/wRRT+8xvEVZJK6C1QQ1ZK/AaiM/43xBO/MWviS+Mxu3xj9iDlp?=
 =?us-ascii?Q?ApabmWWeQ8vfGJ7rrxKqO43gLbI+oLEi6R6vC4jgWwEkugzC9Exv50wIqFhS?=
 =?us-ascii?Q?R9LXIfRqHoF6y8KB6GCXHJLw02KUGJQfA8HK2F0wgJXcPm1i89FZmxMyTtLB?=
 =?us-ascii?Q?TeAx7CAaJtL/3UK1lzb6psHrDkX+ooOK6/hYtzljtbx2QZFpGbxAsMQak1Cp?=
 =?us-ascii?Q?IfA3Q9Vbx1EGDgTwOHpZHkKEqxhZrOdsXR03bweVMaCg8Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?txMhZ1ly76ubHuWZabfwPmtnOg8cfojHjlsmOFxLNvdCnu0l05YHKw6Q0Ubq?=
 =?us-ascii?Q?/vL98tqJn+50AIEWICDYfiAnBfsInV4mTYGH3wI73Mhwp/ZztgzeY3vym0DD?=
 =?us-ascii?Q?9Mi1cZvzjA8gA8xUy2vHjs3ea7odzxY3PinSQPXgHMNSyKSi7OVUVTXymcKv?=
 =?us-ascii?Q?6pHaCeAtV5ENVo2DB1bU9vqmx8AT75MhDGgmloaj8QyMgxec4KsEvbGqa37O?=
 =?us-ascii?Q?RLjNJD4qxyr1fL/Uk0iUCzzTqjFre7wb7npS2lOmJSMLkmDu+yHeA9+VN/yJ?=
 =?us-ascii?Q?vqMBtNCdpcyc4ruW2MxVlNDqprhnqAZLaUSl21a49dsX2erfMIrN5n2/Zn1s?=
 =?us-ascii?Q?m2eVXe9dwGpKnce0hITU6VkxrusDxMX8CnSHfOCoR2kMLUMaPZxf1Swhbf57?=
 =?us-ascii?Q?YK0GNhsSVi98Sx1g0Dtu5eBTFa/fyDUzOhhP7AkTvIrg1ZA6GKH08KqsvV2t?=
 =?us-ascii?Q?jF+oeyw+pf70wlJQSJN3+sAnP1mnISDocD7zcvQ9HW8XPcHK9KkH1h0UbAv6?=
 =?us-ascii?Q?NhhldSUwjZPyTiTVeukiW89FjRybIzIeqgrPb7/ZyxZAToPuQqFuZZbfZZCA?=
 =?us-ascii?Q?ktCwbKrEZvPl4yzFnIDaqZsFTTJh1t+8W7jNBiHnbwiTjPhqBwPkcr416qwd?=
 =?us-ascii?Q?JYerdsezlY04UlXb32+mqwBik8YaqfybxyVTCDVI1Xci86C4L4jp7LdLZqlP?=
 =?us-ascii?Q?wzLIWMFIF8/p8N+Q1R6OJ/jK13Slco/24yjWRo9JuArri7L55s/NVeUSQXHG?=
 =?us-ascii?Q?Q3LJjflcXt7Ag/P0i5JsLJOudkZnuVT8RzuSR+UOCHHgbJKnpgSSy0jmfnOr?=
 =?us-ascii?Q?DR0aLr05ftFCk6bzuH6K2de+AFLQ36Cfd9oq4MJhBGEbliRlZC1w3gPPsBK9?=
 =?us-ascii?Q?BFaNxJ7uo364qz+VtF2DBVX1DnPEuvO2wM0DdOBjHg06oltnn3YPFW+4DcW1?=
 =?us-ascii?Q?Vwx1yXSu3xQ+95QxYQDJlmXp33sG4n9r8eJuX6icF2ih0QBBIdn5+iX9NBN+?=
 =?us-ascii?Q?ISxfjWnFWvKVB5BvHwGGYFVQS6eSeZWhxkq8sDz7hLwNaz0N8yq1eL8YYCE2?=
 =?us-ascii?Q?EEEdIeDbQ6TobW/U3m63FL/BONrXAyzn71RS/GoMdcEN2Vl/0uaDKsh4qIFj?=
 =?us-ascii?Q?rub4pCCZb3RsFVWqEbdG8cHNcZDXDxF3ek/49fY6a/qZVXAWQ5hwquFXg36W?=
 =?us-ascii?Q?a+dXe3Qaj3zNyQXhgYMSZNpP0sNFLBuPjFsYosl267kbE0yP5+0S3qv8J1zy?=
 =?us-ascii?Q?NFQafmyytVAjHZCia+QSekd7dk/1g3BOhusvr+xovsblBQ0yKKaF45xut9uK?=
 =?us-ascii?Q?02P6aWMZJHrVcnLuB6xym5cuoqHf4P5HJaRdzXoNyHpAJqqa/ISASQYLax1p?=
 =?us-ascii?Q?aegIacqisum4B94nF3fULmaSKjdqDdDfoZiEqOE5zL/gP2N9tYYNNCbnhcWy?=
 =?us-ascii?Q?yncYyqZi3xxF3u+NrNoCZEp0gU7acboZY2A3N4uthV2C+jfGf39e2j0HLarf?=
 =?us-ascii?Q?M3aLZOa1WrWqPATlnFgBIotmsO8OAonbhyk3IpPjPigy4mWT+Jslnd35OTbf?=
 =?us-ascii?Q?yrXUAtv4dcPdtFAHKDw=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5143c9-afd5-492b-66b5-08dc74295c48
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 15:20:17.0023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hvXgVwyjPMCrR67ZnQLaXvGC98Zt+0WNThz3Xf7pbKsH+mOUilAZAWIwDu5/mr9fB5ZIhAEZw6sfWKO4gaKug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8511

Test case 1: To see if we don't wait "Awaited" response.

Test case 2: to see if the email reaches the mailing list
