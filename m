Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C06B1EB19A
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500246; cv=fail; b=mRmvOGsPErOky5wL+3mpX8eWn4JzuYDVKsGfMhq/gZdVGQpIjW7C3cHK9g0Ieb3j8caBR5cLuEWOTBNA8eujf9vdG/JDJGIHtd98avO2vh2FCFEW19m2m+BtJeDQKX3lrEA/ePggxUqSo7vLd8b0halkT6AAiyam4+0FB8sRqBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500246; c=relaxed/simple;
	bh=eEqDjg8RF8OObpgwgljV6J//vC9mQw3Fu97GqaShSdw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i+ugbP5GKKUb8tibYQc9PY3sPBIEf6mT2nE+yLh3pUDCVD7V7ysDlTwZFZ+WO3O6QtmYB+YTfZ0Gzlwji6BwXpSLO3SFh5XXVCINTG8iJEJOqgq45fzxIxBDMPdFwBCNUWMrdLxRq8C5RCwrLB6d8MhE++W0CeA00vFiQd/Y1TM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HoclyJ+t; arc=fail smtp.client-ip=40.107.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HoclyJ+t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oy2R2zokn2S/KD33fdYS5v+FupdHDrlSWZ4rKoxEI+beBQosGBZ/oPNxSDG62q7lE/ZjsLuthAp2UgO6dhYpoWnREfqr/9xddcR9o9NOhhoydLHV32JS88bWqbXieRTfJycMlhyckHikMjOnyjnjCl9/gbBM2LhqONXumuckxyROCwNMUTu9tH6ymU4YfrZpXXk4w10VZTOgQq8U7pP3PuqJ31HRIKuCizH6kniGsGu18yOY6ciWQaTTZCkgvMYOCWUm7LiEHWLXfHVmb1CdyANZuHT5hULCDywAN5VEqY/ZKNSDdG1tJgymlW+aRpgMPpobGb+I45tzR7jVYRFL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEqDjg8RF8OObpgwgljV6J//vC9mQw3Fu97GqaShSdw=;
 b=NY6ZsMSH6BQxLPxLCeE1Y8WzFkHBPl6B/UtLXx8MkluI/hSRz3vsji+3kWbrUsPKHVYCPCD0uiJ+6xjD1p95R9E6NlYpeNKt1N4rSInpTeGlsjGu9un4xk1H6P2KpkriXDjLZomOnUli8zew7ojs5yS+Eg8l2UoA3ZZYXOioSP/oOvsyswOTSk/i+SUseNU02jAO92iGx9CH0hjNuIZYT+mmB3rpj7WxL7mGryAI9GZcrxnEplLyl3/MwsQQEKRO9Bh3EM+ayG5QJbDmjDZVDO1IxqjNswpg4A4mjecdAy9BTi4x7YLfVZeXQCgWxX5HT1LWGsBlsqZAmnfpmjCNUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEqDjg8RF8OObpgwgljV6J//vC9mQw3Fu97GqaShSdw=;
 b=HoclyJ+t8B2WRyMAgXfLAxL/vkx6/aAhKasQsJLQxjVrrna7zYpMsp0W/FeA8ynw4ju8TZjcZq+Ewmfr6hdeP9PpUmfNcG945DXkg2wACMw6xrip2cHcWEOzBrqmwtY9bYMr8WWCdo1R8pvIJjvNZFOtSeps4S9bBB9TUAwPy902Rklhaks0damG35+XNPf+7xVEXsOKNJf85JO62I9bl5igvqa3yRgKvJz4qA4aapiTyqsMqZ0kExbWLobwBqnyv7HGqXCQO12qpCUGv8SEHfJpNZEqCZgB+0g9YfmaBsRSO4dJfKMSNgrgBbfJy4Uudw+BZg7eYDyW+9t254rKHw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM4PR12MB6182.namprd12.prod.outlook.com (2603:10b6:8:a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 09:37:21 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 09:37:21 +0000
From: Parav Pandit <parav@nvidia.com>
To: Sergio Lopez Pascual <slp@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>
Subject: RE: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
Thread-Topic: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
Thread-Index:
 AQHbolXliN53xUoF0UGmhntfFfdrcrONa8OAgAAG04CAARWygIAAARpggAAENYCAAABZ4A==
Date: Tue, 1 Apr 2025 09:37:21 +0000
Message-ID:
 <CY8PR12MB7195B8C5D33157328BA9DA34DCAC2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250331150548.50595-1-slp@redhat.com>
 <20250331150548.50595-2-slp@redhat.com>
 <20250331121538-mutt-send-email-mst@kernel.org>
 <CAAiTLFXdYDSgZnYAgGC-FpMcyOnqBZpiTrHOk=4x_jFiRzkcbg@mail.gmail.com>
 <20250401050828-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195A0BA1C5D6946196D65DCDCAC2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <CAAiTLFX_RmzJfuLaJ+95S+k6Y20o62Hzyxwe+HwHRzkob=NCkA@mail.gmail.com>
In-Reply-To:
 <CAAiTLFX_RmzJfuLaJ+95S+k6Y20o62Hzyxwe+HwHRzkob=NCkA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM4PR12MB6182:EE_
x-ms-office365-filtering-correlation-id: 03734962-fecd-4f60-7397-08dd7100cd3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OEV0Q01VUlIzaStiUGtqcnRkdXkrNXhmb05UV0xxZjY3dFR3WnJ2V09OdCsx?=
 =?utf-8?B?MmVRQTMrcG50QXJiOC9lWTlNRitZN3FPalZ2b1l1NlhYWjBJOUsyTXl5RHlD?=
 =?utf-8?B?Z0F3bGtRMWo4QjkwcXFYYzVwcUNtM291ZU5UcWNvUGwwY21jTzhvazY3WFVs?=
 =?utf-8?B?dGczWVZvV21Uc0pjTzBad3lKY3JwV0NwbEEvNXNMZEIwYzJjTk1Bdk5uOEsz?=
 =?utf-8?B?NzUyczREbU93YjVoVmdXUC9WS1ZqYmVxWDA5YWx6OXFwd0pNb0grYjc3RVVY?=
 =?utf-8?B?QVlzSDdUNk5aM01wY2ltV2lHbjErV0pLVENoVE8vZUxIRHJUcnpNOE9rbkV2?=
 =?utf-8?B?WkhOWHdZOFd1S2JaMnFnZzNWU0xsclN6ZWFQZDhCTjQ0QmFHZHhzOGNyU213?=
 =?utf-8?B?VDl0RmpGOW42U0xWREJIZnlRY09VRUYwM29XaEljOTBjN3MxZUhBZkxBL01h?=
 =?utf-8?B?cVIyMWsxQlRJeFdZMGZ3dDRLTUFZeXhBUlFURDhSdUxVU2RROFMyVVB6MmNH?=
 =?utf-8?B?ZGdZLzlUT0VIUlNncWFldmZkajlHNWdaVkowMTg2ZzdKbjdSUXFJK0t2M2J0?=
 =?utf-8?B?UGJScUU2R1JMY2p5SXdzWGRveGY3V3pPdTB2blZOdUpDRnBpTzJLSUdKVTgr?=
 =?utf-8?B?aGNIeHpxZG9uUlJHVEdsY1pDaXdldTN0bm1PZFRnNmtKU0swd25uUjhBcTVJ?=
 =?utf-8?B?UWNYS0YvQk52bFNiYmNXUjBhL3JNWmoyZjdmcXJzRzVHMTZrSW5JN0t2eWMv?=
 =?utf-8?B?VHBqenpndXZhWERYRWkxZzFlOVlzc3hsdGhnK3JhbmVpNFl5Lzl5ZWpGbFNL?=
 =?utf-8?B?UUJ2ZGdIclV1WTdoeEdydHdwM3RNOEpHVklaeE9HSUNoWEtRWFlWRmhiVnUy?=
 =?utf-8?B?eDRTZGh1TWR3VVpxdXVLcWNCa0tpeUY4TFNqMlVWQmZzN1diVFBYN3ZscXlj?=
 =?utf-8?B?eGZCWHNzdWtOQlVOWE90TVgrRjdtUkR6bXVxK0RPUW1OZE92ZFNlYWNSMzkw?=
 =?utf-8?B?WVdTWUpOVXRTTlpNMEdsUEg1UE10aG5TNkhKdjhQa0RLL0JJQ0ZyVGlHaFNE?=
 =?utf-8?B?Z1RndUUxclcwRmlRei9BOWNvamllc3M0RHVlcndhcVRrYURFd3cvMVNYWU9Q?=
 =?utf-8?B?TjRHV09hMy9qNUd3MHBGT0NPU1NsSFdaUG9wNFIyTk1LNDBzSk5YUFpkRVds?=
 =?utf-8?B?OHR3eGc2NTZWdGJET0kvNEpmTnNSTXRPNXpRR2p0TjhXTjVaRDZSZGREcm9j?=
 =?utf-8?B?UkFDMFlqRTB5cHNONFBpV29nc3RmdmVKbEJzQlE0bkJ6TEUyYkFlYThPOWhu?=
 =?utf-8?B?NkE4bG45SkVFcm5ZMjJ4S2ZBeVBOZmdwMmVQZmVabHVCcVlnL0piQmREeXZi?=
 =?utf-8?B?SUwxR0c1SloyVkplOTdOK2FUREs2M3Z3bEVuTUc1Q20wL1JwNThORlh1R0lj?=
 =?utf-8?B?T3N5Zmljdm55SU45SGNMM2ExZGIxVGdlSjNTbkVEZFN0Y3dmVjMxOE9DUjJn?=
 =?utf-8?B?ZzErZFNKS0RqYXd3aHdQYnFqcXlQTjRMd1B1VnlwSnU2dmdTOVJybi9vMUdm?=
 =?utf-8?B?cHRsL3h0OWM1UXFXby9UYy9jZXhUaEc2YWJNSUpPTEorVkkyVjFqY3hpYU9h?=
 =?utf-8?B?OWp2enVQclpwVDkyb0MzT2ZSYWFKbWgxWkpGdklsTVhkS0xHUWdXcTBVOG5W?=
 =?utf-8?B?M3ZOL25JUzZkTndrcUpacmdmYkJVVWlEWnh5MXlYSnFGLzZqRHdtRldwVkJQ?=
 =?utf-8?B?aDhtWnhzNWtKc01hOURacHVvTlk1Sm82MktGdFJ6ak9oM043aWpFMFpTK011?=
 =?utf-8?B?dFR1MXBBYktGUHFGRDk3b0VFNlFJNG8wcDYwU3ZNK2NsNlQxSmRRYmdNTUxK?=
 =?utf-8?B?enREaVQ2TlNUYmtoV3B3Mk9tcllsVC9xdFhHZDlnU2UyZDFBS05SNVRKMGpu?=
 =?utf-8?B?TDNzc3hObGtLbjE3RitHTkI3SjRWRWpHakFodGNBSWxxUm9BUEJ2NDhXU1dG?=
 =?utf-8?Q?20fqkd6FsVNfVSFw0+/2cjVlg0bXYg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zjh2QngzOTVOVWtaZFN1RTg1YmNkR21GMVpCbUtuajU1eGZpVHh1Z1dxcGF1?=
 =?utf-8?B?a2xZejVqRnFVcHhOWHpCaHZyc3hvSzQ3ZTBEc01zcGdwQVlsbUIxcnhFUWxN?=
 =?utf-8?B?UUMzL2xVcTBnWmNqQ1NGd2phK3FiK3NnWnNFdHg3TkNuQ2xuRDV6RldwZlNB?=
 =?utf-8?B?Q0JVOGNVWkdVbytkU2hqTUlFNVJVcnhyT0doeDhXUlN4STJqcmRwUmlPNTcv?=
 =?utf-8?B?NVgwQmV1OCtTZW8yQTQrZjY1RUF3Mk1nWENUcDd2ekcyV3NTR3dkdEl6MHlO?=
 =?utf-8?B?LzlGbzVKY1ZXYytkODcwbzVHeUU3UkZBMC9wL1RGbXl3MU1NVStjL3VsYWV5?=
 =?utf-8?B?MWd4K2JGWUV0c3ZUMG44UDJEdFUwaFVON1ZDdXdjbkJwV0krQVU3Umd1N3NK?=
 =?utf-8?B?emx6T3A4Q2hMcmtjWDI3TUtGdkROMndQbmNBWCtJM29HUEk1WmR2TGovMkNv?=
 =?utf-8?B?T3YxMXJvK0MyMVBEcDBNNklCd2UxU3h5alN4aUVsak4wZXVxQnRyUFhRaUtE?=
 =?utf-8?B?RmhrVHlkdSt1Ung0V2hYbXBkdzZlNGNXSUloY3NVV1B5enFCTEhQNytkTzll?=
 =?utf-8?B?em8yTGZKWHczTHBvRlhZR29JR0VjdTBEOGREdmpNVHkyL0d5ZUd2WXJKd2lT?=
 =?utf-8?B?VDU5SFZLMk1TVWVNTmRBc3dxK0IwYUl1cTdqaVpub0pXN2hkTHBuaUNkUU1W?=
 =?utf-8?B?NThwczJETTN2VWxjNVQ0TllIcWVLU2ljTVFiVisvc3RzZ2oxdElkeXB3K0x1?=
 =?utf-8?B?UzhwaTlNRkdsdm01SDQ3Rmwva0FjbWcrQjA0RmhtOGNKVUozMTgxamtacXNE?=
 =?utf-8?B?bEhxMzFjYWZ4QlY4ZXVCbFNJcE9qU1U5cGZQbnQ3WWpkOC9ZR2Z2b0dPNEly?=
 =?utf-8?B?TlBCTHY1MTllK2dtWWFCdGNsOW1YWS9XclZRRlZuQ1lrbjgvRnhNV3U5VXVT?=
 =?utf-8?B?ZXlVQWtoUnRvZUprZTFnNXNxcG5FMU81bHpOZklWL2prUksxVjdGSGJUU1Qw?=
 =?utf-8?B?a1VRODY1Mk4zaTJSdnU4cVQrbXVzeXNkODRkWHBYMmxhdVl6eFBPZUJFYnk0?=
 =?utf-8?B?SHNmc0RTbmhrTkoxR0tVOVBRS3lvQkMzb3BZVnN3amQwZ3VwUUlRQy9BZndZ?=
 =?utf-8?B?OHhSdktPVG45T0NEYnZxV2lyVStsbUJpMDIzemFkMkFzSllGdC9oQm9IR0V4?=
 =?utf-8?B?bExXa0prY1JpK3RJK05vZlN4TVN6czBCUjR6M2wxazBTRDViVE9sSjViSDJO?=
 =?utf-8?B?d1h2aXpCNDk4Mlg4M0poa2t4bkFEQyszeUswNTYyWUMzWVVJSnk2bzg0OVBU?=
 =?utf-8?B?MGk3b0Z2eWhFcnl4WXE3ditFZytCc3dtUUJSRUsrcDREL0x3N2tMOCtreWk4?=
 =?utf-8?B?emZMK0hLb0VTbmNWcVFIUDl2a3cyazNiWjR4VXlWUld2ckRGQ2tGUFgrZE00?=
 =?utf-8?B?SjhadlBVMUloaHpzR2MxY1h0ZHNMWlFVNzA1VUlYSTFmeUk3RGdrcS9sSUtq?=
 =?utf-8?B?ZW1BRHc5cEk2QVp6V20xazY1RkVOL3R1Q0FBWHN6bEE1T0FpZGxnU09FWlF2?=
 =?utf-8?B?TExjL3EyWUZ4Wm0wZHJmbkczWThTSlMzUWVpL2Z4cWNUQjB0c21pYVZjYWhB?=
 =?utf-8?B?VGhyVFN2ZlNVeTZmYytJWmd1ZXlKQmZQRHVFSGQ5NVlpZFlOVVljV3dTV1dT?=
 =?utf-8?B?R01sanVOVmVlR3NaajZoZy9zMzI0b1JHQ3dKOFhESmp2Q2U1aDQ0UnJRVFpn?=
 =?utf-8?B?S3NLdUJ3ZlRHT2V1Q2xaZUFMbFpTZUprM3NiRHk5OXIwbUgwV2pOTnU2M1hw?=
 =?utf-8?B?VUlsckQ3cTRRUTlRMEo3UnJ3UWN0ODV4dzBDRWxocFdSQ01mcnR6amtuaWQy?=
 =?utf-8?B?WCtCaUVoQitqUmZlejZGSUtXaWRZNml6VVpNVjRvb3NWT20vdDJrV0YrRndZ?=
 =?utf-8?B?VE5iQUVDMy9hOHNHanNFb2ovdVM3TzFYL1hSSS9XcitOWHZvN3k1bEdhTysr?=
 =?utf-8?B?QUh6YWEyRnZud2dlTDA4dEVYcjJyVkJsSTVodWhCeVNBMzdESHFHc0ErUlE2?=
 =?utf-8?B?U1BoeG1vTS9yT0ZHd1dJWk5zL0ZNOFpUUm9JWGxxZ25jbjdieVpRQnEyNmFa?=
 =?utf-8?B?YU5PNCt4QVk5ZnNvMjZLLzZ5dmN5VzFNanp5QkIwVWsxTUJWNlowd2Qrb3Y5?=
 =?utf-8?Q?MCw3xtukejIZIdX11YQrq2FHhxBJegoyAJc+YKB9//1/?=
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
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03734962-fecd-4f60-7397-08dd7100cd3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 09:37:21.3514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RBzsWyc/ifJFYDq4i4aNgZ7+/D5hxXZTolu2yKUQubyBEhKaYlNg7QMpdqmMBuvsFyUn8msOhr0NqzPfUmHeKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6182

PiBGcm9tOiBTZXJnaW8gTG9wZXogUGFzY3VhbCA8c2xwQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1
ZXNkYXksIEFwcmlsIDEsIDIwMjUgMzowNCBQTQ0KPiANCj4gUGFyYXYgUGFuZGl0IDxwYXJhdkBu
dmlkaWEuY29tPiB3cml0ZXM6DQo+IA0KPiA+PiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPg0KPiA+PiBTZW50OiBUdWVzZGF5LCBBcHJpbCAxLCAyMDI1IDI6NDUgUE0N
Cj4gPj4NCj4gPj4gT24gTW9uLCBNYXIgMzEsIDIwMjUgYXQgMDk6NDA6MzdBTSAtMDcwMCwgU2Vy
Z2lvIExvcGV6IFBhc2N1YWwgd3JvdGU6DQo+ID4+ID4gIk1pY2hhZWwgUy4gVHNpcmtpbiIgPG1z
dEByZWRoYXQuY29tPiB3cml0ZXM6DQo+ID4+ID4NCj4gPj4gPiA+IE9uIE1vbiwgTWFyIDMxLCAy
MDI1IGF0IDExOjA1OjQ2QU0gLTA0MDAsIFNlcmdpbyBMb3BleiB3cm90ZToNCj4gPj4gPiA+PiBB
ZGQgYSBzdWJzZWN0aW9uIGZvciBwYWdlIGFsaWdubWVudCByZXN0cmljdGlvbnMuDQo+ID4+ID4g
Pj4NCj4gPj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBTZXJnaW8gTG9wZXogPHNscEByZWRoYXQuY29t
Pg0KPiA+PiA+ID4+IC0tLQ0KPiA+PiA+ID4+ICBzaGFyZWQtbWVtLnRleCB8IDYgKysrKysrDQo+
ID4+ID4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPj4gPiA+Pg0KPiA+
PiA+ID4+IGRpZmYgLS1naXQgYS9zaGFyZWQtbWVtLnRleCBiL3NoYXJlZC1tZW0udGV4IGluZGV4
DQo+ID4+ID4gPj4gNmU2ZjZjNC4uMjAyMTA4Mw0KPiA+PiA+ID4+IDEwMDY0NA0KPiA+PiA+ID4+
IC0tLSBhL3NoYXJlZC1tZW0udGV4DQo+ID4+ID4gPj4gKysrIGIvc2hhcmVkLW1lbS50ZXgNCj4g
Pj4gPiA+PiBAQCAtMzQsNiArMzQsMTIgQEAgXHN1YnNlY3Rpb257QWRkcmVzc2luZyB3aXRoaW4N
Cj4gPj4gPiA+PiByZWdpb25zfVxsYWJlbHtzZWM6QmFzaWMgRmFjaWxpdGllcyBvZiBhIFZpcnRp
byBEZSAgVGhlDQo+ID4+ID4gPj4gXGZpZWxke3NobWlkfSBtYXkgYmUgZXhwbGljaXQgb3IgbWF5
IGJlIGluZmVycmVkIGZyb20gdGhlDQo+ID4+ID4gPj4gY29udGV4dCBvZiB0aGUNCj4gPj4gcmVm
ZXJlbmNlLg0KPiA+PiA+ID4+DQo+ID4+ID4gPj4gK1xzdWJzZWN0aW9ue1BhZ2UgYWxpZ25tZW50
IHJlc3RyaWN0aW9uc31cbGFiZWx7c2VjOkJhc2ljDQo+ID4+ID4gPj4gK0ZhY2lsaXRpZXMgb2Yg
YSBWaXJ0aW8gRGV2aWNlIC8gU2hhcmVkIE1lbW9yeSBSZWdpb25zIC8gUGFnZQ0KPiA+PiA+ID4+
ICthbGlnbm1lbnQgcmVzdHJpY3Rpb25zfQ0KPiA+PiA+ID4+ICsNCj4gPj4gPiA+PiArV2hlbiBy
ZXF1ZXN0aW5nIHRoZSBkZXZpY2UgdG8gbWFwIG1lbW9yeSBpbnRvIGEgc2hhcmVkIG1lbW9yeQ0K
PiA+PiA+ID4+ICtyZWdpb24gdGhlIGRyaXZlciBNVVNUIG9idGFpbiB0aGUgcGFnZSBzaXplIGlu
Zm9ybWF0aW9uIGZyb20NCj4gPj4gPiA+PiArdGhlIHRyYW5zcG9ydCBhbmQgaG9ub3IgdGhlIHBh
Z2UgYWxpZ25tZW50IGNvbnN0cmFpbnMgZGVyaXZlZA0KPiA+PiA+ID4+ICtmcm9tIHRoYXQNCj4g
Pj4gcGFnZSBzaXplLg0KPiA+PiA+ID4+ICsNCj4gPj4gPiA+DQo+ID4+ID4gPiB3aWxsIG1ha2Ug
ZXhpc3RpbmcgZHJpdmVycyBhdXRtYXRpY2FsbHkgaW5jb21wbGlhbnQgd2l0aCBuZXcgZGV2aWNl
cy4NCj4gPj4gPiA+DQo+ID4+ID4gPiB3ZSBnZW5lcmFsbHkgYXZvaWQgdGhpbmdzIGxpa2UgdGhp
cy4NCj4gPj4gPg0KPiA+PiA+IFRoaXMgaXMgdGhlIHJlYXNvbiB3aHkgaW4gdjEgdGhpcyB3YXMg
Z2F0ZWQgYmVoaW5kDQo+ID4+ID4gVklSVElPX0ZfU0hNX1BBR0VfU0laRS4gQnV0IGZyb20gdGhl
IGRpc2N1c3Npb24gb24gdGhhdCB0aHJlYWQsIEkNCj4gPj4gPiB1bmRlcnN0b29kIHRoYXQsIGF0
IGxlYXN0IGZvciB0aGUgUENJIHRyYW5zcG9ydCwgaXQgd2FzIHByZWZlcnJlZA0KPiA+PiA+IHRv
IGhhdmUgdGhlIHBhZ2Vfc2hpZnQgZmllbGQgdW5jb25kaXRpb25hbGx5Og0KPiA+PiA+DQo+ID4+
ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdmlydGlvLQ0KPiA+PiBjb21tZW50L0NZOFBSMTJN
QjcxOTUwMzE0QzU2ODNFQjdDRkYwODENCj4gPj4gPiA1QkRDQ0EyQENZOFBSMTJNQjcxOTUubmFt
cHJkMTIucHJvZC5vdXRsb29rLmNvbS8NCj4gPj4gPg0KPiA+PiA+IERpZCBJIG1pc3VuZGVyc3Rh
bmQgdGhlIGNvbmNsdXNpb25zPw0KPiA+PiA+DQo+ID4+ID4gU2VyZ2lvLg0KPiA+Pg0KPiA+PiBJ
IHRoaW5rIFBhcmF2IG1pc3NlZCB0aGlzIGNvbXBhdGliaWxpdHkgaW1wbGljYXRpb24gd2hlbiBo
ZSBzYWlkOg0KPiA+Pg0KPiA+PiAJU28gdG8gb2J0YWluIGEgZnJlZSBpbmZvcm1hdGlvbiwgZmVh
dHVyZSBiaXQgaXMgbm90IG5lY2Vzc2FyeSwgdGhpcw0KPiA+PiBjYW4gYmUgc2VsZi0NCj4gPj4g
CWRlc2NyaWJlZCBpbiB0aGUgcGNpIGNhcGFiaWxpdHkgaXRzZWxmLg0KPiA+Pg0KPiA+PiBQYXJh
diwgdGhpcyBpcyBhYm91dCB0aGUgTVVTVCByZXF1aXJlbWVudCByZWZlcnJpbmcgdG8gaG9ub3Jp
bmcNCj4gPj4gYWxpZ25tZW50LCBub3QgYWJvdXQgb2J0YWluaW5nIHRoZSBpbmZvcm1hdGlvbiB3
aGljaCBpbmRlZWQgY2FuIGJlIGRvbmUNCj4gd2l0aG91dC4NCj4gPj4NCj4gPiBJdCBjYW4ndCBi
ZSBNVVNUIHJlcXVpcmVtZW50IGFzIGl0IGJyZWFrcyB0aGUgZHJpdmVyIHdoaWNoIHdpbGwgbm90
IG5lZ290aWF0ZQ0KPiB0aGlzIGZlYXR1cmUgYml0Lg0KPiA+IFNvIG15IHVuZGVyc3RhbmRpbmcg
aXMsIHRoZSBkZXZpY2UgaW5kaWNhdGVzIG9uZSBvciBtdWx0aXBsZSBhbGlnbm1lbnRzIGl0DQo+
IHN1cHBvcnRzIGFuZCBkcml2ZXIgY2FuIGNob29zZSB3aGljaCBhbGlnbm1lbnQgaXQgd2FudHMg
dG8gdXNlIHRvIGdldCBiZXR0ZXINCj4gcGVyZm9ybWFuY2UuDQo+IA0KPiBOb3QgZXhhY3RseS4g
VGhlIGRldmljZSBpbmRpY2F0ZXMgaXRzIHN1cHBvcnRlZCBwYWdlIHNpemUgKGp1c3Qgb25lKSwg
d2hpY2gNCj4gaW1wbGllcyB0aGUgZHJpdmVyIG5lZWRzIHRvIGhvbm9yIHRoZSBhbGlnbm1lbnQg
cmVzdHJpY3Rpb25zIGRlcml2ZWQgZnJvbSB0aGF0DQo+IHBhZ2Ugc2l6ZS4NCj4gDQpBIGRldmlj
ZSBtYXkgbm90IGtub3cgb24gd2hpY2ggT1MgZmxhdm9yIG9yIHdoaWNoIGNwdSBmbGF2b3IgaXQg
bWF5IHJ1bi4NClNvIGl0IGlzIGJldHRlciBmb3IgdGhlIGRldmljZSB0byBleHBvc2UgbXVsdGlw
bGUgc3VwcG9ydGVkIHBhZ2Ugc2l6ZXMgYWxpZ25tZW50IGFuZCBkcml2ZXIgY2FuIGNob29zZSBv
bmUgY29uZmlndXJlZCBvbiB0aGUgZHJpdmVyIHNpZGUuDQpLZWVwIGluIG1pbmQgdGhhdCBvZnRl
biBkZXZpY2UgIT0gaG9zdCAoZGV2aWNlIGNhbiBiZSBhY3R1YWwgZGV2aWNlIHRvbykuDQoNCldo
ZW4gdGhlIGRyaXZlciBwYWdlIHNpemUgaXMgYmlnZ2VyLCBpdCBjYW4gYWx3YXlzIGFsaWduIHRv
IHRoZSBzbWFsbGVyIHBhZ2Ugc2l6ZSB0b2xkIGJ5IHRoZSBkZXZpY2UsIG5vPw0KDQo+IEp1c3Qg
dG8gY2xhcmlmeSwgdGhpcyBpcyBub3QgYSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudC4gVG9kYXks
IHRoZXJlIGFyZQ0KPiBkZXZpY2VzIChpLmUuIHZpcnRpby1ncHUpIHRoYXQgZG9lc24ndCB3b3Jr
IHdoZW4gdGhlIGhvc3QgKGRldmljZSkgaXMgcnVubmluZw0KPiB3aXRoIG9uIGEgc3lzdGVtIHdp
dGggYSBiaWdnZXIgcGFnZSBzaXplIHRoYW4gdGhlIGd1ZXN0IChkcml2ZXIpLg0KPiANCj4gVGhh
bmtzLA0KPiBTZXJnaW8uDQoNCg==
