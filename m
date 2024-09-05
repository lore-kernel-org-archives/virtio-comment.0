Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC241487C0
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725525072; cv=fail; b=gyZpOK8VHzla2KHB+bLlI1xlvUisGzWWX/d08UVOb7RtOCKGuLAeBpfwS7G8n9rPgeGCihH2bOmm9wDFlPcOn37pykGFfS9nhgBgIrrHAXNVqzfBDjL4wFLFGh4tSJSjliZgWszDlkiK66NDMQPZq8WJD3uO51tJa3KSgopxb4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725525072; c=relaxed/simple;
	bh=4teHrtySfsZG6Nw0F2eeh+NdYO9idy4mhDRTM6D4Zyw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FOGJSyrb1tem43yoa/+ZNdPAkVGvmsPmjJNyFTI+Ija941u+4uyBCJCCRBtNVYorMojFqo0qhvHS9ZmdsEJl9i8O+Xq4rgChUEWHreMkIWOObAh+LpdVOZfHNy3+6qwb3qFTEdYP56WU4amU/jNa91K4kkTzQRhDb+uQvW2NEEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bQhuoKnM; arc=fail smtp.client-ip=40.107.220.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bQhuoKnM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8UOuXJ0Nd4rv0Rt3vVG7B6Kvwgk5s3c+QqwhRYdEEd43x2STIXtMrGGU4E2YKt3mis4cfue5KNG/vhdQKqV2M8C5wwNikTHq9zsZGNj5B/E82WfBC3m4oad++t59ClSgro5WUfVPnGySPcQ+XvWe2Y3g5X927hpcJnX1CUJaqZGKMCVEuDgg5lqvfYLTYNbTUXfHBhhmBJceUz2DAvgGZEz4puaU8ZfCQoa7uru4sEedbIQefhyhwWneOUd7S6Mngy5Erg4kWgrtvA2gbqQ2iVa8m/ikMniQQj8zWI0/3k22rzInLsja8FN9/0naAY+c15nZ7F/soz8WKF6/aDWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pILcY9IEE20i26en861gcGZCNC1zJugSkxMhl4eTRc8=;
 b=c0AIIOgmha+YGVY96ForgHkm0YG0k5r4/6Foa4Nns/Kkm/k/K8CaV0tAGaDgQOZazg4XRqqNlvLWNRwRBuMY8NX7pNioN5rr51LFrB7EeUdgO1HWxCMgHsG2zUY7l4uUKHIyyF/UF5g4qJXPCKk79ZtuFS6fyEqS7EHjvKGsm8EwVYcUbGzDqt5p31sZiI1/zD9OiDgDjXIVCs2Fh3VFgU/OGSYq7I/V9WJ6wneoreb+YScQfBlVYqpDkXcXrjdjWs7PErUwsghvQXM8AygDUsKwHVYlDSnDNFnuyKq11ucCT96mEOYJ+5Zjs/0t16FT+2bplFyQFiBeRwWpMshHQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pILcY9IEE20i26en861gcGZCNC1zJugSkxMhl4eTRc8=;
 b=bQhuoKnMIJ0EDvNncl83Clj/Bv7+rQJ1GtHTFCJFEQDFJ6xYaCVbAsUbEb4ZK+MFgX7IQVT47ELC1ju316D0B8IzSMJVLeB+6dMm/LxQfSCgd4vmToWjnetRR44rmFwrHNuxPIOhYI134lLGAhW4vroxVJQuaPOFWXRahOWYqxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by CH3PR12MB9342.namprd12.prod.outlook.com (2603:10b6:610:1cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 5 Sep
 2024 08:31:08 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%4]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 08:31:08 +0000
Message-ID: <6ba5f119-3613-49a4-b368-b8f745556723@amd.com>
Date: Thu, 5 Sep 2024 16:30:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: "cohuck@redhat.com" <cohuck@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
 <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
 <IA0PR12MB8713995E39DD585341C47520DC9C2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <ef72f0af-3a04-4a79-9f9d-c6dd7fb24d53@amd.com>
 <IA0PR12MB8713065A3CE6752084FCC6AFDC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <d42bd62a-5527-4468-9714-2555a52a361d@amd.com>
 <IA0PR12MB8713676643C6A258BAFA332BDC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <IA0PR12MB8713676643C6A258BAFA332BDC9D2@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|CH3PR12MB9342:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed86441-c1b8-4955-d01e-08dccd8516ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzczSkhaVnNPdHpvcGEzMUFCY1NhaE5PMzFKbnJYNGVYREdUV2YxN29WQkdG?=
 =?utf-8?B?TXZnU0VsZHdyOHo4M2pkd3Y4OVdoQzk3WWRPUnR2Yit1N2pMTVNNb0VvY0ln?=
 =?utf-8?B?TURDYnFlMFBmdlBONXBSYlltZ3BFWkxTMldGTzcxdW5oSDRTYmp4YW5heHRM?=
 =?utf-8?B?V253SE9OVk42TEwveUdYaUVPZnUxUGIzbmp1dFJiWGZBWUt2MVNQQjlDdzlY?=
 =?utf-8?B?Q05GcmFvbnBldnZMQ0pNTDVweWQyalVPZTdueWFxNSt5c1Y4NVFMMnNpN01h?=
 =?utf-8?B?dFp6Mmpoejc0U3hteENJTVRWY1J3VitvMGtHRmRlNDk3VUljdDhTNCs0cVh6?=
 =?utf-8?B?ZEdocmV4YWdGMGFkMUFEM3NSM2s1cGpzZEp2aCtST3l4ZklpZlU0djgzWjNS?=
 =?utf-8?B?d0drdWVZM2lGekZRSVNEZHhJQllEdVlBUmtmMXNaVWhEY255emkyV1NJMjIy?=
 =?utf-8?B?NkdjQ0UrUmwvMlprbVhwRVZVcUlBSEQ5Q0pRdFlLSTNsQTNVZ0hoV3JHZkEx?=
 =?utf-8?B?Y0t0dTl6d3JCNkRuUXdQTGt5eVh4b2ZqZ2UweCtiNFVVd2lUV3kyazFIN2hw?=
 =?utf-8?B?anlHeXNiTWprUUFjT1AvazBvMXBYdjNEUlhReUVkcnRmek1XVk81bnVqREIz?=
 =?utf-8?B?MnM0M1VQNGFFWHZQM0Q3U1BXQ3NpdzM5MU4xZ0dXL0lIZnlocU5mZkcvby9V?=
 =?utf-8?B?eTkvYS9LZFJJNlN4WkhYK090OTJnRGFuMTZuOFEzMTZBVGdCZnhhazNSNUVZ?=
 =?utf-8?B?UHRPK053VnRQaFRZUzlnRkJSUDRaUC9xc0t6UDRab2p0aUVwUC9uMHBHL0RJ?=
 =?utf-8?B?MXljaEM5REM1WWFHRjZpeW43V3dCeUJPM040WVVHNmZuTEowZy9zdHRDY051?=
 =?utf-8?B?SHZwSzBKd0FIclJkR3h1OWRRQmh2ZDBVTEpmVFc2dk5zWnZlNnp0TkhlUzMy?=
 =?utf-8?B?N2NrKzE2NlA4VlZ5VkdScG9tNWZ5ZXZ1UDJCOEJ5Ui9LTE84UFQvNGVMYkFm?=
 =?utf-8?B?Tm5pK1hrbVB5Y1MvMkZoMEtTdlp4UXBYUVNsVDhxTG8zVE5VZGZYOE1UUmpt?=
 =?utf-8?B?VXdRU1JraXNjVlpDaFc1dUNtaThDSWtpcHZyYnlLUDh6eEk1VWwzR2hlZUwz?=
 =?utf-8?B?b08xMXh1ZkpKSGlLNzN5YnVQV0dIVzlOa2I5ZlZVUDJDblR0RDRXM2VVRnV4?=
 =?utf-8?B?QW1od3cybjBvdmJoUVpHeEVyZFdZQzI3aFFQTzgwdjR1Y09zS1NnYTNtYVo3?=
 =?utf-8?B?VjdVd2ZFQUJjbDFCb3ZiczZIMGN6TVFLNDVTTEpzakJteDJiMXdkMWVuTWJy?=
 =?utf-8?B?bTZGeWZsVFRqMVFJdXRWQlMzWVFKcmM4bHhyQ1NYMEY5dTVsVENYYjd6NURZ?=
 =?utf-8?B?OUw2aUg0dG9jYVIrK3RyQ0Z3QTZrT1oySU11ZTJ4QUdhc1VCdk82cHZod1ZM?=
 =?utf-8?B?SXc1S2dxZmplT3dIWU1id0trVHFieWVwcHlsK1RVbnh6dXBZaC9WM3pXcWJN?=
 =?utf-8?B?RXFSa2NiZTRkeWx4c3B5M2lOVUNWRmtINlN5TEZjTVdheHU1Ryt1QkU3cksw?=
 =?utf-8?B?bXp3ZHQwYndCdWtGUXhMREFGWUkySVZydjZDV3d2VnRhZWM0a3UzQjJKQTRm?=
 =?utf-8?B?SXZwTzFLSnl1MHJFc3VVenFndG9ZaUtCUTEwM2pJTDdjdy91K3k3RWUrbUk4?=
 =?utf-8?B?bDRqQlpMb1hPTFJNUUd2VXJlWkluVytYbWMxRmJnZmdTTmZOdW5JNkF6N0RD?=
 =?utf-8?B?MGVEN3cvaXpVMGQrdkV4RHVLcndKdm1hSTRaOU5Ed0FJa2t3bXJjaWI2MU1j?=
 =?utf-8?B?dzlTQ0c2TUljNTFNOTV0dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjFxUzdZNGcwUTNoUnd0WFN1RGJiK0lFSGxtakJwQlg5d1dtTFczVmViNnFY?=
 =?utf-8?B?dm5DaXdZUHpQcWJ3cnVxSG0yUjFpaVV2U1VMSzdhN1lmVWwxT0FQMXZ6eFB2?=
 =?utf-8?B?czg3M3l1U0FhQlFGQnQzUlBnQWlCbEUwNGZscFp5ZEZ0VW55bFllNGQ4djFw?=
 =?utf-8?B?cXBKM1MxWmxnSUMvVG5HWXBSQWt1a3lGUmpZUE55bWZpVTJoYlVBOW5hZU4v?=
 =?utf-8?B?ZU4wWEtrSmJpUU9KV0ZoMDhibVRiTU1idE9VaDRaaTFobE8zYndYT1VsenNR?=
 =?utf-8?B?dWxtZHFaQzhnUmpqMUNLSVNDSDJSa3liS0doY00zUG5SUXZpdjVvWFQvZWM2?=
 =?utf-8?B?TUJjR3VhY1o3TVBVUGpTZytrRVZQblhtbVNsSWJCZEN3WGp3T2ZNeWxpVmk1?=
 =?utf-8?B?bVVYOUFFNkNQaUV2bm81WEFhTm9PT25JbnVCYkpObnFDazNaMXFiRG1mVzZG?=
 =?utf-8?B?KzdaL3dzL0xQbVVGTHZLc0hLZXFlSHdqeC92WUhVZWRwdUw1Ri9FMFNVUEdx?=
 =?utf-8?B?VGkzRjc5bk5pb09uMEgzRndScHpvRnQrMmJMZWVjWnR4T2JnYVlqUjlleU9x?=
 =?utf-8?B?Vk1udjNwNGwwenY1RWxsSmpJb2JFeFFIYnFBWlFENi9tYXpjVmlGUm9SZytt?=
 =?utf-8?B?YlA1THJaNGpTOEpibktBK25pOXU2YjlCQzY4RXNYMnJCRjIvaXdYWFRKOTQv?=
 =?utf-8?B?YVdHOHlJM0duUFlLWDUrUVZYNWEvaHQ4b3VMMTFCbE02QUNZb05Tak1MdENt?=
 =?utf-8?B?WWhQaTV0V3FHYXlFT0hkLytTRlNscFVFeWVBQlJwT0czT2RSdVlmM1RwTk1Q?=
 =?utf-8?B?cDUvWmdvT2svZFdzOGdra3IyUXlIa1prbGNkQWdHMVNBRGUrZ2ZEWHNCQUV3?=
 =?utf-8?B?WExHQmd0Zk43OEVjaTZkbndrYlFzR2xtYzBOTUJpTEhlcXhTdHBlZTNQOTU1?=
 =?utf-8?B?WC9maksxMmRyREREOHdmb2FicXZ0bXh3Y0FIRzhtaVcxTkZmczhLVzBnQ092?=
 =?utf-8?B?UHl4NXFoODVreFBnYy9jYWw5QVphUmtOamN2K2xpUUJTcVhvSUpNcy9mMVZm?=
 =?utf-8?B?UUxlMDNFdHU5MkdzbjZhNTlnNDgzeWcrcjM2a1FIN292aDFBeURiVktjNVFH?=
 =?utf-8?B?WjY5ZllTZHFuRXRheTdGR2QzUWV3aGlJY0lIVUlxVjF5TmR1WXFTK1J1eUgx?=
 =?utf-8?B?aXNla0dEZ29KMXlpY0lKMlZIaWpURzVuSHdrWmRJcnVtSllBaHFOTkM3Mi93?=
 =?utf-8?B?aW5qRk81WTFuakJtdlpmVW1FK2dDUzM5aHQ3dDY5elJJNWdkSCtmSTFCMGF2?=
 =?utf-8?B?azFDQjgwTEo1VVFHY2lHeGk1YnlHRklEdXRIY2pXWE9tdWJnNGZWZGNtKzBn?=
 =?utf-8?B?VnVFY0dpUGUwU1MwU2ZvcHFNRDVueDEvN3BYZVh6WnU1WksxYnJlblg5OUZU?=
 =?utf-8?B?Z0xYQ3pHMlljS3Q4d0k4VzN3NzBHeVhrSCswS3pKTHR5dUNyeEx3b1J6d3RK?=
 =?utf-8?B?LzlTY1J2RngyaXFUNzBRazBMMUVlN3VYU2Rzb0didFdLZ0hTd3hzTnpGZVpz?=
 =?utf-8?B?eTQ3Tjk4QlhWMTM5ZG5DTzFLcXJUMW51VmN5YVZ2YkZwUGV4UnE4ZHJ4bTNt?=
 =?utf-8?B?VzVuT1JROTZCdlpiWjAxWXRSWXBmWmFxaDdmMzNIanRQKy81T1VVeUxNd3ZK?=
 =?utf-8?B?em8vRFFUMjNEcnJ1TkVYNmVDQVJNYlVJd2dldEo2VDFQTVAyN0p3bkpUUVFu?=
 =?utf-8?B?Nk5Kd3pMRWF4YXdBVVk1KzlFUEUrNlB1U0lvVjJVYVJzV3pMcDR4ekY4emU0?=
 =?utf-8?B?dDBNME5xdW5YeFQvSXdVOHlGUk9xenorQU9na09MZ29BZjNsbFYxRlZOQ2pJ?=
 =?utf-8?B?aEhrbkRrSTlndmU5NzBzQWlRazV5VmRlVDhqUi92bGtJWkExQis0UDR6V2Jj?=
 =?utf-8?B?VW8zRFc5WWpQWkZBZW5wY3hnOENJZzdGcTAyNjNQK2RqLzl5em0xaXYvOGJj?=
 =?utf-8?B?VENaT1creVVabGpIVFFxeUk2S1BNWVN3c2xkdk9maWFpS21xUWxSQ05PYWtw?=
 =?utf-8?B?NXVJaTI1NDBjSmhXZ0dKcFVpTnhOaXhJWXBhcUljekFDRmsvZlhMU1JMb283?=
 =?utf-8?Q?vni0rpaWI+ciEDmnXUF9CkTdV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed86441-c1b8-4955-d01e-08dccd8516ee
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 08:31:08.1813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NchQzqxgY5KeSsQkXbdHEysZdKEmBcWslltwAQCJac7MLk/W8n79fJYyFBit8htWbIx/6awvNYJQ2q7nQg5R/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9342



On 9/5/2024 3:35 PM, Parav Pandit wrote:
>
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Thursday, September 5, 2024 1:00 PM
>>
>> On 9/5/2024 3:16 PM, Parav Pandit wrote:
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Thursday, September 5, 2024 12:45 PM
>>>>
>>>>
>>>> On 9/4/2024 2:46 PM, Parav Pandit wrote:
>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>> Sent: Wednesday, September 4, 2024 12:09 PM
>>>>>>
>>>>>> On 9/4/2024 2:31 PM, Jason Wang wrote:
>>>>>>> On Wed, Sep 4, 2024 at 12:03 PM Michael S. Tsirkin
>>>>>>> <mst@redhat.com>
>>>>>> wrote:
>>>>>>>> On Wed, Sep 04, 2024 at 11:07:25AM +0800, Jason Wang wrote:
>>>>>>>>> On Tue, Sep 3, 2024 at 6:37 PM Michael S. Tsirkin
>>>>>>>>> <mst@redhat.com>
>>>>>> wrote:
>>>>>>>>>> On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin
>> wrote:
>>>>>>>>>>>>> But I don't like it that looking at the registers, one does
>>>>>>>>>>>>> not know the device state. Hidden state is bad for
>> debuggability.
>>>>>>>>>>>>> We have 4 states:
>>>>>>>>>>>>> suspending->suspended->resuming->resumed
>>>>>>>>>>>>> so we need a register with at least 2 bits.
>>>>>>>>>>>>>
>>>>>>>>>>>>> we could steal 2 bits from status but it seems a bit much.
>>>>>>>>>>>>>
>>>>>>>>>>>> This is why letting the status tell the status and control
>>>>>>>>>>>> register to
>>>>>> control thing is elegant.
>>>>>>>>>>> No argument here.
>>>>>>>>>> Or, to be more precise, our status is driver status.
>>>>>>>>> It looks like the device actually otherwise there's no need for
>>>>>>>>> re-read or poll for things like reset and others.
>>>>>>>> The need is there for complex device state transitions, which can
>>>>>>>> not reasonably block a read response.
>>>>>>>> Another standard approach with PCI is to specify the time
>>>>>>>> transitions can take. I consider that less elegant - is this what
>>>>>>>> you are advocating? The advantage is that driver does not load
>>>>>>>> the pci bus with constant re-polling.
>>>>>>>> The disadvantage is that it is hard to pick a universal number.
>>>>>>>> A combination of these approaches might work, e.g. a recommended
>>>>>>>> timeout then poll.
>>>>>>> We've already had msleep() for vp_reset(), anyhow we can increase
>>>>>>> the sleep time, if it can overload the pci:
>>>>>>>
>>>>>>>         while (vp_modern_get_status(mdev))
>>>>>>>                 msleep(1);
>>>>>>>
>>>>>>> We can do the same for suspending.
>>>>>>>
>>>>>>> The main blocker for timeout is that it may break migration and
>>>>>>> complicate the hardening. Another proposal in the past is to have
>>>>>>> a notification.
>>>>>>>
>>>>>>> But what I don't understand here is that suspend/resume should be
>>>>>>> lighter than reset. If we can afford a reset, so did the
>>>>>>> suspending/resume. If we want to have something new, that's fine
>>>>>>> but it should be orthogonal to a specific new status bit?
>>>>>> I agree, if we want new status indicator, then the new indicator
>>>>>> should not be specific to SUSPEND.
>>>>>>
>>>>> Sounds good to me as long as new functionality does not force the
>>>>> device
>>>> to react in 50nsec.
>>>>> In the current state it forces the device so please upgrade the
>>>>> proposal as
>>>> Michael guided.
>>>> Trap and emulate is very often in virtualization, of course the
>>>> sooner the better for emulation.
>>>> But there are no 50nsec assumption and no one can force the
>>>> hypervisor to finish any emulations within a certain time
>>>>> Thanks.
>>> You are completely ignoring the comments.
>>> Good luck..
>> VM_EXIT and a VM_ENTRY work in a pair.
> For hw pci pf where there is no virtualization used?
> How?
you bring the VM_EXIT problem to me, if without virtualization, there is no VM_EXIT.
>

