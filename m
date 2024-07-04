Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB15818A93F
	for <virtio-comment@lists.linux.dev>; Thu,  4 Jul 2024 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720086399; cv=fail; b=X+oUuPPGlYBojmQHY06D8c4+c7Ljc3BLw0k4YE4p35pkkWD5yc3pzsH+TntFA1JBT05TDLWtwTjG8lz5PWozObKpk3fnvNA4nPIYBfHKvFNjdNBGuAPSwo/T+iuk4zOhiidPrkkcYACjQehdvLSmHVeK0D+ldijcubStiO4cWIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720086399; c=relaxed/simple;
	bh=r7fQzOMM5d/l8RbkHjIotiryePxzNiaZEr2HCxzkV/c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RRQQVlD5qaOjV9HBpX6xwVoRL+eW0iHIim1Yn7QThP0aaHYXZ0Qit9DHWa6ctY63MTXzblG8NYNHtK+ajIMG+GN4wA8UDpQRRrjoaoWLZZCZ3zYluwxvluaaSxX2+xeb6w5WJsKie+U7dJUPIB/uyZkQClLWf+4214cxxwxsKlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jsIz4Tu2; arc=fail smtp.client-ip=40.107.94.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jsIz4Tu2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rz80tSshj5OukaqpESOGWLDMlRCrh1KcQ9oLlfeISOvgEk0ecPU94DSL80YBs/KPmTedKaUJ2PfpXxsVlWN7+uoP/rZY8W96UgavPX3i6evwjU9p8bBCb4cQNhzRr8Hsmm4c1eLTFU9L9JS2jZq3ywc4rhb3VkXE4sdHD0vdYX6Wm38MCKOtLfoeCafxe7mFYwb8VYHwMtP1ygcWh11xWbQeHeL0UdKmdwmRcuQ13azl3UjV3GWLAvcwLzzBjmhctubNWj4/3Scgt5ZlMdEJYuue+zk0FZvWorIRcM+0HuFD7pDW4x5/oPOq1rn1UGKN9gvatV2iAT5ziy2I9H913A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7fQzOMM5d/l8RbkHjIotiryePxzNiaZEr2HCxzkV/c=;
 b=Q9uDJO7F4HyOSUbS368/vI4Rs6k8J9RrUPrTtLV4eOk+kS2FcBmr56AGgCQnU132CnjHrvDLW63/OC1Ne40+U8BkwPjbLGMPrgdtHh4iiq2JX/7Ko5tvQug3IgkfF5kL3JSCLvx6BgMqkfIRscSs1Va2SFPQuKnfrTroSBUt8FQkMzdYwwzXCQCg+ic7Eddooxiq1nh/VLtTEDskCmD+3lgx4oGx+Cyohat9dGMIww/Sq7Ge7e39hxJUSck4rjsvOHo7wyyKvFPF4HIh+L1/H7D8ImwHLdOHo1jPlFC8VgWDwjgdzvIjOTNieZ75Lh3WoOZ9p0jgf1n5HLyuPyK5EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7fQzOMM5d/l8RbkHjIotiryePxzNiaZEr2HCxzkV/c=;
 b=jsIz4Tu2dE0lwEYJujQtY4+5iEO9sIlg9b5N0kQlpaDyAXLc71cFraCOMUXrOptYu35qb/b0lqz9bLuCpLsNfovOwjD6WdSBNIjNcOk1puu5W/nJU+PKtgu0Ozz6U6KUPuNhFhZC2pSiZFnG+Hf+ECaF6fiezDylvH+9TwTWyA9oLPwLj9qMKFQ2dQZUjlenLjVGEUsCOdsGecqsR7r60BaW/Pf3zbQOc/KuFg8VHPZvdhabGucc+/yNgfHd2j18z/lMuOeS1pVYhL+AAQz8UaujPtYsnY84VmiJ6vY49p4K44d9cVA6CmMRLeRe5GRAA7CcuhvgXVyxcJVc9UxWjw==
Received: from DM8PR12MB5480.namprd12.prod.outlook.com (2603:10b6:8:24::17) by
 IA1PR12MB7757.namprd12.prod.outlook.com (2603:10b6:208:422::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Thu, 4 Jul
 2024 09:46:34 +0000
Received: from DM8PR12MB5480.namprd12.prod.outlook.com
 ([fe80::d03:f00e:1bbb:1921]) by DM8PR12MB5480.namprd12.prod.outlook.com
 ([fe80::d03:f00e:1bbb:1921%6]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 09:46:33 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Keiichi Watanabe
	<keiichiw@chromium.org>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"uekawa@chromium.org" <uekawa@chromium.org>, "takayas@chromium.org"
	<takayas@chromium.org>, "dverkamp@chromium.org" <dverkamp@chromium.org>,
	"tytso@google.com" <tytso@google.com>
Subject: RE: [PATCH 1/1] virito-blk: Support NOSPC error
Thread-Topic: [PATCH 1/1] virito-blk: Support NOSPC error
Thread-Index: AQHawWrdwzcIsa1R1kKu7fjMnv5ZY7HNZ83AgAAIoQCAAaCGgIAWpCwAgAC0alA=
Date: Thu, 4 Jul 2024 09:46:33 +0000
Message-ID:
 <DM8PR12MB54805F2C26F9C8A7E09DF010DCDE2@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
 <20240618081858.2795400-2-keiichiw@chromium.org>
 <PH0PR12MB54811C1FD9D666D13077E817DCCE2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240618081240-mutt-send-email-mst@kernel.org>
 <CAD90VcZAkXVfciJnzH+qjgiCFaqMK-Ne-0uL2o3EKcN_At_X1A@mail.gmail.com>
 <20240703185059-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240703185059-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|IA1PR12MB7757:EE_
x-ms-office365-filtering-correlation-id: 5bbd3724-94df-4291-1b1e-08dc9c0e3085
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YXEyYVVQMmM3Q29XYzJpOFp4d2d6T05PZnRqUVZsQXpqWmpmNFJqUjFOcEhk?=
 =?utf-8?B?M2pqTEF1QkdzWUk4WTdSaUl0UStnRmd1Wmtydk5LQ3l2a04rRVgwWVBoR05r?=
 =?utf-8?B?U3hHeFU3NTBxbDlvc01tTGNKaXk0ZUJWMnEvMC9kdjRBanJ2cldqZzBWZjZN?=
 =?utf-8?B?Ujg1V0h0RXk5bTNiZlFzNVJKV1BVYkRMR3hTQzRMNElkSG5uNklNUlpmdzAx?=
 =?utf-8?B?ZXpUV1RWSVBsSUVTQ0o1OXhUclBiTG1TSkZDbnUwcWl5dUFTUGNMaTFiM2FO?=
 =?utf-8?B?RS9sZWtXYi9iNThCNHU1cnRvMzhiZXBqaFBZYlJ0R3dNek4vVnhGV1VYd2kw?=
 =?utf-8?B?NThsOFBUQzN4WXE0dHo2YUUrZTVFS3hoTTRmekRBUVUybGx4TjFPdFVFNTc0?=
 =?utf-8?B?eTZaWk1TNERteFdBaFdGWGs1dVFOLzZaRG5CeVplcDRndXdPQmJleG5OQko0?=
 =?utf-8?B?cGxGWTF5Mlh0OHRkWkRrMUxuMjVJNWpFNlh6NHcxV3hnZkpueU15WkpvemFv?=
 =?utf-8?B?dDgxOFJVZEZBSWNyVXBzNXUxMEZiUnh5LzhVb082YkxuVmFGOUQ5bTlJMHlh?=
 =?utf-8?B?Z2hWamhQVXo5eDdKN1A1VXVweGpzRzZuTFM5SUE1ZzhkYWwzdjBNS2doRHpq?=
 =?utf-8?B?eE9hR2ErVm5GYmNSNEVKUUZTbjV6cXQ1RXBObXpCcFVBUWtjSDEwQXVWTk8z?=
 =?utf-8?B?bnlDblViTllMS3NUZnNEVVBQK1VzT2EwWUN0bk9GT3h5UlRNMzBvbm02bFdK?=
 =?utf-8?B?RUMzQWhqTzhrSjNSWVZtUURlOFR5TnRVKzl6ZFpVSXkxVTBqNTQ1VjRvT0hJ?=
 =?utf-8?B?bzZXNHQ4QnVtOEczNFJiUGo4K3FkZVYxODNKenkrcVM3MDgvT2dPaFdCL2sv?=
 =?utf-8?B?Tmp6UDBnbjRNMkdwNm9GcVBqN2VOWU05eGFmallLUUE3VUNSb1hjTk1adHcv?=
 =?utf-8?B?eTQ5YlZQbkNxYktjQnpQa0N1TnBMZlpVcGZQZTgwMTI2ODFpQnViU2F1TjFa?=
 =?utf-8?B?QlhqM1hlTGxxYlgrTEpGUlo1YU1DZzBaTUI0U05GeThpMy9xTVppNjZwbzcr?=
 =?utf-8?B?NVRjbjlBbU82aE9hMUtrdThkbVdVSDc4ZkIrV0VxODhsSkxOK09NMUNCRjZi?=
 =?utf-8?B?MFArRjg3SkU4RjBjR0VFNjVzQ2FrMzB2SG1USVpFc0xvblczci9sbnNrOCtG?=
 =?utf-8?B?YnorekF2YXhQaXJZeUU1VHlyRUVVK2YwSVlFWDZiMWVLR1BDdmVNTHNnb0ZT?=
 =?utf-8?B?OThQUks0MEUxd1NSZWR1ODltWnRCZ3JLcmhjMmJxWmpiOXRvZEV3ZXFrRE5y?=
 =?utf-8?B?SldmWmFZVzRGMXpJaXQvbUpZQXEvMHpXbEh2dy9aNWl1VHh6RURUWDUrVzMy?=
 =?utf-8?B?cmwvUGt2bmNJR2JucENnanFJekMwdmVweFg3ZjVHalJDNUJFeWNPRVRPQ0lJ?=
 =?utf-8?B?MXVwaDRoeGNtV0lQSXcvbVcwVEhOY2lYR0diSzJXVWNQRmlkQ3pmVExXMWIr?=
 =?utf-8?B?V25CQ09VbjhFdU03cFZZS3kzcHdGK3hOMEJaS3l2K1NWOG5BSmhiVFRFNlM1?=
 =?utf-8?B?b1h6eFdsSS9vL3A2SE1PQzJIbWc4elozZUN4VmYvWWpoaUszSzAva0YvT2g1?=
 =?utf-8?B?YjlkM0ExeHB6TVdaSjQ2WXpMMjBURXBQNk8vZ2FlS2xoaXd6S3NtNEZuUDFl?=
 =?utf-8?B?KzVsOHFjYy8zbThnSXlqNHA5M3FJWXhyQjVqbWU4UERRVGg4Wmp5eXUzT1cv?=
 =?utf-8?B?UExpU0U2VjJUZHFqUFhMV1JOOENtOTNXMmpJU0ZvYW5tYUs1UjcwOFdJK0ti?=
 =?utf-8?Q?yEd00k1724nAepwGp73ToJMdfAtQ8yUox7VmY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WnlrZU9LcGxyL1h1Uk9vVVZ4Q0ZnQUJOKzM4NVJXOFpJTFp1eVNENFlPTlBj?=
 =?utf-8?B?czNHb3hSRFIvYzRvT3JmYXN2ZTFTU09ubG5peVE1R1c0TlNYb0JLYldLN2pJ?=
 =?utf-8?B?UkFkcmNxS0NWRGNGK2ZxNmZLV1FLV0RCU2JvRGVKMmtkamNYQVdRUnU1Ni9s?=
 =?utf-8?B?TUl5OXZQQmRlTXJMa0JRcTU4K0liTlk0QXNXelljajFwZC9XSzNDWkREMjBI?=
 =?utf-8?B?NTZza1NBcjBPOGdVMW1XUXRnK3VTdldhYTJBWmh2dnp0c3EreHNBalN5b3I5?=
 =?utf-8?B?UThHbHMrMGtQV0UySm00Z3RpZG1PdmlBYTlOb0h2V0F0dStxYkd4cmx5bmhq?=
 =?utf-8?B?Q3lYODYvakl6V09OdU42SXdqMndxa2UwL3lROUwrQWs0Q1dLVzNmVW83dEZy?=
 =?utf-8?B?aG1XNGV4WXlpZVF0Zy9FTmhLWlNWMi8zSHQ4MDFqUW5oZlFVY1lubCsxMDlo?=
 =?utf-8?B?Y2xNSmhlN09sb1lKczBjQU8ycm9Qa1lwT1EwaW9jUWZKaWxpNExaTEZaeWVY?=
 =?utf-8?B?RHZsWXo2ZHNYVUI4dUhiU2tPWEM0TmNWNm1ONlBXdlRBM282bEJWRzVKc0pY?=
 =?utf-8?B?TUdCTVg2Y2hkcjJBMGJkUEVXOUIyMG93YTl5anFCbXVzdXZ0UUUvNjVVeFEy?=
 =?utf-8?B?TlA5bkFTMmlDQnMrUHZWYkUwTTNHSUUrUDRiQnRILzhXR1diWVVZTWwva0V3?=
 =?utf-8?B?cUYzUzIwWnNCOUdjNzhYWExUZjE3cXMreHFDSStTZDRWWnY0d1dEbGRQOE52?=
 =?utf-8?B?cm4veGpqeTNJWEJCL0x4OGN4VVNZWGoxb0pqUXA0dVRUbHpBaUI1eDUrRkJk?=
 =?utf-8?B?eXhCa0J1UUZIZ3FKenNsY3pRSUZvUUpIM0pHczZ3dktJeGpJOWFMQ0V0RVQ1?=
 =?utf-8?B?ZzNtMUF5enVsdFM3TDh3QWlDT3lGdFJQV1BwazVvN1NMY3BtZTY0YnVYa29W?=
 =?utf-8?B?WmhEcXM5NmhZQmNCaDlQZ05IYzJnRDV2a2RzUW9UakgzT3lGcm8valZ3Sk9G?=
 =?utf-8?B?aHR5ejJhajQ4VEFVYlZsVUtqd3lINE16aHJjb1g2ME4zcGZYckJPN0hNUkE3?=
 =?utf-8?B?NVhEaDdXdFFBOHJ0UFJkWTJzNElYc2ZxSEJzYnk5NEdFMzIzVVgrWWJ3RDZa?=
 =?utf-8?B?UUk4dmNoYlB1cHJFcS9zTjZycERUYUR2OU9ORDFXcDI1cHM0b0Zvallmck11?=
 =?utf-8?B?MTRRVENZcWZlb3RmS3l6RnAramdoRlBXWWEvdUVKWkZDeGx5NlNoY2tvbjl1?=
 =?utf-8?B?OEhDUk1yNVFOZXJ4MFBld1BTMFhNYzBQMWl3bk5YMGkvZTU2YXdHbzdrN0tk?=
 =?utf-8?B?TklWNjBFWkppZ2NPQU9mNWl5S1ZaRFE5KzJrTWxrQ0FGWWpJNStTTWhBdVNu?=
 =?utf-8?B?czZqN0ZsdTdDaFBqYXRhLy9VSVViY1pVMmNUdEhkclJQK1R3UHlMRWtpeEY2?=
 =?utf-8?B?MktJZFgweGwzOStUTVZ4T1psbnR5L25aYUZwZXBCZGw3U2VxR3JqQ3lQc2Va?=
 =?utf-8?B?S09sNDkyNFpRN2VYM2VFYWRaODdSSTBCenplOUU3TXFaTytsbkIyMnIxejZ4?=
 =?utf-8?B?aXVXZG4xbzFSNEhXR3RDdGh0WEdhSUFycmxvSEZpMVF0Mys4S2Y0V0FvYjRC?=
 =?utf-8?B?RUgzQUlaSHZXTEkvcXJMMUEvVzB4QmdnK0dGbk1ESllvelZscXNxc2diMUNL?=
 =?utf-8?B?RjcxYTFxSjhLSkp4cXMzaWkvbTlWclBlZDhwendlbS9LYy9ibmFTbk95VElo?=
 =?utf-8?B?RkZaQ2UxUDhnQ2dGZUlHVCtxQVFvSnUzUWJhUXpGUU1ublBjdXhJMWlGUW02?=
 =?utf-8?B?ZVVObHAyV2JhVTY2WkJnUzY0VUN5S0Q0MSt3cDUwZDg1N1lHZGo4cTYzbll5?=
 =?utf-8?B?azJBM3gvclZrdDhEUVN0VjRLUmdHd2taNzVjTjRkS0VMUHNVTDJGS0xsRUhV?=
 =?utf-8?B?UnJLNnI1V3hTZHlQa0tmMy9tWTV0SjlaMytycXJHanNNSDdONTE2VUFnSmtN?=
 =?utf-8?B?Zmt5ZjlhNU05NGVESjdKelFISGhzNno3a2x1RWNaWmcxMlJNakRlM29CMkUx?=
 =?utf-8?B?anR1OGRjc0Rjb2V6Rmw0Q0o0bUdSMmZDOTJJSnJ3T1ZRQXpMckRtRXZFUEZa?=
 =?utf-8?Q?00dc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbd3724-94df-4291-1b1e-08dc9c0e3085
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 09:46:33.6763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7H/lWt3XNvzSXvwm3xCM/okNh+epVSz8zTpIF/W/y7xQLQ7G6XG4iuzN4oCKG4lWYq6+6nPeUXH6AO28PDabIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7757

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBKdWx5IDQsIDIwMjQgNDoyNSBBTQ0KPiANCj4gT24gV2VkLCBKdW4gMTksIDIwMjQg
YXQgMTA6MDk6MTlQTSArMDkwMCwgS2VpaWNoaSBXYXRhbmFiZSB3cm90ZToNCj4gPiBUaGFuayB5
b3UgZm9yIHRoZSBmZWVkYmFjay4gSGF2aW5nIHRoZSBuZXcgZmVhdHVyZSBiaXQgbWFrZXMgc2Vu
c2UuDQo+ID4gU28sIEkgdGhpbmsgd2UgY2FuIHVwZGF0ZSB0aGUgc3BlYyBhcyBmb2xsb3dzOg0K
PiA+DQo+ID4gKiBEZWZpbmUgVklSVElPX0JMS19GX0VSUk5PIGZlYXR1cmUgYml0DQo+ID4gKiBJ
ZiBWSVJUSU9fQkxLX0ZfRVJSTk8gaXMgbmVnb3RpYXRlZCwgdGhlIGRyaXZlciBzZW5kcyB0aGUg
Zm9sbG93aW5nDQo+ID4gdmlyaXRvX2Jsa19yZXFfd2l0aF9lcnJubyBpbnN0ZWFkIG9mIHZpcnRp
b19ibGtfcmVxLg0KPiA+ICogSWYgVklSVElPX0JMS19GX0VSUk5PIGlzIG5lZ290aWF0ZWQsIHdo
ZW4gdGhlIGRldmljZSBzZXRzIHN0YXR1cyB0bw0KPiA+IFZJUlRJT19CTEtfU19JT0VSUiwgdGhl
IGRldmljZSBtYXkgc2V0IGVycm5vIHRvIGEgcG9zaXRpdmUgdmFsdWUuDQo+ID4NCj4gPiBzdHJ1
Y3QgdmlydGlvX2Jsa19yZXFfd2l0aF9lcnJubyB7DQo+ID4gICBsZTMyIHR5cGXNvg0KPiA+ICAg
bGUzMiByZXNlcnZlZM2+DQo+ID4gICBsZTY0IHNlY3Rvcs2+DQo+ID4gICB1OCBkYXRhW13Nvg0K
PiA+ICAgdTggc3RhdHVzzb4NCj4gPiAgIHU4IHBhZGRpbmdbM107DQo+ID4gICBsZTMyIGVycm5v
Ow0KPiA+IH3Nvg0KPiA+DQo+ID4gRG9lcyBpdCBtYWtlIHNlbnNlPyBJZiBzbywgSSdsbCBtYWtl
IHYyIHBhdGNoLg0KPiA+IE5vdGUgdGhhdCBJIHVzZWQgbGUzMiBmb3IgZXJybm8gYWJvdmUgYmVj
YXVzZSBQT1NJWCBzcGVjIFsxXSBzYXlzDQo+ID4gZXJybm8gaXMgaW50IGFuZCBpbnQgaXMgdXN1
YWxseSA0IGJ5dGVzLg0KPiA+DQo+ID4gWzFdOg0KPiA+DQo+IGh0dHBzOi8vcHVicy5vcGVuZ3Jv
dXAub3JnL29ubGluZXB1YnMvOTY5OTkxOTc5OS9iYXNlZGVmcy9lcnJuby5oLmh0DQo+IG1sDQo+
ID4NCj4gPiBLZWlpY2hpDQo+IA0KPiBPa2F5LiBCdXQgd2hhdCBleGFjdGx5IGFyZSB0aGUgZXJy
bm8gdmFsdWVzIHdlIGFyZSBnb2luZyB0byB1c2U/DQo+IA0KPiBBbHNvLCBob3cgdG8gd2UgYWRk
IGVycm5vIHZhbHVlcz8NCj4gDQo+IFBhcmF2LCB3b3VsZG4ndCB5b3Ugc2F5IHRoZSBjb21wbGV4
aXR5IGlzIGV4cGxvZGluZywgdGhpcyBpcyBhIDFzdCBuZXcgdmFsdWUgaW4gYQ0KPiB2ZXJ5IGxv
bmcgd2hpbGUsIG1heWJlIHRoZSBvcmlnaW5hbCBhcHByb2FjaCBpcyBvaz8NCj4gDQpJIGFncmVl
IHdpdGggTWljaGFlbCdzIHBvaW50IG9uIGFkZGluZyBuZXcgZmllbGQgZXJybm8gaXMgdW5uZWNl
c3NhcnkgY29tcGxleGl0eSB0byBtZS4NCkkgZG8gbm90IHVuZGVyc3RhbmQgdGhlIG5lZWQgZm9y
IGl0Lg0KQmVjYXVzZSA4LWJpdCBzdGF0dXMgaXMgYWxyZWFkeSBzdWZmaWNpZW50IHRvIHJlZmxl
Y3QgdGhlIE5PU1BDIGVycm9yLg0KVGhpcyBjYW4gYmUgZWFzaWx5IGRvbmUgYnkgdXRpbGl6aW5n
IGVpdGhlciAoYSkgZXJybm8uaCB2YWx1ZSBvciAoYikgc29tZSBhcmJpdHJhcnkgZXJyb3IgY29k
ZS4NCkp1c3QgYmVjYXVzZSB2YWx1ZXMgMSBhbmQgMiBhcmUgdGFrZW4gYXdheSBpbiB0aGUgY3Vy
cmVudCBzcGVjLCB0aGF0IGRvZXNuJ3QgbWVhbiB3ZSBtdXN0IGdpdmUgdXAgcmV1c2luZyB2YWx1
ZXMgZnJvbSBlcnJuby5oLg0KDQpFcnJuby5oIHZhbHVlIEVOT0VOVCBpcyBub3QgYXBwbGljYWJs
ZSB0byB2aXJ0aW8tYmxrIGRldmljZSBhbnl3YXksIHNvIEkgZG9u4oCZdCBzZWUgaXQgY2FuIGNv
bmZsaWN0IGluIGZ1dHVyZS4NCkVQRVJNIGlzIHZhbGlkIHRoYXQgd2lsbCBiZSBuZWVkZWQgZm9y
IGEgd3JpdGUgSU8gb24gdGhlIHJlYWQgb25seSBkaXNrcy4NClNpbmNlIEVQRVJNIGlzIGFscmVh
ZHkgdGFrZW4gc29tZSBhcmJpdHJhcnkgaGlnaCB2YWx1ZSBvciBzb21lIG90aGVyIHVucmVsYXRl
ZCB2YWx1ZSBjYW4gYmUgZGVmaW5lZCB0byByZWZsZWN0IEVQRVJNIGJlaGF2b3IuDQo=
