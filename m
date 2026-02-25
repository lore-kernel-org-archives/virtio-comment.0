Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013047.outbound.protection.outlook.com [40.107.159.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5819EED3
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.47
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772006702; cv=fail; b=mILvkcl4F4zBc1stwizu/GspOp8YCzk1CjezF4DKWO+fn2cuvcvnGTnH1gQggDys/JBCG887Sy2FvyzmxSJFbCnx0CyosUU2tNVTsXZ8k/Ka0Pd8uh9kMLNLcJbzYk+X3gQJyY3fBprXRah1tUE9AOzYtKhLZim7OVxoVVVBnTQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772006702; c=relaxed/simple;
	bh=sAX+TXSEVimVHB5uPO9XrzmiT1KFeJYPf+IWNQkloQc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lsqGRUeDyhxFEFby+UEiivPGAjekOu/YiuqYn2HgVLbmF51WffDU/ASx7Lae4d2ORotgbXCCw1Jfns+cnlKeJ/UKIJ8kNTSGGRKxpTC16NMveLV/+Wex/veSBCWqdwutwVZC57wPLSs++YdEJ0j+dZhyGUy0iDf3/Zdsztd5tSk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fE+5ac21; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fE+5ac21; arc=fail smtp.client-ip=40.107.159.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fE+5ac21";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fE+5ac21"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tUu47ZXPgyyKBZsrVWcvGX2d2pU1lU4OR1nOLXDiWTZor+eubJ+29QkbBuh1brbFUtgbDGxSAUUJNUlwwfgVHeZhKcFjzx6LUmLStBX4DAf5/scqPQFhmE2+geBftOUEVRTzJtaUIBSsRvZLpu7c9d+dD2DLH4hAF85xl1e+N7VMQvbxte3usTm5txyDppgRn/AHvpMpMhN8UWyut/zlf63yMJbIqj+9WhZMd4kGn8qSJru6bBNUYk/vYq5kMVr04DdTnNIExtBZ1lXAKf1hgznM1Ho9iq2OsvXNGYDbq0SmISmbaf+R752ZCgdBlzANpQl5hyOYQ5j4GUmuhmso2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAX+TXSEVimVHB5uPO9XrzmiT1KFeJYPf+IWNQkloQc=;
 b=opwZsrQR2CpSZ8ZI6ICKgTH4yMvXsGRAcMEqLainZP5e0QzX03QHo3/ni290G1VMnt81ALAc0t8nUh+v9tpqVt2VyyOUpW5rc7MHILMKpGp9ejzuxykUxh4U4WDD8cyxKTeuuQSmxoJVaeFyyrj38PQLez0l367miJ1B6c7wtQ2ESuFjGI2ETrKq3dFZqVBwOFCgMVoYlxP2UKXnJV8zGOpWd+Dytk1xcqIb0pQvBVIoQxfFqB1vIeL7gSePf/i6Olh75y2N03K0b2AkLdhq67eY+xPBUth0x2oGih5+UyD5uwAvt3Na4+sPltm0AmgyHhj/OXzk9CLeH1x9ly3UEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAX+TXSEVimVHB5uPO9XrzmiT1KFeJYPf+IWNQkloQc=;
 b=fE+5ac215MrjKItwxZTSN+jqFSL98KVs7hlaFuOMlSnBL+OAP0Wuqn6/IWoPiGz80EfMj887GUBRtDL016T2gO7oMjMTThQExwpP8qgpP9f0/loeOg3WdWum8oDGjhI7SJD3apFSpDFLIFZR6mCt9ALjWf3OYmg7s+/kmAKsp74=
Received: from AS4P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::9)
 by DB9PR08MB6380.eurprd08.prod.outlook.com (2603:10a6:10:256::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 25 Feb
 2026 08:04:54 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::1f) by AS4P191CA0019.outlook.office365.com
 (2603:10a6:20b:5d9::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Wed,
 25 Feb 2026 08:04:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 08:04:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fer0qSghdDTVRaXKWs1tS4oxUHOZrS9G82UNm1ZZvkGLTBtOyjShldTff8Hod0a7SD5reClLtQjT0HCa6cLMD/ZcBgbMiFqC3w9P2XxTR89HXg2CrtvCO8eVHSlglQfM9dbpp0Zl8bHfQ1CReyrFaNhqAC375NTNLjr53ubI5jSyjznGiOr9X+MHWT7yBjcaDAIftyDfxdxKYBUBhuukb+jrdnPIWQM9HS7mfyZCi5fCE65m5Ca/Gy3icBspb5Jv5xCh+QY7rx+IJIbtl5jpLPzWj9fQlaWxhmLjPboe7c3lfKm+ANAXPuvPL4FYMP+kutnI6SP3nTTUTlyiR1+0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAX+TXSEVimVHB5uPO9XrzmiT1KFeJYPf+IWNQkloQc=;
 b=nYT2uq2XZRWOqKny9kRgj9dRI/OI7wOYQJVu+FUn529M/ayKajjaStKZYUdrQ5lZMJakx9IKclZp4INUUodSFLuhkrOQ+WJNB5hIKzPiNCiUXBfVG1ORJ0/6tknXYZ2cwCnONfVd6dEWC6MIHfl7XSAQzwkmOpQaabx9IXHe+Zzzi+fDIq5M1KMcGCMNAvxHnv6Zp/cd2RREFM32aHVJv5AKfcvSd2KjQMDtYtrK2p/+GBuOXp8cN71MkIH/+QYhQ5CStDnZBxlskrP/Ozh1iNDFJe4vs5b5ICBO4A0SztIsDanclHv2RLSZzSYoRhr4GnZz2sxC+niGMaxeZ8+7Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAX+TXSEVimVHB5uPO9XrzmiT1KFeJYPf+IWNQkloQc=;
 b=fE+5ac215MrjKItwxZTSN+jqFSL98KVs7hlaFuOMlSnBL+OAP0Wuqn6/IWoPiGz80EfMj887GUBRtDL016T2gO7oMjMTThQExwpP8qgpP9f0/loeOg3WdWum8oDGjhI7SJD3apFSpDFLIFZR6mCt9ALjWf3OYmg7s+/kmAKsp74=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS2PR08MB8573.eurprd08.prod.outlook.com (2603:10a6:20b:55c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 08:03:48 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 08:03:48 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAALveAgAfGPgCAAAUZgA==
Date: Wed, 25 Feb 2026 08:03:48 +0000
Message-ID: <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
In-Reply-To: <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS2PR08MB8573:EE_|AM3PEPF0000A791:EE_|DB9PR08MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0445af-ff36-4228-22d1-08de74448ef5
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aE5UT1pRYkhJQXUrNlQ2OTR6Vk1uYXhjcWl4dXJWSXlBQW9LM2JDRStFbDN5?=
 =?utf-8?B?cU9PUWY5VFJiNFZ2MFRMSTRvOTI0c0hFbS95VmpNcWl1Sk9iMUhHYVd5aThq?=
 =?utf-8?B?RU1HbmpwV0RGUGdaanZkUUhIK1c5NVJ0dkg5bjJ6TDJTYldZVWtXa044c2g1?=
 =?utf-8?B?M09QUkFMdTFYQnpZRlorNGlBaUNNcDFxWnZsbnFjdE5uVnJ1emtVYXhKaEtR?=
 =?utf-8?B?WDhqMnQrOG5iNENSTitxeEIyNS9CVy9TWGgxYzZGdzdPL0loRmZmb083Z0tn?=
 =?utf-8?B?S0FGVXhYaHlkMThmQTVBcUJPTkJWOTIySGdxUUhqOE11M3ZkcmhWQmdDV3h0?=
 =?utf-8?B?cmtINmlnaEY4TTdKVEg4Y3c0cjFoQ3oyRDJxNXYxcG1KcENaR3dFUWttUi8r?=
 =?utf-8?B?YWdIaTVVM0w0cHI5VXNLN25HK3hxREpQSlNTQy9YbjZhM0ZyaFlLSTNzdm1Q?=
 =?utf-8?B?Y05La3VVMDZOKzZPVHkxelFBQzlZT0ZDUUFOb1VYVnVWYWlFMEkzeUJibWlB?=
 =?utf-8?B?TG5hOS96aW80UFNqOG1IMUlnSkh4MnZiVm9qOVVJR3JzMkkxaXo4TWljQ3M5?=
 =?utf-8?B?V01DTkpiYnZqdFNuTTdFS1k2VW4rcWhyTWVkZFhLWGwzWmpmOUJudEp1bHdV?=
 =?utf-8?B?OGdHSzNCa1pEbUJZSGhDQlQzV0h3UHVMVHZBWnZNdk1wcDBxWHZqZFNsc01s?=
 =?utf-8?B?WGhXdUZEQXR2UVZWRFU1L3pIUnBxNWNFejl5M254R3Vpd3JJVUxwK2xDQWlt?=
 =?utf-8?B?cWVtc1Y1K1ExNDYzT3MyQXlvZUNPWlRudXNMN1d3OGhoenVlMDhJTTk1Sk5E?=
 =?utf-8?B?ajNlSWthMnNmSEpiSFJWUFdEVWE4WW0raTFCSGhFU0s3QzFibnZ2OWNaNXRO?=
 =?utf-8?B?c1ZibXg0V3FUNFR0dy9GTTBOcUxMKzNDOGlBelJKemdNREZ5Mm5qS2x1TEVr?=
 =?utf-8?B?dTBHTDJocCtCelhpOWM2RmVXRUROZkZwcVEybTd0MDl3T25jdTRCMDIxQnIr?=
 =?utf-8?B?UU5PSzh1dDNQbndCd2Z5YkVDN1FQeVdxYlVrRnhPMHBCRk1xQzFEdXVoVUVU?=
 =?utf-8?B?UFNXT0pSNjBUdXNPY3VnL21EZVRXV00zZ3pwTWY5TlNldTE0RHVHbGdITzBo?=
 =?utf-8?B?eG1yclI4QUduazFhNmE0VEcwejlJV3hsMEJtWm9vRWlrN1poQVVLY3BwZkZC?=
 =?utf-8?B?V1I0UzMzZFlLWWVYNWF2b3c0N1RVeUhsT1ltenVqUndXVTVJY0FSdytSM01K?=
 =?utf-8?B?Yyt3Q1N5b2JmVU5lNmp4dEVzelRXMEx4UGp0UkdvVlFEdFRFOTZsV3c2Mi9L?=
 =?utf-8?B?dEFjRmhuVnowTkFrSTJtaE5rOWthaFlZYStvWklYWCs3SDhubEZxWmxiVWdi?=
 =?utf-8?B?S2lKZHlCZkE2cjJFSG5KZVNwbFR2RnZMYjJxLzNmQTdlR041UmQ0R2xUa1lL?=
 =?utf-8?B?bHZCbkxYd0g1SkV1SUxSSVlXV1kvSHQ1cmtJZW1SbEdyeEZ4TWhBbmFYcE9G?=
 =?utf-8?B?ODFpOXNnNTJPcGJqYXJQQVl2c004ODJCeVkxbmN4RHdIK1VSNjZETTdxNWQy?=
 =?utf-8?B?akhEc2RkMDdpbnJOcXNsYzdvdlN6MExFKzROa1h1cTVEUHZuMUtZN3psWEY3?=
 =?utf-8?B?NVdvUmgwLzVxU2I5VWVQdzA4aGowVzhIQjR5ZWNSbmg0aVQwVHJkNG5JeUdj?=
 =?utf-8?B?NnpYbTZsU2NCdHNudlJLeUszTlJFeTlwVGFEUW8rY1YzSEF4bW5MUlhQOTJu?=
 =?utf-8?B?WE8zenVVd2tBWWFBWVV6OGJldzBuc2hTOHczVmo1ZVArR1AyRE5pTjZzTm15?=
 =?utf-8?B?b01FSlE5M25mU2xHMndXNjJ1SWI3dDlLTG5UdUZtVnh2aTFISVEvQ0h6c3ZT?=
 =?utf-8?B?U0wvaTdCaUFIYWI3NjV5cHAzVUZONkl4MXdPMm1wbHU5TDBSK2JmNEhURldY?=
 =?utf-8?B?TE85S013cnFKZmRUcTNpNHNnTFQrU1k2ak03VityZDBmcE45V1crS2Yxc2Nh?=
 =?utf-8?B?VUF1U0tmUnlrdW1jL0tDek5RdlZBNVpFWGNqbURFTnN5di9vR0ZQTnU4ZjRi?=
 =?utf-8?B?SHlCN2pLeXVZY09wNWJ0TVg3WlNhcTZER0hZN08rR0ZQNDBscExGamx2YkNK?=
 =?utf-8?B?SVdqaHZDYWwwMkpyL09pQlFFcVNvYTJQRWNHT1JFaWQvU2hxYUpYK3lFSGZF?=
 =?utf-8?Q?Pgibjs6Mp/4iM20IS/U31pk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2995EACA0C9E154CB8C90A6723C0317C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8573
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	622d8181-5a6f-4496-b00d-08de744467de
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|14060799003|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkZDODhjQ3BtdFNFaXF4TlloT2hHSkdGQnltek9rSVdMeDBXeUlqRzhsRGda?=
 =?utf-8?B?ajIxaHhKVkJjZlJ6SWJFSENNRjB5T1NOSHVIQmRkemJHTVBYM0tyZTJLNGlZ?=
 =?utf-8?B?eEhnV2pFVU5wcm1sZTdQLzJ4NHBuR0N2MGp0VUJmWEQ4dTNsY1pFbTY5QUhx?=
 =?utf-8?B?NHZqVWZGSi9VYnBPYk5CVjRwd0lqd2NnL1pkemNCWVBIMlBHMkphQ1dyZnlZ?=
 =?utf-8?B?MnhuK01ibm5ScWk0Z1o2S2dMMFp3S3pWbGlOSFJHZFA1cHIxajNVdERKM2FE?=
 =?utf-8?B?ckpsY2pnOFI5MFAxYWl2R3lwY2w2WWRmMXdIbFI1ejhvMExUdnNWeVlkR3Nj?=
 =?utf-8?B?R0d5bmZGQUZ5L3M4aUlFUWVtKzlpMEtTSFl0V3NzK3pSOEM5TGVKTG8wYkxk?=
 =?utf-8?B?S0xPcWhEdENJQm83TGJhMHgyYUFweTl4SHprYnY1ZFVONG5XVmo2RzgxR1lR?=
 =?utf-8?B?cVdSdzUyQy9CYVBIR1NwMU1jcVduZitrWHlIRUVicjFzSkZDKzRyWnpWN2Qy?=
 =?utf-8?B?cXpHWXJTUHpDeWlzbUlRRGJrNStiaVJDaGs3RTNJMXZnZzZzREZtWlgrektp?=
 =?utf-8?B?emxOWkhCZCtsSDA3Y1JYeXFTVTdQS3VJcjg0TDU5cXRmRzdSNDRFQkV4NENB?=
 =?utf-8?B?cFIyOVp1eHFTRnNZZkVRN1FXcnd3Z2R5OWIwTUlKZVFhVzVkUzZPN0NXckJB?=
 =?utf-8?B?Q2d0eFN0d3BGSnJnWlgzWUljU1ZmWXhiM2dUNkJIZ3l5UkkvcjNzV3BSaEp5?=
 =?utf-8?B?Nml6UHlSaElrbGc3VEZQWkRxOWhKUVJ3V0dpQm1FMTd0N0lvYis2Y3krL2Ns?=
 =?utf-8?B?VC9vZlNhVFAzaFQwSGNJOUE5TTQwZFBkQUFsaEtQTWVJT3Q4VVZPTEN6aFJ3?=
 =?utf-8?B?YjRXMVE2RGc4bkdnZlpTb2MyRlBHOXhBTUVSb2NhK0IzdSs1SWlDeFE2TSsv?=
 =?utf-8?B?TmJZUGkxa1duOHJXcFFWWlVidmkwdSttT1JVY1BsWmUyelpzTjVaSkVyajZD?=
 =?utf-8?B?UFJvK29yK2pwdEh2aStZcXNHc0NIVHBMNTQ1SzZOZXVhdWxFc3N6T1EzaUlj?=
 =?utf-8?B?Yk9jOVBJZnEzeHA4Umxlb3pqNDROR1NwREhBQ1pKMjh1Q0kzSVRGMzlaejFp?=
 =?utf-8?B?V3hMQWhEZThxSzh2WE5UamV1M3p5cXBqNWNqd2RZUThtQWdoNG42cGFxSTBm?=
 =?utf-8?B?OTJQeG9qdEFkc20xd2NkcG5keHQ0bFN6Z1FSbEdkeDRWS3V0WXNVN25CWnpZ?=
 =?utf-8?B?bmV5dHdOYnNWVmR2d0tyS1ZvVDVBbURwMFNnQlh1N1ZaNXJxMTE2YnBSVnk2?=
 =?utf-8?B?WjI2QW5zMHBqNzQvbGs0c3dLKzFhdlNGallDQVozZmN3Ymg1aTl5RFFhVVpB?=
 =?utf-8?B?WmdiamhmNG93T1FLdzFmMWpNd1QydTlENVR2RnV0aW96VThKbmlPcllSWEtn?=
 =?utf-8?B?ejJhUWdJQ1piNkFhYndwRC9mT3p1TFlHZ0RzZnd4R3VWT2lEQTJiNVQ3Mzdl?=
 =?utf-8?B?c2JGcVdmbDFtdXZtYWdlS1JoZFQxb2tSdnFnb3orSjJCWHBlVFgzS1UxUnVt?=
 =?utf-8?B?M091K2pwRnNKOERjakNaYnl0V2R6cThMMDk5VU1YaTZOSFhvZTN6K0JIYlhG?=
 =?utf-8?B?WURpb2tyNHpJODN3YUQ0dEh2Q1JGd0dsQ2twRXQ2WG9tVWVzbStjNzdFWWVr?=
 =?utf-8?B?RzQ3OCtMcFpkQ3RTSTIvdTBJUVhZZXlGTWdBUFRKcU03c0RveU5UcVJucDFH?=
 =?utf-8?B?TzR2eWFMb2FkRU5nSHBwRW8vKytYK25PbWkwYi9RREkwSy9JcEttZFV4Tk9v?=
 =?utf-8?B?SmdSeVU1YldUVFZsZmp3Y1gwY2RtVzNTUi9jRFVhL201enEwa2FMdC84anJ1?=
 =?utf-8?B?SWUrT2xOQmFPMjQwbXVPak96dm1zalRFQi90emcwTTdzaWVvM2lvVzF6emVi?=
 =?utf-8?B?Zmpxcm05Vk82NHZXREVLc283YWpQMWV2ckdHTWZEU0RsT3ZKRlk4dGdLVzAv?=
 =?utf-8?B?ZlNaQUpzdU00bDBtWXlnQVBuYndiamJlUjRNdDV4STZpSEIzSlg5MGQ3aTkr?=
 =?utf-8?B?T2NLL21NZC9oVXF2WkhIQTdESjRNNTV0Qm9nd05uOFgwbXZUeU5pLzlleUtN?=
 =?utf-8?B?ZmJGd3NxdVV2M1F2TzFLdWczOG9SUm9md05tVmM4SmQxemJINlZvQ0FSL3Q2?=
 =?utf-8?B?dEFwNjh5SjMxMGJrVW9NODI0TjNpUHJZQjY2RHpqMURqT2xGSWpSeTRSMU1M?=
 =?utf-8?B?TzNWRStZRVJEOUxRcXhaUHZaWUlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(14060799003)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rK4hu53uJ6KB3czOVRWZfYGuqrMHuPDmC4fp3vanPglNwqcSdMJH0Gfb5CSfRPF1DAPtga6nASBmJ7eP0UQDKxH0W9Y5glkw+dn6Jqp5dy0JNKz3GVjQEowSzo1anorfc/aPl1QrdZjRfZQWpHbnOnvyk4tjO7Zd099cIA1KMHhqbWXv5qD4XvMFmvJBPxDoBXPyl/m/s9ur0rHJPyIvGNer+Y7mqpBvNcIemoS4fXPVz2ofT1GC5x5QwUjxarBbcEMV9tL+Naj9nLvnjfkHeHsAw+UCF7BDmGfcF9KQnnngGJOkZYFR7oApmE2ZrglnEGX8037lI8zqS+kPyiUmfSKVsigGBh9r5ScYMhLfrwr0wYF2GFWBIR3EbueDD9l+sqQDwE4hYhG6mMdrPelq3lQoZvZp6qnKGSCy9/vLrUen8VH7Gqt81ta8SXFBgf+z
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 08:04:53.7215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0445af-ff36-4228-22d1-08de74448ef5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6380

SGkgTWFuaXZhbm5hbiwNCg0KPiBPbiAyNSBGZWIgMjAyNiwgYXQgMDg6NDUsIE1hbml2YW5uYW4g
U2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPiB3cm90ZToNCj4NCj4gSGkgQmVydHJhbmQsDQo+
DQo+IE9uIEZyaSwgRmViIDIwLCAyMDI2IGF0IDA5OjAyOjEyQU0gKzAwMDAsIEJlcnRyYW5kIE1h
cnF1aXMgd3JvdGU6DQo+PiBIaSBQYXJhdiwNCj4+DQo+Pj4gT24gMjAgRmViIDIwMjYsIGF0IDA3
OjEzLCBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0KPj4+DQo+Pj4NCj4+
Pg0KPj4+PiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPj4+PiBT
ZW50OiAyMCBGZWJydWFyeSAyMDI2IDA1OjI1IEFNDQo+Pj4+DQo+Pj4+IE9uIEZyaSwgRmViIDEz
LCAyMDI2IGF0IDAxOjUyOjA2UE0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4+Pj4+IEhp
IEJpbGwsDQo+Pj4+Pg0KPj4+Pj4+IEZyb206IEJpbGwgTWlsbHMgPGJpbGwubWlsbHNAbGluYXJv
Lm9yZz4NCj4+Pj4+PiBTZW50OiAyNiBKYW51YXJ5IDIwMjYgMTA6MDIgUE0NCj4+Pj4+Pg0KPj4+
Pj4+IFRoaXMgc2VyaWVzIGFkZHMgdGhlIHZpcnRpby1tc2cgdHJhbnNwb3J0IGxheWVyLg0KPj4+
Pj4+DQo+Pj4+Pj4gVGhlIGluZGl2aWR1YWxzIGFuZCBvcmdhbml6YXRpb25zIGludm9sdmVkIGlu
IHRoaXMgZWZmb3J0IGhhdmUgaGFkIGRpZmZpY3VsdHkgaW4NCj4+Pj4+PiB1c2luZyB0aGUgZXhp
c3RpbmcgdmlydGlvLXRyYW5zcG9ydHMgaW4gdmFyaW91cyBzaXR1YXRpb25zIGFuZCBkZXNpcmUg
dG8gYWRkIG9uZQ0KPj4+Pj4+IG1vcmUgdHJhbnNwb3J0IHRoYXQgcGVyZm9ybXMgaXRzIHRyYW5z
cG9ydCBsYXllciBvcGVyYXRpb25zIGJ5IHNlbmRpbmcgYW5kDQo+Pj4+Pj4gcmVjZWl2aW5nIG1l
c3NhZ2VzLg0KPj4+Pj4+DQo+Pj4+Pj4gSW1wbGVtZW50YXRpb25zIG9mIHZpcnRpby1tc2cgd2ls
bCBub3JtYWxseSBiZSBkb25lIGluIG11bHRpcGxlIGxheWVyczoNCj4+Pj4+PiAqIGNvbW1vbiAv
IGRldmljZSBsZXZlbA0KPj4+Pj4+ICogYnVzIGxldmVsDQo+Pj4+Pj4NCj4+Pj4+PiBUaGUgY29t
bW9uIC8gZGV2aWNlIGxldmVsIGRlZmluZXMgdGhlIG1lc3NhZ2VzIGV4Y2hhbmdlZCBiZXR3ZWVu
IHRoZSBkcml2ZXINCj4+Pj4+PiBhbmQgYSBkZXZpY2UuIFRoaXMgY29tbW9uIHBhcnQgc2hvdWxk
IGxlYWQgdG8gYSBjb21tb24gZHJpdmVyIGhvbGRpbmcgbW9zdA0KPj4+Pj4+IG9mIHRoZSB2aXJ0
aW8gc3BlY2lmaWNzIGFuZCBjYW4gYmUgc2hhcmVkIGJ5IGFsbCB2aXJ0aW8tbXNnIGJ1cyBpbXBs
ZW1lbnRhdGlvbnMuDQo+Pj4+Pj4gVGhlIGtlcm5lbCBpbXBsZW1lbnRhdGlvbiBpbiBbM10gc2hv
d3MgdGhpcyBzZXBhcmF0aW9uLiBBcyB3aXRoIG90aGVyIHRyYW5zcG9ydA0KPj4+Pj4+IGxheWVy
cywgdmlydGlvLW1zZyBzaG91bGQgbm90IHJlcXVpcmUgbW9kaWZpY2F0aW9ucyB0byBleGlzdGlu
ZyB2aXJ0aW8gZGV2aWNlDQo+Pj4+Pj4gaW1wbGVtZW50YXRpb25zICh2aXJ0aW8tbmV0LCB2aXJ0
aW8tYmxrIGV0YykuIFRoZSBjb21tb24gLyBkZXZpY2UgbGV2ZWwgaXMgdGhlDQo+Pj4+Pj4gbWFp
biBmb2N1cyBvZiB0aGlzIHZlcnNpb24gb2YgdGhlIHBhdGNoIHNlcmllcy4NCj4+Pj4+Pg0KPj4+
Pj4+IFRoZSB2aXJ0aW8tbXNnIGJ1cyBsZXZlbCBpbXBsZW1lbnRzIHRoZSBub3JtYWwgdGhpbmdz
IGEgYnVzIGRlZmluZXMNCj4+Pj4+PiAoZW51bWVyYXRpb24sIGRtYSBvcGVyYXRpb25zLCBldGMp
IGJ1dCBhbHNvIGltcGxlbWVudHMgdGhlIG1lc3NhZ2Ugc2VuZCBhbmQNCj4+Pj4+PiByZWNlaXZl
IG9wZXJhdGlvbnMuIEEgbnVtYmVyIG9mIGJ1cyBpbXBsZW1lbnRhdGlvbnMgYXJlIGVudmlzaW9u
ZWQsDQo+Pj4+Pj4gc29tZSBvZiB3aGljaCB3aWxsIGJlIHJldXNhYmxlIGFuZCBnZW5lcmFsIHB1
cnBvc2UuIE90aGVyIGJ1cyBpbXBsZW1lbnRhdGlvbnMNCj4+Pj4+PiBtaWdodCBiZSB1bmlxdWUg
dG8gYSBnaXZlbiBzaXR1YXRpb24sIGZvciBleGFtcGxlIG9ubHkgdXNlZCBieSBhIFBDSWUgY2Fy
ZA0KPj4+Pj4+IGFuZCBpdHMgZHJpdmVyLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhlIHN0YW5kYXJkIGJ1
cyBtZXNzYWdlcyBhcmUgYW4gZWZmb3J0IHRvIGF2b2lkIGRpZmZlcmVudCBidXMgaW1wbGVtZW50
YXRpb25zDQo+Pj4+Pj4gZG9pbmcgdGhlIHNhbWUgdGhpbmcgaW4gZGlmZmVyZW50IHdheXMgZm9y
IG5vIGdvb2QgcmVhc29uLiBIb3dldmVyIHRoZQ0KPj4+Pj4+IGRpZmZlcmVudCBlbnZpcm9ubWVu
dHMgd2lsbCByZXF1aXJlIGRpZmZlcmVudCB0aGluZ3MuIEluc3RlYWQgb2YgdHJ5aW5nIHRvDQo+
Pj4+Pj4gYW50aWNpcGF0ZSBhbGwgbmVlZHMgYW5kIHByb3ZpZGUgc29tZXRoaW5nIHZlcnkgYWJz
dHJhY3QsIHdlIHRoaW5rDQo+Pj4+Pj4gaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgbWVzc2FnZXMg
d2lsbCBiZSBuZWVkZWQgYXQgdGhlIGJ1cyBsZXZlbC4gT3ZlciB0aW1lLA0KPj4+Pj4+IGlmIHdl
IHNlZSBzaW1pbGFyIG1lc3NhZ2VzIGFjcm9zcyBtdWx0aXBsZSBidXMgaW1wbGVtZW50YXRpb25z
LCB3ZSB3aWxsIG1vdmUgdG8NCj4+Pj4+PiBzdGFuZGFyZGl6ZSBhIGJ1cyBsZXZlbCBtZXNzYWdl
IGZvciB0aGF0Lg0KPj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gSSB3b3VsZCByZXZpZXcgbW9yZSwgaGFk
IGZpcnN0IHJvdW5kIG9mIHNwYXJzZSByZXZpZXcuDQo+Pj4+PiBQbGVhc2UgZmluZCBmZXcgY29t
bWVudHMvcXVlc3Rpb25zIGJlbG93Lg0KPj4+Pg0KPj4+PiBJJ2QgbGlrZSB0byBjb21tZW50IHRo
YXQgSSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBoYXZlIGEgYmFzaWMgc2ltcGxlIHRyYW5zcG9y
dCBhbmQNCj4+Pj4gdGhlbiBhZGQgcGVyZm9ybWFuY2UgZmVhdHVyZXMgb24gdG9wIGFzIGFwcHJv
cHJpYXRlLg0KPj4+IFNvdW5kcyBnb29kLiBTaW1wbGUgYnV0IGNvbXBsZXRlIGlzIG5lZWRlZC4N
Cj4+DQo+PiBBZ3JlZS4NCj4+DQo+Pj4NCj4+Pj4gU28gb25lIHdheSB0byBhZGRyZXNzIHNvbWUg
b2YgdGhlc2UgY29tbWVudHMgaXMgdG8gc2hvdyBob3cNCj4+Pj4gdGhleSBjYW4gYmUgYWRkcmVz
c2VkIHdpdGggYSBmZWF0dXJlIGJpdCBkb3duIHRoZSByb2FkLg0KPj4+Pg0KPj4+Pg0KPj4+Pj4g
MS4gZGV2aWNlIG51bWJlciBzaG91bGQgYmUgMzItYml0IGluIHN0cnVjdCB2aXJ0aW9fbXNnX2hl
YWRlci4NCj4+Pj4+PiBGcm9tIFNJT1ZfUjIgZXhwZXJpZW5jZXMsIHdlIGxlYXJudCB0aGF0IHNv
bWUgdXNlcyBoYXZlIHVzZSBjYXNlIGZvciBtb3JlIHRoYW4gNjRrIGRldmljZXMuDQo+Pj4+PiBB
bHNvIG1hcHBpbmcgUENJIEJERiB3b250IGJlIGVub3VnaCBpbiAxNi1iaXRzIGNvbnNpZGVyaW5n
IGRvbWFpbiBmaWVsZC4NCj4+Pj4+DQo+Pj4+PiAyLiBtc2dfc2l6ZSBvZiAxNi1iaXRzIGZvciA2
NEtCLTggYnl0ZXMgaXMgdG9vIGxlc3MgZm9yIGRhdGEgdHJhbnNmZXIuDQo+Pj4+PiBGb3IgZXhh
bXBsZSwgYSBUQ1Agc3RyZWFtIHdhbnRzIHRvIHNlbmQgNjRLQiBvZiBkYXRhICsgcGF5bG9hZCwg
bmVlZHMgbW9yZSB0aGFuIDY0S0IgZGF0YS4NCj4+Pj4+IE5lZWRzIDMyLWJpdHMuDQo+Pj4+Pg0K
Pj4+Pj4gMy4gQlVTX01TR19FVkVOVF9ERVZJQ0UgdG8gaGF2ZSBzeW1tZXRyaWMgbmFtZSBhcyBB
RERFRCBhbmQgUkVNT1ZFRCAoaW5zdGVhZCBvZiBSRUFEWSkNCj4+Pj4+IEJ1dCBtb3JlIGJlbG93
Lg0KPj4+Pj4NCj4+Pj4+IDQuIEkgZG9udCBmaW5kIHRoZSB0cmFuc3BvcnQgbWVzc2FnZXMgdG8g
cmVhZCBhbmQgd3JpdGUgdG8gdGhlIGRyaXZlciBtZW1vcnkgc3VwcGxpZWQgaW4gVklSVElPX01T
R19TRVRfVlFVRVVFIGFkZHJlc3NlcyB0byBvcGVyYXRlDQo+Pj4+IHRoZSB2aXJ0cXVldWVzLg0K
Pj4+Pj4gRG9udCB3ZSBuZWVkIFZJUlRJT19NRU1fUkVBRCwgVklSVElPX01FTV9XUklURSByZXF1
ZXN0IGFuZCByZXNwb25zZT8NCj4+Pj4NCj4+Pj4gc3VyZWx5IHRoaXMgY2FuIGJlIGFuIG9wdGlv
bmFsIHRyYW5zcG9ydCBmZWF0dXJlIGJpdC4NCj4+Pj4NCj4+PiBIb3cgaXMgdGhpcyBvcHRpb25h
bD8NCj4+DQo+PiBBcyBzYWlkIGluIGEgcHJldmlvdXMgbWFpbCwgd2UgaGF2ZSBtZXNzYWdlcyBh
bHJlYWR5IGZvciB0aGF0Lg0KPj4gUGxlYXNlIGNvbmZpcm0gaWYgdGhhdCBhbnN3ZXIgeW91ciBx
dWVzdGlvbi4NCj4+DQo+Pj4gSG93IGNhbiBvbmUgaW1wbGVtZW50IGEgdHJhbnNwb3J0IHdpdGhv
dXQgZGVmaW5pbmcgdGhlIGJhc2ljIGRhdGEgdHJhbnNmZXIgc2VtYW50aWNzPw0KPj4NCj4+IFdl
IGRpZCBhIGxvdCBvZiBleHBlcmltZW50cyBhbmQgd2UgYXJlIGZlYXR1cmUgZXF1aXZhbGVudCB0
byBQQ0ksIE1NSU8gb3IgQ2hhbm5lbCBJL08uDQo+PiBJZiBhbnl0aGluZyBpcyBtaXNzaW5nLCB3
ZSBhcmUgbW9yZSB0aGFuIGhhcHB5IHRvIGRpc2N1c3MgaXQgYW5kIHNvbHZlIHRoZSBpc3N1ZS4N
Cj4+DQo+DQo+IEknZCBsb3ZlIHRvIGhhdmUgdGhpcyB0cmFuc3BvcnQgb3ZlciBQQ0kgYmVjYXVz
ZSBpdCBhZGRyZXNzZXMgdGhlIHNob3J0Y29taW5ncw0KPiBvZiB0aGUgZXhpc3RpbmcgUENJIHRy
YW5zcG9ydCB3aGljaCBqdXN0IGFzc3VtZXMgdGhhdCBldmVyeSBjb25maWcgc3BhY2UgYWNjZXNz
XA0KPiBpcyB0cmFwIGFuZCBlbXVsYXRlLg0KDQpBZ3JlZSBhbmQgQU1EIGRpZCBleGFjdGx5IHRo
YXQgaW4gdGhlaXIgZGVtb25zdHJhdG9yLg0KSSB3aWxsIGdpdmUgeW91IGFuc3dlcnMgaGVyZSBh
cyBpIGtub3cgdGhlbSBidXQgRWRnYXIgd2lsbCBwcm9iYWJseSBnaXZlIHlvdSBtb3JlDQpkZXRh
aWxzIChhbmQgcHJvYmFibHkgZml4IG15IG1pc3Rha2VzKS4NCg0KPg0KPiBCdXQgdGhhdCBiZWlu
ZyBzYWlkLCBJIHNvbWV3aGF0IGFncmVlIHdpdGggUGFyYXYgdGhhdCB3ZSBzaG91bGQgZGVmaW5l
IHRoZSBidXMNCj4gaW1wbGVtZW50YXRpb25zIGluIHRoZSBzcGVjIHRvIGF2b2lkIGZpeGluZyB0
aGUgQUJJIGluIHRoZSBpbXBsZW1lbnRhdGlvbnMuIEZvcg0KPiBpbnN0YW5jZSwgaWYgd2UgdHJ5
IHRvIHVzZSB0aGlzIHRyYW5zcG9ydCBvdmVyIFBDSSwgd2UndmUgZ290IHF1ZXN0aW9ucyBsaWtl
Og0KPg0KPiAxLiBIb3cgdGhlIGRldmljZSBzaG91bGQgYmUgYmluZCB0byB0aGUgdmlydGlvLW1z
Zy1wY2kgYnVzIGRyaXZlciBhbmQgbm90IHdpdGgNCj4gdGhlIGV4aXN0aW5nIHZpcnRpby1wY2kg
ZHJpdmVyPyBTaG91bGQgaXQgdXNlIGEgbmV3IFZlbmRvciBJRCBvciBTdWItSURzPw0KDQpPbmUg
YnVzIGlzIGFwcGVhcmluZyBhcyBvbmUgcGNpIGRldmljZSB3aXRoIGl0cyBvd24gVmVuZG9yIElE
LA0KDQo+DQo+IDIuIEhvdyB0aGUgVmlydGlvIG1lc3NhZ2VzIHNob3VsZCBiZSB0cmFuc2ZlcnJl
ZD8gSXMgaXQgdGhyb3VnaCBlbmRwb2ludCBjb25maWcNCj4gc3BhY2Ugb3IgdGhyb3VnaCBzb21l
IG90aGVyIG1lYW5zPw0KDQpUaGUgdmlydGlvIG1lc3NhZ2VzIGFyZSB0cmFuc2ZlcmVkIHVzaW5n
IEZJRk9zIHN0b3JlZCBpbiB0aGUgQkFSIG9mIHRoZSBQQ0kNCmRldmljZSAoZW5kaW5nIHVwIGJl
aW5nIG1lbW9yeSBzaGFyZWQgYmV0d2VlbiBib3RoIHNpZGVzKQ0KDQo+DQo+IDMuIEhvdyB0aGUg
bm90aWZpY2F0aW9uIGJlIGRlbGl2ZXJlZCBmcm9tIHRoZSBkZXZpY2UgdG8gdGhlIGhvc3Q/IFRo
cm91Z2gNCj4gSU5ULVgvTVNJL01TSS1YIG9yIGV2ZW4gcG9sbGluZz8NCg0KTm90aWZpY2F0aW9u
cyBhcmUgZGVsaXZlcmVkIHRocm91Z2ggTVNJLg0KDQo+DQo+IEFuZCB0aGVzZSBhcmUganVzdCBh
IGZldyBxdWVzdGlvbnMgdGhhdCBjb21lcyB0byB0aGUgdG9wIG9mIG15IGhlYWQuIFRoZXJlIGNv
dWxkDQo+IGJlIHBsZW50eSBtb3JlLg0KPg0KPiBIb3cgY2FuIHdlIGV4cGVjdCBhbGwgdGhlIHZp
cnRpby1tc2cgYnVzIGltcGxlbWVudGF0aW9ucyB0byBhZGhlcmUgdG8gdGhlIHNhbWUNCj4gZm9y
bWF0IHNvIHRoYXQgdGhlIGludGVyb3BlcmFiaWxpdHkgb2ZmZXJlZCBieSB0aGUgVmlydGlvIHNw
ZWMgaXMgZ3VhcmFudGVlZD8NCg0KV2Ugc3BlbnQgYSBsb3Qgb2YgdGltZSB0aGlua2luZyBvbiB0
aGF0ICh0aGlzIHN0YXJ0ZWQgYXJvdW5kIDIgeWVhcnMgYWdvKSBhbmQgd2UNCmRpc2N1c3NlZCBz
ZXZlcmFsIHVzZSBjYXNlcyBhbmQgZGlkIHNvbWUgUG9DIHRvIHRyeSB0byBoYXZlIGV2ZXJ5dGhp
bmcgY292ZXJlZA0KKHNlY3VyZSB0byBub24gc2VjdXJlIGFuZCB2bSB0byB2bSB1c2luZyBmZmEs
IHN5c3RlbSB0byBzeXN0ZW0gb3ZlciBQQ0kgb3IgaGFyZHdhcmUNCm1lc3NhZ2luZyBzeXN0ZW0s
IFBDSSwgWGVuIHNwZWNpZmljIGltcGxlbWVudGF0aW9uKSB0byBjaGVjayB0aGUgbmVlZHMgYW5k
IHRyeSB0bw0KY292ZXIgYXMgbXVjaCBhcyB3ZSBjYW4uDQoNCk5vdyB0aGVyZSBtaWdodCBiZSBj
YXNlcyB3ZSBtaXNzZWQgYnV0IHdlIHRoaW5rIHRoYXQgaGF2aW5nIGEgcHVyZWx5IG1lc3NhZ2Ug
YmFzZWQNCmludGVyZmFjZSBiZXR3ZWVuIHRoZSBidXMgYW5kIHRoZSB0cmFuc3BvcnQgYW5kIHNw
bGl0IHJlc3BvbnNpYmlsaXRpZXMgdGhlIHdheSB3ZSBkaWQNCmlzIGFsbG93aW5nIGxvdHMgb2Yg
ZGlmZmVyZW50IGJ1cyBpbXBsZW1lbnRhdGlvbnMgd2l0aG91dCBhZmZlY3RpbmcgdGhlIHRyYW5z
cG9ydCBhbmQNCmRyaXZlci9kZXZpY2UgaW1wbGVtZW50YXRpb25zIG9uIHRvcC4NCg0KV2UgaWRl
bnRpZmllZCB0aGF0IGEgY29tbW9uIHVzZSBjYXNlIHdpbGwgYmUgZm9yIHRoZSBidXMgdG8gdHJh
bnNmZXIgbWVzc2FnZXMgdXNpbmcNCkZJRk9zIHRvIG9wdGltaXplIHNwZWVkIChhdCB0aGUgZW5k
IHlvdSBuZWVkIHRvIGhhdmUgYSB3YXkgdG8gc2hhcmUgbWVtb3J5IGJldHdlZW4NCmJvdGggc2lk
ZXMgc28gd2h5IG5vdCB1c2luZyBhIHBhcnQgb2YgaXQgdG8gdHJhbnNmZXIgdGhlIG1lc3NhZ2Vz
IHRvIGFuZCByZWR1Y2UgdGhlIG51bWJlcg0Kb2YgZGF0YSBleGNoYW5nZXMgYW5kIGNvcGllcykg
YW5kIHRoaXMgd2lsbCBiZSB1c2VkIGJ5IFBDSSwgWGVuLCBGRi1BIGFuZCBvdGhlcnMgaW4NCnBy
YWN0aWNlIChzbyB3ZSBtaWdodCBzdGFuZGFyZGl6ZSB0aGUgRklGTyBmb3JtYXQgaW4gdGhlIGZ1
dHVyZSB0byBhbGxvdyBldmVuIG1vcmUgY29kZQ0KcmV1c2UgYmV0d2VlbiBidXNzZXMpLg0KDQpJ
ZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIG9yIGRvdWJ0cywgb3IgaWYgeW91IGhhdmUgYSB1c2Ug
Y2FzZSB0aGF0IHNob3VsZCBiZSBpbnZlc3RpZ2F0ZWQNCnBsZWFzZSB0ZWxsIHVzLg0KDQpDaGVl
cnMNCkJlcnRyYW5kDQoNCg0KPg0KPiAtIE1hbmkNCj4NCj4gLS0NCj4g4K6u4K6j4K6/4K614K6j
4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQ0KDQpJTVBPUlRBTlQgTk9USUNF
OiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25m
aWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBp
bnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBh
bmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2Ug
aXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBh
bnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=
