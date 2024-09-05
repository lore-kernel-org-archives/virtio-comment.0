Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477E91925BB
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725520869; cv=fail; b=ThKguYjqAAdmUA8vQZ1JT3qGnDBIU3syay4YQiWSAdhGdQ5XdRgT4/4+tMSlojLXB5Y3Xix0yTZcYiJ664pFsCk+Qq4hMbWtN9EUzEHsg0sBXPkuYPCOMdxJgJ/AX13U5mNjUJIMvHjzexar1+lPO05vfUexW95ICRL3sh2Tby0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725520869; c=relaxed/simple;
	bh=/bbjKp3bLiPVZm1oPTk2K5C6QNbQorwduUajCnxYLyg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m0OKBlpu21lephEf0Tt9iNALMGnPD5Zuce2f/lxlhBFDzpOP8VfBSlaBClHpMom+jEiRWjkpo2Nl+vAmLHkagkoCqR6yCpgKR+RQzBDuAcmzkGfKfFArbeCLB876ynKUSsk5hq+7oe1/mIER3tkdDlyU81fkT4xCDwWZDlds37w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kc+gwmhN; arc=fail smtp.client-ip=40.107.93.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kc+gwmhN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeRynzedlyuM9PJgSXsPsyP2tkitPXin+yaPcNKZu5wY+bwEy1RUAkAQpNMv5j8TUuWi0l7ICPMdgHasfqpfwXajNTf3YfgkCRGXhhjIrdLIQwhJvG+nt17sk8PPd5Phb9K8ZWfuvah8bVnMEp24dR63F3FyVCI8/z2jQeMQLvjbFuodTs+rqkBdqEUwLg5bz8wwqZlkR2lsu+BAXEwV+FJcD+5hzwLDPlT/Cz3KJGhZgIL9wJzhQ3/Z7JRhEclbuBNEAMIiEE7/o2Ct2EdGdwyL/pZ6knGqsfH9KwOUeYg5XjfKaxP/HDSBAUA65p89/YXMdHDl4u/8Gz8bvTfrSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCS1FlNRrD6ibNNPBs4WKTmVElIZJ4n7zoQcLfBry1I=;
 b=tDVbSXMSIW6WxUrEvx21+adP6uCXNCRRSxQxGTlWS2GWo2pE3ziu8PuPgaYQ74bSOaxrpxvDCxg0HZ+T49y9eu3HiCfZ/6DRN0YAKhgXwju2iFHQfq14v5BS9jfiZb/Ez+4pFrN9QLwP0TzhNM+ABzuKFLoC4/XtiyEaslfDi+xcjXV+vFgH6Y5aDHjP0ymfBMKdn1k8DavvXy6GJ2+ULadzRThf3rfQA1TncOnn6FrhIP4kkvia67iqywNrfHAIkBE+CVInr5eKDqhZF7MMoiTmNFKyxNi0VimAA75dwlMOODBW94fJTTwmXBYpohe7PyB+BK33sphJVtHv/wZPnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCS1FlNRrD6ibNNPBs4WKTmVElIZJ4n7zoQcLfBry1I=;
 b=kc+gwmhN4YQq9bGmdUekbOxylfqX46cfI4HRyxfTXkfOCY3ZGLIdbkvd9Jczfujjv+sW2n4NAhyejjrrG8It281r1S6oEiXmYJeqfcep1Pb6aU9RasvIcN5JGAZEkYSCASTra8oQX+GDcFIikjf31xRMTL4N5o4/nwt8JrzLsvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Thu, 5 Sep
 2024 07:21:04 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 07:21:04 +0000
Message-ID: <de10e802-c0d7-4cf6-b1f8-3624b47e191c@amd.com>
Date: Thu, 5 Sep 2024 15:20:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
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
 <IA0PR12MB8713A9B32BED215EE545C7A5DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <IA0PR12MB8713A9B32BED215EE545C7A5DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0093.apcprd02.prod.outlook.com
 (2603:1096:4:90::33) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|PH0PR12MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aee8b95-93d9-461e-4ff3-08dccd7b4d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFJ5N2d1YVhqRUIySStDU2RRNFU5U283RGxJY2ozK3BYZUo3SElxZ2JYUkox?=
 =?utf-8?B?WFVIcnNHbGxKYytPUXoxMWpSN1ZpOXEwdnR1TVRSMC8rQVlBYVA4VkEvK3hr?=
 =?utf-8?B?RkpEdjNhYVIwa0hYUHptQ0RZVFJCQ1JPTW12ZE40bDFSYWJDei9malI1S1pm?=
 =?utf-8?B?dEY5dGozbTNKZHJ2MzNmSldPRVgrQk1tOW9qUDhSV3NLTk5UYkRaeEV0OS9P?=
 =?utf-8?B?NlJna2pqdStUbmdDeWJwL0ErZ0I4L1phbjhLZGNVQUZmMyt6cmJmRUVJdm5X?=
 =?utf-8?B?aXVnYWdVaGFXdzA3Yjl1T0xHZitFSE80bXI4YWNQSDNZbzVmL05YeWRscVFG?=
 =?utf-8?B?NEdrM1YzVVdGSTZ5NXNLbVBRTFVsWWk4NWdhNGtaUmw1UzhENmFGQXV4cm1F?=
 =?utf-8?B?MW82WnlpbjhQcTMyUzkvSmFNNUJQWlU5SUJITVcweEFnOW1iVVlQVERCL0ZR?=
 =?utf-8?B?KzlmbWFSMUFZYWwzQndHZGh4NHlrVjFweTArNTlBUjJPRVJmQmVQbUt6SCtV?=
 =?utf-8?B?WmtXVGViSWZ4VXNRcFFrNWowUVVjd2xKM2hDa0lXbHVtMnh4UUdQbXAzalZN?=
 =?utf-8?B?V00xdUJLRy9GYzZBNzdQUm5UUlkvUzR2ZnBpay84M2pUQmFFRXg3QjBLR1Ra?=
 =?utf-8?B?bFhNak4ySG83dUZJZGlXcytwcHhyODQ0OHJWWm5reXdXNHFaWnplY29FRG55?=
 =?utf-8?B?aER4V3dCTUl2dVgra2NxNmRBeStFd2Mvci95d0laL2g1SWRYOUk1TTFhdUdi?=
 =?utf-8?B?eUF5Rm56UytWVmk3QzBocmNLa2REc2xWcnpCU2lRbUZVTXVvVFlVVmZ6WnN6?=
 =?utf-8?B?WXNCTWN0RndzRXB4SnFCTWMxa0RaLy9pR1Fvb2NkdlFIMWFQVENEQWxBOWRO?=
 =?utf-8?B?MForTkJZcU9ET0luUzVhdWM2c250WUU2TndmaFBKd0l5ZWoybFdheFYwVGsx?=
 =?utf-8?B?d1VlaktHUmo1UDB6Vi9FdXN6Vm5rWldCaGVaaHNaaXc1dGdBbDJDS0tKRFBS?=
 =?utf-8?B?MVU5WlV5TFZ2SFByQndEQUdwcDhCL3FkQnUwUmdtVFVwQmtPUC8xYlR5YVg4?=
 =?utf-8?B?SVhLa0llWWF4eUR0bXVIZWU3MlpNL3JvN3ZIalpKQVVMNzA4S0F4eWYyUndY?=
 =?utf-8?B?Sk5QTnpXdUJHMGJrUkFzcHBBUXFhMzd1NzVZNGgyTFAvUE5iZ2NMQ1JjMS8w?=
 =?utf-8?B?Zkw3cEtoc0FZNWxwaWtIWS9OMUZQUlRYdU9SK3VGK2s2c0ljbkllMVFFcmRC?=
 =?utf-8?B?aGU1YlIzZTR3eHloTkI3dkI1VlpSMUhwZTNLMlRWTFg3cUlqOGtwVFovQVhS?=
 =?utf-8?B?UFBYekdjdWc5OTlmUjRyUi9QcEVYYXpJZ0dac0ZjV21Qazd1b3UvLzNUZzh0?=
 =?utf-8?B?OWNTbm9hK1A4NVl3Q2xkOGVCalFzNGl5TnFieHhWVVFiTzdjTW1jMTFtTGZM?=
 =?utf-8?B?R1p2bzV2SWx3SG5HQ3A1SVdDL0NDeUZwK2lpUTgzNkRua21CVHNnekMzZ1pY?=
 =?utf-8?B?V0wvM0NKcnBTQlI4VStJYzBEcmxnMCtLZ2JibmVjblpWbGFDSGFFZm84ejhk?=
 =?utf-8?B?TzR0UmZpY1RyY0NNZERBenRqV1J2V1lsOXhUak5PQmlqMTN1QndLN2xKR215?=
 =?utf-8?B?aEU5ZjdDRXNsWW1YWEJNa2Z6R244bkJJVFF6NE0zYWY5c0laN3hSSTlmbUxX?=
 =?utf-8?B?b1VwZjBPUlNlU2F2RS84ZkkzMHowKzRSaHBBcEd4Vnd4di9iNHl6Q0N3OUsv?=
 =?utf-8?B?RCtzNy96TzdacDVveEdSWlBTZ1hLK3F3WTFTTm5TQ29JY0E2YVVZbG9GS1Vq?=
 =?utf-8?B?d0pyWjB1N2FPNUpUU0x1dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFRESzhjS1c0aUdXc1hTUnRLeHVLZTlkd2pqU3JudFRFaGJrczl2UTJkNmNX?=
 =?utf-8?B?UFZNSE1MajBrdllYOHJBWldWSW81clhXcmEvOHMydFlSTCtOSWJyTzFRMDk1?=
 =?utf-8?B?S1p6eEozWmNEbHQvaWdRMlpQK0JtN2RzODJoRmtUU2t0RXVQdXdkUXFxYUVt?=
 =?utf-8?B?YUpnUGpKZ1I5T2huMlNjRHdLM0RwRElxa3J6U2FZWTUzWFozTytqZXRKSy9v?=
 =?utf-8?B?ZkFKZCtQZ0hiZ0V3OXBwR08xUDFMTWMwejBXQm8xSFhZdzExZit2akI3NmZl?=
 =?utf-8?B?RkdTazJWZUVXdlE1djIyVDdBVExFNnUrcDIwWmtpUHc2MWkzUHVCREFkUGdD?=
 =?utf-8?B?Uit5Rm5vRG1GN20vVzM5YnpScHNZRVl1SlJkMm1TVmhsRUdXM29iN2IwNUo1?=
 =?utf-8?B?Q2pheG1vanNlN1pXanRQUThCdzVaa1FSQlRjbUJwRCtXZS8rbzJpaGdGYlB3?=
 =?utf-8?B?TjNWTWFvc3ZLUGgxcytyOE5EOTBJSW81Z2o2MUFCZ0ZZRXZ0bDFROW80dWlS?=
 =?utf-8?B?R3lVV0pJTTlDRTl1alo2QWJ0SHVNNk9aMXFKMlBKdVY5NUNFaEdUY0hONmhG?=
 =?utf-8?B?cEJ1eDlYVVdBL1hZSlIzbHk2MklIYVM2T0JSd1NPU0VURll1NEVjNWl5K0ZB?=
 =?utf-8?B?bEEvZ0h4TnZPN1BPbHJDWnU1R2QxdHRFd1dSYzZTblNWZ1R4K1loZzdVQ0do?=
 =?utf-8?B?TDN6L1JIZnhOTVpCdmNpNWVwb3dqU0lGNGhIdDlHNkN4MkRocTdTODh4Yk9m?=
 =?utf-8?B?Nk9SalZhK3lXV1BMWnBoT2RvS01xRlNZWFp5ZDd1MkpzNUVIZ0g1cXZjOHUr?=
 =?utf-8?B?ZGFrcGI4Y0FyRGh1cDl0M0ErNlBDeFdtdE1ULzgzdXFCL0trNmtyMzNFekJI?=
 =?utf-8?B?ei9ENUtYQXdvMWorS3JzdlFTcDhLc3B5NU56enhNNC8vUU5BeXozZ0ljcDJR?=
 =?utf-8?B?YVgyVXJ0aE84WDRVV3JKKzFwNlUxc3FjTmN2cVhkak1WMXlYTjB2YXBsUnVi?=
 =?utf-8?B?R05qbFdtZ3duV2w3Z3dhcldqSEhHbE5GUERBMmlXeC94aEZ1VC8wMmtFRkx0?=
 =?utf-8?B?VDZEaTBNK01QREhtcitOWE9KQjh5R3NuOStkWTFsRksrNHp2cTlCWjFONCt3?=
 =?utf-8?B?Y0pzWDBFUlp4UnBsYXdWcElYT1pCeFVFQlpMWXhNWHFES0lLUVkycTBlNU5I?=
 =?utf-8?B?RTdiQVFqcUtaRkNldEFMOS9rRjBMeUdFMEJGRGxFTU1UYUxhOWdmamZJVkR0?=
 =?utf-8?B?amcrWnhtZ21IV2RERk44c1hMdCtpS3VSd1JnTnFRM1YxaDAvWXVHZzVKdGkw?=
 =?utf-8?B?ZzBIc1BUNmMzdlJxbFhodEp0ZUdyeU41TnpONEg4blRBRjNSenZNVFBZOHdY?=
 =?utf-8?B?QlZ2RDF6TUlLM04vQW1hRDVQdDRTcVoyR2lUaXYvRWd3U3JucDNpTVFIMVJC?=
 =?utf-8?B?OElmMytpZE56Mmpja0ZCWi9pYVlaTCt5K0ZDbkhxUXN1ZVBaUVhxZVNZV242?=
 =?utf-8?B?R3dSdFZlVExwMnh1Vi9ES2RKYmdUYVh4dDdIcWJpWittUXZyMzRZSTB3Q0RD?=
 =?utf-8?B?ei9OL1ZiN25Xemlnd28vS0RjVzFEZ1FXMWdYVWlqNzV0UC81SndNU3pYTytl?=
 =?utf-8?B?bTI2TVFFNkpXeXAvdURIL29tdXU0MzZXd3orc0p2Qm8yRFJwZlF2bHY2Yjkz?=
 =?utf-8?B?cTRqWlFCL2ZjMXduRlVzdHZGczh4dEs1bi9EZVVrejFUQ05OVDIxVWgzRGQ5?=
 =?utf-8?B?VW12RGhhK3prR3hRWkJka0JGZzUySi9WZlBaVHNGL3BJSEVROXI4eWdsaTA0?=
 =?utf-8?B?YitpY0x5b2ljQ2ROVEhwakFiOUxHQ1JnVXJMb1BkSFlaVDJrbWpzcGVydEsv?=
 =?utf-8?B?djZkeFNUbmttb1haWitHRkpYWUFMNEFBL1plcy8zOU1DTWREdHVHSWFCdmgx?=
 =?utf-8?B?cDZTM21SN2VQQThyaVlUOEp3Y2szT0cxb1RFSlpIaE92VWNmdU9GR3VRdUJx?=
 =?utf-8?B?Q0M2WmI5U1lZYzU5NXF3Nm5GUzhsVXExa1J0SW9UTFBPUXVMakJ0L09pdGR3?=
 =?utf-8?B?NUU4VUE2TWVEZkJ0NTRMMnU1aEV6Uk54VjFDVEpjZ29ZTjh0UXk4bVo4dlQv?=
 =?utf-8?Q?6HEPCfQWIPkYbsIitR8OzGpO8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aee8b95-93d9-461e-4ff3-08dccd7b4d5d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 07:21:04.5177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djRXsDxwlV14WRXlV0lkjFD29ahg6iGLeu4S+KuFIkQTwl4lEFaTQj41lbRtYcAFGZzIjLI7O/syQxeRXAR6pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861



On 9/3/2024 6:28 PM, Parav Pandit wrote:
>
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Tuesday, September 3, 2024 2:36 PM
>>
>> On 8/30/2024 11:02 AM, Parav Pandit wrote:
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Friday, August 30, 2024 8:02 AM
>>>>
>>>> On 8/15/2024 5:34 PM, Parav Pandit wrote:
>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>> Sent: Thursday, August 15, 2024 1:53 PM
>>>>>>
>>>>>> On 8/13/2024 2:55 PM, Parav Pandit wrote:
>>>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>> Sent: Tuesday, August 13, 2024 11:44 AM
>>>>>>>>
>>>>>>> I removed the unreachable intel email id as every single email is
>>>>>>> bouncing
>>>>>> from it.
>>>>>>> Please consider dropping that email from v8 as it will cause all
>>>>>>> reviewers
>>>>>> email to bounce.
>>>>>>>> On 8/13/2024 1:50 PM, Parav Pandit wrote:
>>>>>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>>>> Sent: Tuesday, August 13, 2024 11:15 AM
>>>>>>>>>>
>>>>>>>>>> On 8/13/2024 12:42 PM, Parav Pandit wrote:
>>>>>>>>>>> Hi Lingshan, David,
>>>>>>>>>>>
>>>>>>>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>>>>>> Sent: Thursday, August 1, 2024 5:05 PM
>>>>>>>>>>>>
>>>>>>>>>>>> This commit allows the driver to suspend the device by
>>>>>>>>>>>> introducing a new status bit SUSPEND in device_status.
>>>>>>>>>>>>
>>>>>>>>>>>> This commit also introduce a new feature bit
>> VIRTIO_F_SUSPEND
>>>>>>>>>>>> which indicating whether the device support SUSPEND.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>>>>>>>>>>> ---
>>>>>>>>>>>>  content.tex | 75
>>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++++-
>>>>>>>>>> ----
>>>>>>>>>>>> --
>>>>>>>>>>>>  1 file changed, 65 insertions(+), 10 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> Changes from V6:
>>>>>>>>>>>> - the device should hold its config interrupt while SUSPEND,
>>>>>>>>>>>> and send config interrupt when the SUSPEND bit is cleared.
>>>>>>>>>>>> - while SUSPEND, the driver MUST NOT access Device
>>>>>>>>>>>> Configuration Space
>>>>>>>>>>>> - minor changes.
>>>>>>>>>>>>
>>>>>>>>>>>> Changes from V5:
>>>>>>>>>>>> - the device should present NEEDS_RESET if failed to suspend
>>>>>>>>>>>> - allow the driver access device status in the config space when
>>>>>>>>>>>>   suspended if it is implemented in config space.
>>>>>>>>>>>> - language improvements
>>>>>>>>>>>>
>>>>>>>>>>>> Changes from V4:
>>>>>>>>>>>> - re-order the device status bits section
>>>>>>>>>>>> - kick vqs --> notify vqs
>>>>>>>>>>>>
>>>>>>>>>>>> Changes from V3:
>>>>>>>>>>>> - allow the driver clearing the SUSPEND bit to resume the
>> device.
>>>>>>>>>>>> - disallow access to config space while suspended.
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/content.tex b/content.tex index 0a62dce..2d1bee8
>>>>>>>>>>>> 100644
>>>>>>>>>>>> --- a/content.tex
>>>>>>>>>>>> +++ b/content.tex
>>>>>>>>>>>> @@ -36,19 +36,22 @@ \section{\field{Device Status}
>>>>>>>>>>>> Field}\label{sec:Basic Facilities of a Virtio Dev
>>>>>>>>>>>>      this bit.  For example, under Linux, drivers can be
>>>>>>>>>>>> loadable
>>>> modules.
>>>>>>>>>>>>    \end{note}
>>>>>>>>>>>>
>>>>>>>>>>>> -\item[FAILED (128)] Indicates that something went wrong in
>>>>>>>>>>>> the guest,
>>>>>>>>>>>> -  and it has given up on the device. This could be an
>>>>>>>>>>>> internal
>>>>>>>>>>>> -  error, or the driver didn't like the device for some
>>>>>>>>>>>> reason, or
>>>>>>>>>>>> -  even a fatal error during device operation.
>>>>>>>>>>>> +\item[DRIVER_OK (4)] Indicates that the driver is set up and
>>>>>>>>>>>> +ready to
>>>>>>>>>>>> +  drive the device.
>>>>>>>>>>>>
>>>>>>>>>>>>  \item[FEATURES_OK (8)] Indicates that the driver has
>>>>>>>>>>>> acknowledged all
>>>>>>>>>> the
>>>>>>>>>>>>    features it understands, and feature negotiation is complete.
>>>>>>>>>>>>
>>>>>>>>>>>> -\item[DRIVER_OK (4)] Indicates that the driver is set up and
>>>>>>>>>>>> ready to
>>>>>>>>>>>> -  drive the device.
>>>>>>>>>>>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated,
>>>>>>>> indicates
>>>>>>>>>>>> +that the
>>>>>>>>>>>> +  device has been suspended by the driver.
>>>>>>>>>>>>
>>>>>>>>>>>>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has
>>>>>>>>>> experienced
>>>>>>>>>>>>    an error from which it can't recover.
>>>>>>>>>>>> +
>>>>>>>>>>>> +\item[FAILED (128)] Indicates that something went wrong in
>>>>>>>>>>>> +the guest,
>>>>>>>>>>>> +  and it has given up on the device. This could be an
>>>>>>>>>>>> +internal
>>>>>>>>>>>> +  error, or the driver didn't like the device for some
>>>>>>>>>>>> +reason, or
>>>>>>>>>>>> +  even a fatal error during device operation.
>>>>>>>>>>>>  \end{description}
>>>>>>>>>>>>
>>>>>>>>>>>>  The \field{device status} field starts out as 0, and is
>>>>>>>>>>>> reinitialized to 0 by @@ -
>>>>>>>>>>>> 60,8 +63,9 @@ \section{\field{Device Status}
>>>>>>>>>>>> Field}\label{sec:Basic Facilities of a Virtio Dev
>>>>>>>>>>>> initialization sequence specified in \ref{sec:General
>>>>>>>>>>>> Initialization And Device Operation / Device
>>>>>>>>>> Initialization}.
>>>>>>>>>>>> -The driver MUST NOT clear a
>>>>>>>>>>>> -\field{device status} bit.  If the driver sets the FAILED
>>>>>>>>>>>> bit,
>>>>>>>>>>>> +The driver MUST NOT clear a \field{device status} bit other
>>>>>>>>>>>> +than SUSPEND except when setting \field{device status} to 0
>>>>>>>>>>>> +as a transport-specific way to initiate a reset. If the
>>>>>>>>>>>> +driver sets the FAILED bit,
>>>>>>>>>>>>  the driver MUST later reset the device before attempting to
>>>>>>>>>>>> re-
>>>>>>>> initialize.
>>>>>>>>>>>>  The driver SHOULD NOT rely on completion of operations of a
>>>> @@
>>>>>>>>>>>> -99,10
>>>>>>>>>>>> +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities
>>>>>>>>>>>> +of a Virtio Device
>>>>>>>>>>>> / Feature B  \begin{description}
>>>>>>>>>>>>  \item[0 to 23, and 50 to 127] Feature bits for the specific
>>>>>>>>>>>> device type
>>>>>>>>>>>>
>>>>>>>>>>>> -\item[24 to 41] Feature bits reserved for extensions to the
>>>>>>>>>>>> queue and
>>>>>>>>>>>> +\item[24 to 42] Feature bits reserved for extensions to the
>>>>>>>>>>>> +queue and
>>>>>>>>>>>>    feature negotiation mechanisms
>>>>>>>>>>>>
>>>>>>>>>>>> -\item[42 to 49, and 128 and above] Feature bits reserved for
>>>>>>>>>>>> future extensions.
>>>>>>>>>>>> +\item[43 to 49, and 128 and above] Feature bits reserved for
>>>>>>>>>>>> +future
>>>>>>>>>>>> extensions.
>>>>>>>>>>>>  \end{description}
>>>>>>>>>>>>
>>>>>>>>>>>>  \begin{note}
>>>>>>>>>>>> @@ -629,6 +633,53 @@ \section{Device
>>>> Cleanup}\label{sec:General
>>>>>>>>>>>> Initialization And Device Operation /
>>>>>>>>>>>>
>>>>>>>>>>>>  Thus a driver MUST ensure a virtqueue isn't live (by device
>>>>>>>>>>>> reset) before removing exposed buffers.
>>>>>>>>>>>>
>>>>>>>>>>>> +\section{Device Suspend}\label{sec:General Initialization
>>>>>>>>>>>> +And Device Operation / Device Suspend}
>>>>>>>>>>>> +
>>>>>>>>>>>> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
>>>>>>>>>>>> +SUSPEND bit in \field{device status} to suspend a device,
>>>>>>>>>>>> +and can clear the SUSPEND bit to resume a suspended device.
>>>>>>>>>>>> +
>>>>>>>>>>>> +\drivernormative{\subsection}{Device Suspend}{General
>>>>>>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>>>>>>> +
>>>>>>>>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set
>> or
>>>>>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>>>>>>> +
>>>>>>>>>>>> +Once the driver sets SUSPEND to \field{device status} of the
>>>> device:
>>>>>>>>>>>> +\begin{itemize}
>>>>>>>>>>>> +\item The driver MUST re-read \field{device status} to
>>>>>>>>>>>> +verify whether the
>>>>>>>>>>>> SUSPEND bit is set.
>>>>>>>>>>>> +\item The driver MUST NOT make any more buffers available to
>>>>>>>>>>>> +the
>>>>>>>>>> device.
>>>>>>>>>>>> +\item The driver MUST NOT access any virtqueues or send
>>>>>>>>>>>> +notifications for
>>>>>>>>>>>> any virtqueues.
>>>>>>>>>>>> +\item The driver MUST NOT access Device Configuration Space.
>>>>>>>>>>>> +\end{itemize}
>>>>>>>>>>>> +
>>>>>>>>>> Hi Parva
>>>>>>>>>>> Do we agree that
>>>>>>>>>>> a. suspending a device is non frequent operation (in order of
>>>>>>>>>>> N
>>>>>>>>>> operations/sec, where N is roughly in range of 10 or 100) per
>> device?
>>>>>>>>>> Ideally it should not be often in normal operations, but
>>>>>>>>>> remember we can not restrict the behaviors of the driver, so we
>>>>>>>>>> must be able to handle the scenario in which SUSPENDING is
>> often.
>>>>>>>>> Sure. the intent is slow rate, but one can do at unexpected times.
>>>>>>>>> Do you agree?
>>>>>>>> I think we don't have an intention of the frequency in the spec.
>>>>>>> Sure.
>>>>>>>
>>>>>>>> The spec only provides generic mechanisms and interfaces.
>>>>>>> Sure.
>>>>>>>
>>>>>>>> Don't assume it(or driver wants it to be) would be often or not,
>>>>>>>> that depends on the driver.
>>>>>>> As you rightly said : it cannot be assumed.
>>>>>>> The driver will read the device status right after it wrote it.
>>>>>>> This typically is <
>>>>>> 50nsec of time.
>>>>>>> The suspend operation for a net device to store hundreds of
>>>>>>> queues, RSS
>>>>>> table, flow filters, takes plenty of time (at least more than 50nsec :) ).
>>>>>>> Similarly for the GPU to store some MBs of memory takes more than
>>>>>>> 50nsec
>>>>>> of time, for example to store in a file for a software-based GPU device.
>>>>>>> So a device cannot respond back suspend=true in next 50nsec time.
>>>>>> It's OK for the device to take longer time to respond, the driver
>>>>>> simply re-reads device status.
>>>>> Sure, the issue is, when the driver re-reads, the device must
>>>>> present
>>>> suspend=false within 50nsec.
>>>>> (because device didn't suspend it yet).
>>>>>
>>>>> As I explained in previous email, this requires building special circuitry.
>>>>> Such circuitry can be avoided if the suspend interface is done
>>>>> slightly
>>>> differently.
>>>> why there is a constraint condition of the time?
>>> Because this is what driver does as you explained in [1] indicating "we must
>> be able to handle ..."
>>> [1]
>>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
>>> .kernel.org%2Fvirtio-comment%2Fc4d5eed3-774b-4d35-a007-
>> f9dff28ce884%40
>> amd.com%2FT%2F%23m6f081f96ef9dcea29c64a88b633eb21d50e8c410&dat
>> a=05%7C0
>> 2%7Cparav%40nvidia.com%7C4a248d6982514660015808dccbf79c55%7C430
>> 83d1572
>> 7340c1b7db39efd9ccc17a%7C0%7C0%7C638609511605195425%7CUnknown
>> %7CTWFpbG
>> Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
>> Mn0%
>> 3D%7C0%7C%7C%7C&sdata=Gj4oG8Z1O7wEl%2B7Mbud%2BbP31aMDMAFA
>> H9ElHJSvBTUA%
>>> 3D&reserved=0
>> The sentence is "we must be able to handle the scenario in which
>> SUSPENDING is often", where do you see any constraint conditions of time?
> If the device takes X usec, how can the device inform that, it suspending in progress without flipping the polarity?
Oh, I see your puzzle. The device does not inform that. It is VM_EXIT and VM_ENTRY, once VM_ENTRY, the guest vcpu aka the driver resume running
>
>>>> Are there any similar
>>>> constraining for other states like RESET or DRIVER_OK? Don't assume
>>>> any other states transitions are faster than SUSPEND.
>>> DRIVER_OK does not suffer from it because it is async notification.
>>> A device may start slow after DRIVER_OK.
>>> SUSPEND operation cannot rely on such async behavior.
>> The driver can set suspend and re-read & wait. This is a common routine in
>> the driver.
>>> RESET also suffers from similar inefficiencies.
>>> But that is because it is inherited from the past.
>>>
>>> Here a new functionality is being proposed and it has a chance for efficient
>> device implementation.
>>> Therefore the request is to improve it.
>> sure, as long as we confirm this new register apply for all device status
>> transitions, not only for SUSPEND.
> Alright, please do it as you suggested here.
>
>>>>>>> More below.
>>>>>>>
>>>>>>>>>>> b. A software-based device may not always want to force
>>>>>>>>>>> VM_EXIT on read
>>>>>>>>>> and write on the device_status register?
>>>>>>>>>> Trap and Emulation is the basic of virtualization, and how to
>>>>>>>>>> pass-through a device is out of this spec.
>>>>>>>>>>
>>>>>>>>> Sure, I didn't suggest to put such things in the spec.
>>>>>>>>> My question is, whether to trap and emulate or not is a choice
>>>>>>>>> of the
>>>>>>>> software.
>>>>>>>>> Do you agree?
>>>>>>>> The device emulator does not know anything about whether trapped
>>>> or
>>>>>> not.
>>>>>>>> Trapping and Emulation is a hypervisor thing.
>>>>>>>>
>>>>>>>> If here "software" refers to the device emulator, then Yes, it is
>>>>>>>> not the emulator's decision. And the device should not be aware
>>>>>>>> of VM_EXIT & VM_ENTRY.
>>>>>>>>
>>>>>>> Right. So a software wants to implement device_status as pure MMIO
>>>>>> writes. (and not VM_EXIT).
>>>>>> This is not always true, there can be VM_EXIT of pure emulated
>>>>>> devices.
>>>>> I am not denying that VM_EXIT can/cannot be there.
>>>>> I am saying, the proposal forces VM_EXIT based approach in my
>>>> understanding of this patch.
>>> [MARKER_1]
>>>
>>>>> If that is not true, may be can you please explain how this can be
>>>> implemented without VM_EXIT?
>>>>> We should have an interface that can be done with and without
>>>>> VM_EXIT
>>>> method at least for any new additions.
>>>> VM_EXIT is out of spec, it is a hypervisor and the processor thing.
>>> You keep repeating VM_EXIST is out of spec.
>>> I already replied at [MARKER_1], sure it is out of spec, the current approach
>> forces one to do VM_EXIT based approach.
>>> And if not, please explain, how can it be achieved?
>> It is not the current solution force the hypervisor & guest to perform
>> VM_EXIT.
> I read it few times but couldn't parse it.
> Can you please explain how your proposal works WITHOUT VM_EXIT?
> If not, you can say, that current proposal is limited to force VM_EXIT.
> Please explain.
It needs VM_EXIT, not only SUSPEND, all sensitive resource, like the config space access
should be trapped.
>
>> In basic virtualization, any access to hypervisor emulated HW registers would
>> be Traped and Emulated, means a VM_EXIT and a VM_ENTRY.
> That was not my question, my question is how to achieve without VM_EXIT?
> You are suggesting a spec that forces VM_EXIT.
It needs VM_EXIT, and there is a pairing VM_ENTRY
>
>>>> In non-pass-through case, any register access are sensitive and will
>>>> trigger VM_EXIT. Like RESET or DRIVER_OK needs to access
>>>> device_status, nothing different.
>>> I don't think you understood the point.
>>> Let me repeat, The question is, if the device implementation wants to
>> achieve the functionality without VM_EXIT, what is the way?
>> Map the register to guest address space, out of the spec.
> And which component will flip the bit of suspend before driver reads it to indicate that device is still_suspending?
>
>>>>>> The
>>>>>> HW registers are sensitive resource and any access to them need to
>>>>>> be trapped and emulated.
>>>>> This does not apply to PCI PFs and VFs which are HW devices (mainly
>> PFs).
>>>>> so this trap + emulation is narrow view that we better avoid.
>>>> This is how *basic* virtualization work, once access sensitive resource,
>> trap it.
>>>>> If you think this is the way forward, you should put forward in
>>>>> patch as
>>>> MUST requirement.
>>>>> and that does not look right to me.
>>>>> I hope you also don't mean to force this method to device
>>>> implementations.
>>>>> Right?
>>>> Again, VM_EXIT is a hypervisor thing,  out of spec. Whether there is
>>>> a VM_EXIT when setting SUSPEND totally depends on the virtualization
>>>> solution. And SUSPEND is nothing different from DRIVER_OK.
>>>>
>>> Please avoid repeating the point that VM_EXIT is hypervosor thing.
>>> No one asked to put this in spec. Please re-read [MARKER1]. You probably
>> missed that.
>>> SUSPEND is different than DRIVER_OK. I explained the timing constraints
>> and the required circuitry needed to fulfill the proposal.
>>> And with the additional register, such complicated circuitry can be easily
>> avoided.
>> Please read QEMU code, that can help you find how the trap - emulate
>> mechanism work for guest when it tries to access sensitive resources.
> I am not suggesting trap and emulation. Please come out of this looping thoughts.
>
> I repeat my question, please explain how does suggested solution works without VM_EXIT?
> From your response, I derive it cannot. Can you please confirm?
>
>>>> Means, if your virtualization needs to trap SUSPEND, it also needs to
>>>> trap DRIVER_OK, and don't assume DRIVER_OK is faster than SUSPEND.
>>> DRIVER_OK is by law of physics is faster than SUSPEND because it does not
>> demand the driver of reading back.
>>> There is no driver side loop to check if the device accepted DRIVER_OK or
>> not.
>>> Agree?
>> Why do you assume so? 
> I am not assuming. It is the current spec. :)
> Please read the device initialization sequence, that does NOT say that driver must READ DRIVER_OK.
> Hence by law of physics it is faster.
>
>> In some vendor implementation, DRIVER_OK can be
>> slow. Can DRIVER_OK implement a deferred initialization even deferred
>> resource allocation? Does the spec say that DRIVER_OK must be faster?
> No. it does not. But your suspend proposal says so that device must respond back before the next read arrives from the driver.
>
>>>>>>> And prefer to returning SUSPEND=true at slow pace.
>>>>>>> This means, the device implementation cannot immediately return
>>>>>> suspend=true right after it was written.
>>>>>>> A MMIO read will read it back, as suspend=true.
>>>>>>>
>>>>>>> An alternative would be, to forward CPU loads and CPU stores to
>>>>>>> different
>>>>>> address.
>>>>>>> However, this does not work for the hw based devices.
>>>>>>>
>>>>>>> That means, PCI HW needs to return suspend=0, until the device is
>>>>>>> not
>>>>>> suspended.
>>>>>>> In this example, the device cannot build special circuitry to
>>>>>>> answer
>>>>>> suspend=true within 50nsec, or in other words building special
>>>>>> circuitry to return suspend=false is too complex for the slow operation.
>>>>>> why? The device can just not to change the value of the SUSPEND bit
>>>>>> before it has fully suspended.
>>>>> When driver wrote, it wrote suspend=true, And device returns
>>>>> suspend=false while suspend is ongoing, right?
>>>>> If yes, this is expensive because the device needs to operate within
>>>>> 50nsec
>>>> or less to answer suspend=false.
>>>>> And even worst, it needs to suspend=true when unsuspending within
>>>> 50nsec when resuming is ongoing.
>>>> again, there is not a 50nsec constraining and please take a reference
>>>> of how DRIVER_OK work with virtualization.
>>> There is. The device is expected to return back the desired value to indicate
>> driver that suspend is ongoing.
>>> It is different than DRIVER_OK.
>> where does the spec or any code say 50nsec?
> Your spec and your previous comment implies that when device is busy suspending, it must returned the toggled value than what driver set it.
> Isn't it? It means device needs to react before the next read arrives from the driver, isn't it?
> I took that read as 50nsec example as you explained previously that driver will read very fast.
>
>>>>>>> If this understanding of burden is clear,
>>>>>>>
>>>>>>> The proposal is, can you please extend the interface such that,
>>>>>>>
>>>>>>> 1. driver writes suspend command.
>>>>>>> 2. driver reads suspend_status, and receives not_completed=(false).
>>>>>>> This is
>>>>>> the default value.
>>>>>>> 3. When the device completes suspend, it changes the polarity of
>>>>>> suspend_status=true.
>>>>>>> This has two main benefits:
>>>>>>> [A] This will enable software-based devices to write data to slow
>>>>>>> files and
>>>>>> does not have to force VM_EXITs.
>>>>>>> [B] It also enables hw based devices to not build special
>>>>>>> circuitry to answer
>>>>>> within 50nsec, which can get very complicated for tens or hundreds
>>>>>> of PCI PFs.
>>>>>> I think we have already discussed on this before in V5, and Jason
>>>>>> has some insightful comments
>>>>>>
>>>>> Unfortunately, not. His comment was that it is not specific to suspend.
>>>>> But here we are introducing a new interface and functionality that
>>>>> does not
>>>> need to suffer or follow anything that may not be efficient.
>>>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flor
>> %2F&data=05%7C02%7Cparav%40nvidia.com%7C4a248d6982514660015808
>> dccbf79
>> c55%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6386095116052
>> 07133%7
>> CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB
>> TiI6Ik
>> 1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=VGOfVe0deSDilzufY7NH
>> gU5RmciNh
>>>> dXMMQiVUSiP%2BKM%3D&reserved=0
>>>>>> e.kernel.org%2Fvirtio-comment%2F20240612082055-mutt-send-email-
>>>> mst%40
>>>>
>> kernel.org%2FT%2F%23mc817fc6ca12ff0bcbae62b43b6146a177ecf13a9&dat
>>>> a=05
>>>>
>> %7C02%7Cparav%40nvidia.com%7C619c82b60b824ca03f8808dcc89beb4a%7
>>>> C43083
>>>>
>> d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638605819247985989%7CUn
>>>> known%7C
>>>>
>> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
>>>> CJXV
>>>>
>> CI6Mn0%3D%7C0%7C%7C%7C&sdata=VqmJmqt3k5tf3x4ihjE5Bd7u59GadOn
>>>> OaOfJ5lvG
>>>>>> 1DE%3D&reserved=0
>>>>>>>> this is out of the spec anyway.
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>> Zhu Lingshan
>>>>>>>>>> Thanks
>>>>>>>>>> Zhu Lingshan
>>>>>>>>>>>> +\devicenormative{\subsection}{Device Suspend}{General
>>>>>>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>>>>>>> +
>>>>>>>>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
>>>>>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>>>>>>> +
>>>>>>>>>>>> +The device MUST ignore all access to its Configuration Space
>>>>>>>>>>>> +while suspended, except for \field{device status} if it is
>>>>>>>>>>>> +part of the Configuration
>>>>>>>>>>>> Space.
>>>>>>>>>>>> +
>>>>>>>>>>>> +A device MUST NOT send any notifications for any virtqeuues,
>>>>>>>>>>>> +access any virtqueues, or modify any fields in its
>>>>>>>>>>>> +Configuration Space while suspended.
>>>>>>>>>>>> +
>>>>>>>>>>>> +If changes occur in the Configuration Space while the
>>>>>>>>>>>> +SUSPEND bit is set, the device MUST NOT send any
>>>>>>>>>>>> +configuration change
>>>>>>>> notifications.
>>>>>>>>>>>> +Instead, the device MUST send the notification after the
>>>>>>>>>>>> +SUSPEND bit has
>>>>>>>>>>>> been cleared.
>>>>>>>>>>>> +
>>>>>>>>>>>> +When the driver sets SUSPEND, the device MUST either
>> suspend
>>>>>>>>>>>> +itself or set
>>>>>>>>>>>> DEVICE_NEEDS_RESET if failed to suspend.
>>>>>>>>>>>> +
>>>>>>>>>>>> +If SUSPEND is set in \field{device status}, when the driver
>>>>>>>>>>>> +clears SUSPEND, the device MUST either resume normal
>>>> operation
>>>>>>>>>>>> +or set
>>>>>>>>>>>> DEVICE_NEEDS_RESET.
>>>>>>>>>>>> +
>>>>>>>>>>>> +When the driver sets SUSPEND, the device SHOULD perform
>> the
>>>>>>>>>>>> +following actions before presenting that
>>>>>>>>>>>> the SUSPEND bit is set to 1 in the \field{device status}:
>>>>>>>>>>>> +
>>>>>>>>>>>> +\begin{itemize}
>>>>>>>>>>>> +\item Stop processing more buffers of any virtqueues \item
>>>>>>>>>>>> +Wait until all buffers that are being processed have been used.
>>>>>>>>>>>> +\item Send used buffer notifications to the driver.
>>>>>>>>>>>> +\end{itemize}
>>>>>>>>>>>> +
>>>>>>>>>>>>  \chapter{Virtio Transport Options}\label{sec:Virtio
>>>>>>>>>>>> Transport Options}
>>>>>>>>>>>>
>>>>>>>>>>>>  Virtio can use various different buses, thus the standard is
>>>>>>>>>>>> split @@ -872,6
>>>>>>>>>>>> +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
>>>>>>>>>>>> +Feature
>>>>>>>>>>>> Bits}
>>>>>>>>>>>>  	\ref{devicenormative:Basic Facilities of a Virtio Device /
>>>>>>>>>>>> Feature Bits} for
>>>>>>>>>>>>  	handling features reserved for future use.
>>>>>>>>>>>>
>>>>>>>>>>>> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that
>>>>>>>>>>>> + the driver
>>>>>>>> can
>>>>>>>>>>>> +   trigger suspending the device via the SUSPEND flag
>>>>>>>>>>>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device
>>>>>>>>>>>> + Status
>>>> Field}.
>>>>>>>>>>>> +
>>>>>>>>>>>>  \end{description}
>>>>>>>>>>>>
>>>>>>>>>>>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved
>>>>>>>>>>>> Feature Bits}
>>>>>>>>>>>> --
>>>>>>>>>>>> 2.45.2
>>>>>>>>>>>>

