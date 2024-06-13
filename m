Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2064.outbound.protection.outlook.com [40.107.100.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C119113CFB7
	for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272072; cv=fail; b=BFozAzDu6Ud2STqk0jDLuMxxEAkti0JkG6K7NCVnrvgW+LBUBmsr2vd+OBV8Q9sybnOphQguFxMZTdrC2d8C0DdfZ2hh9kXhJ3CD/mweo4BGBDY1wzYd2SJCAN4VVp19FEMu3y2KF0GxZqXaNDKHph5SOtbftMi/LiUJsO63Rx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272072; c=relaxed/simple;
	bh=uxUhR5uRJQWvPJhq36eWdd7yjO8sS1c4XgN+8rkdwj4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oxRnCX2j1zxT3pV2MxfnU6PMuUsDAvztg1qq9C+t3JGm4bom+dPKGUj31qkc75YN0MCDzdAf/NMI7u2Swy7Cf21ALURFasSoaJ6BU0zhaOrZzThViml7WNcPG8+6Q8GTT2GU/XO3t5nGqvE9nBrBCCpcP7PW2WOLrYhCM511J88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WyB673I4; arc=fail smtp.client-ip=40.107.100.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WyB673I4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juBz+F3wu6ToDaka7NYUQrwWwHcFwyMccA3i/oPtPSwHrUSwhExtjnv23D5O1nLoQZsmKJnrxjQkjJXp93Hx9oDRfJ8bZ5wliwbyiik8F9UhjpPD+sVGGO4T0K0zam1aJefMSAEd4TcmO6snBOIpwvnTLqqGv66itsoQ0NDCBer3nZbTDB8NUomBvfxYxnPDoktruZyQi3Tpghw14A8azlU28OeMbGkgr249eu1WhR5ZxpbJRsHhW7pf+ZMgoMBeT2xKi0JZ20DsNfWSoNIrph+FdQW70eSMMJVdaubU0Tuj5/fMFg1xl+xegM1TvYw9Fl4/gasnZPqbhEOTV4EQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbG0OvYLahk35gaCvYsBiRz7WSMbprmGf4f6zgncoPg=;
 b=Lqy3O60wuK1SW2PF498O015RldH9nATUUM4Vv4cdyPsx9yF3xCfYyH4XixjXgVHFLd3KK/TR8Ab0+krj5aZg+LkamnHCsIt11f6DEUC8a2NCvglSBLYxyBI/5F5BJXt07DPREnYNbSK25xLwSp0Ex06yiz7aysGWJ9qHj1qZQ3k3cz7/ULvjk9VurgVTg8NrEFcRH7oRfs9ULI2OP0oR6UsV7dY1DXthAjarIKDh46qdAPXrNPxW3P/BuHxWRQ8Q46aYm/VXVhqyw2s6C96IXfLuuqBDOzjtzoZk2nncqS5mI5+rAxbzxZWpg5UMyNiVAftEZsNgsBIJdol9cx3BDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbG0OvYLahk35gaCvYsBiRz7WSMbprmGf4f6zgncoPg=;
 b=WyB673I4DTHby06xgpDxUiWby0CvzRNlK/mk7IkFewXw9XFGmpI/rXimp5yFo17RBovqOJ7Uo3LQoMhI9aqglyTzX4goYXHv5nwoEZiE5LHaYjH7etydXU327whjQoFnrDekMX9ZVih2nBI/uFMQ18VgOf+85LH6hA/E8Y/1WoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by DM4PR12MB6662.namprd12.prod.outlook.com (2603:10b6:8:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 09:47:45 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 09:47:45 +0000
Message-ID: <47c25aa4-8f79-4aee-a4cb-460c3a5d687a@amd.com>
Date: Thu, 13 Jun 2024 17:47:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <20240607074246.7647-1-lingshan.zhu@amd.com>
 <87zfrskcmq.fsf@redhat.com>
 <PH0PR12MB548111206A0EEB7EE62421FADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <3319f7da-5c1f-48ff-916d-03791edf1783@amd.com>
 <PH0PR12MB548190E2CCAED2E01410F79ADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2657c74f-1caa-4e5e-b767-b16e059247ae@amd.com>
 <PH0PR12MB548198E64803B0A7D9389E9FDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2f9636c7-06ca-49ec-ac86-f8a2f1f97b4f@amd.com>
 <PH0PR12MB54813032E8F5B0DA32BA1B23DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e25f93cd-baa3-4a54-bf9c-1fc27fa95c41@amd.com>
 <PH0PR12MB54818F69437BBA6D533ABAF6DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
 <395ddde1-f8e9-4b6e-bf90-2f9c42406366@amd.com>
 <DM8PR12MB54804F81E1673C09213A4302DCC02@DM8PR12MB5480.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <DM8PR12MB54804F81E1673C09213A4302DCC02@DM8PR12MB5480.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0114.apcprd02.prod.outlook.com
 (2603:1096:4:92::30) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|DM4PR12MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bccc44f-943b-48db-cbcb-08dc8b8de03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2wzeUtyQWovVEt2TmVOMm10UGZoK0VHOVE5Y3JEa3hQRVJaaGJCQnlEMXgx?=
 =?utf-8?B?K0VDN3dKV0hxd0dIeUlMVyt6NUY0NndGbWxqR0psV3FuMm9ONVI5eTR6MXV6?=
 =?utf-8?B?dDhUN0dmZkVSZ3FKaXpCbXloYktva3BqTVM3eXFUdi9xOTNwaExCbkpRVWVr?=
 =?utf-8?B?WG5Sczc0MlFyby9vcjg5cUpXWUtlaVVrSWVhWnVxVnNXeFFXM2hPR3hDdUZi?=
 =?utf-8?B?VGRheGpTenV6STFEdlpTZG1YMXJ6SnFERWNra3hQNS9tWDhuSVFNdUwrdWFO?=
 =?utf-8?B?RGpmaWV2V2JMYVlhWjZ4ZG94TGFmd2lOLzlnN3VOL0JEWk5nWWJqMjY0K3Np?=
 =?utf-8?B?bklzajcwOUc2UXVwNnlOdS93aUxZTFRFR0JueERMTmwyQ05PRjNXMmJPa3R4?=
 =?utf-8?B?dENWbTFBTE8zK1NLQjlrNVFBd2k1YmJWZmp1RDBIaWhRdGloQzBpeXRzT1lB?=
 =?utf-8?B?K0NsVk8yejdPbFdjdzNvWjVQMmxVajJPejNjanpsWjZPN3lsT1JiWGk5VHRS?=
 =?utf-8?B?QXR2MnV6SVN2NTJPM25UTFliWldDUjllTzRvWlR1T3lCa2tvRDk2NkxaSDV3?=
 =?utf-8?B?SmtKTkYxMWJ1Y3VmMUlDbmpZT2xBSm54V28vM1I3b1hORWRBRkZINUhFbEwy?=
 =?utf-8?B?YStNd2k5VXlaWTlRMnZrSjNBanRhU0tPeDRMSzc2ajVHTWRrbnZtN09ZNTBC?=
 =?utf-8?B?Uk9kbFFWMXcwODkrb1JJV2hjQm9hKy85dVByQWg3SXAxampqNFozajFYVmx4?=
 =?utf-8?B?a0NLVnprSTBHbWFraHpuQWxWM0tWQ0JjdExzVSt0Rkx2aFFYaVR1OXhFSVFQ?=
 =?utf-8?B?azBSUEt0QVdKcjZ0clVkTGRsbkZoSklvK1lsNWJxTU1rZHZCK3dKcEZjNlFw?=
 =?utf-8?B?NlJpcUZ5YnZGT1hwc2Uzdi8xRFJITiswcWREYzY1MEpoWmJPeWhLWllCTDhk?=
 =?utf-8?B?MTRNTmJzenhsVEJJVUQwZGdMc211Wk9pdzBOQm9vY2UwZDFYR0wyRXh3M3lZ?=
 =?utf-8?B?dGtqamNCUmVNT0ZNVmIwSlBUREVUSWFralN5UHB3N3hydlhSR2NaZk12UWZt?=
 =?utf-8?B?V3dQdG9KbUNwVWlIVnFnRDdiQ0swbHhjZkk3c1dZa3F1SDN0TmcyRW5acDdN?=
 =?utf-8?B?amlvb2RpbWl2Sm5tOVgxVjZjcmhmTm9LVEVBS1dJY3N4Q3gxenFibDBVVGl6?=
 =?utf-8?B?TXBhVmdnY2U0QTF5NG9mbDRhWDdMSHBnUjFDTXp1Tmw2NHlkbU04ZERpL3FD?=
 =?utf-8?B?cW9OZi9xUFM3WXBkYlpNdjFVMXlxcHZTTlJSMWMzRmR6Y0o1TGxTTnVmZ0x4?=
 =?utf-8?B?QmliN2NxRUlIelRhc3hpVTVYUjNQMVBkZHhHdDIzUzl6Zk1TdVQ0M0V3TmZi?=
 =?utf-8?B?R0JHS2JGZnp4Q3NvVkV5b0hPWjQ4Y1RPMCtiQlg2WmRGQzIwc0Z4eUZHbTJP?=
 =?utf-8?B?RFArMWh6dFZqZVo1Nk1saTBxRUNmMVlYTFJGZTRBWFF2T1E1eHRuUXdwM2p5?=
 =?utf-8?B?dStJOHdwbzljVitIZ3duU2labmswemdNS2VoTVQvUk9mUTAzTjRzSVhNZ2VI?=
 =?utf-8?B?bldJSFR5cm1DdDhtT2Z6azFOTVlKU3J4R1lHb3FJR2Y2UkZrc0xObXVoVjVm?=
 =?utf-8?B?cExDVTZ3ZWV0aWw0emY1WkZ3aE9WMk9pbXlBZHFNeVdnTmlNbHFNYnNOb2dU?=
 =?utf-8?B?R0F2eHZjdXBKdWs3MzRpSFBNNzErMGlnTFJNNE1LS3JUYnNZYVdVellVSk9V?=
 =?utf-8?Q?1Nlm7lbeLYp9wZU9cs9ajrp25nEdNd4kTWn6Kt9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230034)(376008)(1800799018)(366010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU5xellIMGZQeE8zY1FYcFExdXBJQndCTjBTN1U0eU15RHRQMU1tcisyMzQ5?=
 =?utf-8?B?TEsxeWpVcmdiYVlTdktPQ29TMnB5K2tNYTR4cUlOeDU3dkkzWHp2TjVxQ3Rx?=
 =?utf-8?B?d0xOazhOUHVzMFlaYU4yelhoNDRqMEFlYm51V2dSbGxSK1hwaWR5alg2Z2ln?=
 =?utf-8?B?NmtNYmR5ZlFueEkzdS9DcG93UCtKaDN5b3hYNnJlSTJUQkgyVzVoOHZTVmpL?=
 =?utf-8?B?Q3BkdithTjFQem1NOUxHYVNWUnBvNk8zNFpRUzRRR2RZdzk4WGlQMUgvNTVF?=
 =?utf-8?B?SzRXeVRFR3JiekVyaS9ZRXNXSXNXUmhUUnFsUHk2SXJqcjBuYjR3Q05rRlBs?=
 =?utf-8?B?THd2K3M1cVNqZWtvVm4vZnBHdFEyTXhzM0lyRE5XdlpZOUJ6NlcrZHMvelF3?=
 =?utf-8?B?NWoyQ0hQazFHRkU1TXVnbXlPSE0rQmhGeXJxQWtjTmt1UzdOSGlHaU1ISzQz?=
 =?utf-8?B?a1RoSXpJWUIwU1RERzIxUjFOR0RSOEJZYjVoeDNkMkZFMTdiWXVNYmdqSEVI?=
 =?utf-8?B?eTVnMU9CdndZUEY1d3Q3VDNaZWlwSVlZcnVOVlNlV3pSdUhiOWdlM0srVTBH?=
 =?utf-8?B?UTd1TkpmTjBUa0dxZ0pyOGpWQ1JiNDY3dFpKN1BSMUxQeVBlaE1OOUt0NERY?=
 =?utf-8?B?T0cwYlRMQm1TVElOTWYxUEZydmUyVVFJeGNhRm8rQ0NxM3NGY2tqK0lETnhu?=
 =?utf-8?B?MjNDZ0tuYmRMQmhVZHYwcjl1N3dBZUJEcitiVUZUWExIN3ZMenBlbTE2YUc4?=
 =?utf-8?B?d1U5UHMwYUNBVFE4clpMZndmMFdodkhJOTJmODZvTFNDcEJxM004MlJmaG5E?=
 =?utf-8?B?dzcyblVRRHFJRWFZYitpVDlkY2xCVWY0Qm8veWJIbm5VbkpYek9wbnd6T1R1?=
 =?utf-8?B?UWhKSld4a0R5TUpvYUo2cXpUM0M2MllJSEpROHZxL0hTbGl2N1RVZ3U3aDB0?=
 =?utf-8?B?cW95NUNsa1pxVlJ2SXlLM1hIbzFwUEMvS2VpT2hWTlJpZVNFZUZmelpQVzZk?=
 =?utf-8?B?TWczNnRUdjAzQlJ2K24vMitWR0lVV1htU0paL0lFaXZ0U251dEdjRkpERVBp?=
 =?utf-8?B?WjNtTHFjU2ErL3RxV2doNTBXeXJ1bEVndnIrMnlkMkE1V09UOFJQYzJ0TmVs?=
 =?utf-8?B?WGNaaFlhNzl3cFhQang5dGhpY1pIL0w1MlEwSFdWdC9JZU5yTkpSL29BekMy?=
 =?utf-8?B?UmpPQU1hcHQzZ3Y5RHBUbWlFN0IzT1MxZXdDZmdha2J3clR6Y3p3d2JMTWY2?=
 =?utf-8?B?MVQ1WklRM2hpNzgwQWlMMFRjVitHSGo0UjZzWDhHSEIwUU1SYTdyNGtGcEF5?=
 =?utf-8?B?TWVGd0szRzRqTHc0K1ovaE9pZUsrUTFNKzN4dXhOUGJUbCs0TFdvY1RUYlU3?=
 =?utf-8?B?VVAxNHVDbkNUcldoOUREdUtsSkppcWFqRHY5cVJyM1ppb3B2WmdrcXhmdm43?=
 =?utf-8?B?YkxWcUpYZjVpRjRDT2UxcVR5dVZxWGNPeWFJM3RPK2xQc2Q2c3k4UVFURlBT?=
 =?utf-8?B?SlhaSlJWa2k5d1RJODg0RTFLY20ydlBwS1c0NkprT2hna1BwdjFrL1NjTndi?=
 =?utf-8?B?VVBRai8zcFJJMHBxK0pUNUdzTmk2NFNGamhHOVd6TjMrUWNUZm9BcVBSRDFz?=
 =?utf-8?B?Z1EzV1dlRDNXQVdKcWZwcEFwL1hISTFDRVNBZHY3eXpIQmJkN0RoQXEydnZj?=
 =?utf-8?B?UG5CWDNobVdjblZSS1FKakdzM1lrVm5EVkdXRi9kRDhaMTBSME5BdlhnNWd0?=
 =?utf-8?B?OW9KUnBWWndKNFRYeDFVa3c5ak9GRStUaVVaeldORjE1WVBwdzFhVWh3T0Ey?=
 =?utf-8?B?QkxudlNCVGlnVHp2c09ueHArL3VQOGhxYnV5OGZ0YnRHdy8vWWl5YXlpdkps?=
 =?utf-8?B?Snd3SXlZdFJudnpnNzcyT1JKNmFaM3hXdkxhc2I0N0NLQ2VVL1Vkczc4bFhp?=
 =?utf-8?B?d0paaVhLd0QxYVNoTjNMRVVKTkxpcFJacUJYWFFmMWFxNGVYSHJqK1MvMHht?=
 =?utf-8?B?ZWRMRmRuSTViNnVweitLMVdkSHNJV3BZWFl4RDNINXdaR1A2a0oxUGFwOTdo?=
 =?utf-8?B?MDZIbnh6ckNjTmVIUjVmTjl0anRsSzdEcDVyejA2U0FhWDJyaVcwZkhtZ2JF?=
 =?utf-8?Q?YR0K9T3Kh/WwbiJCtnwMIP0ZN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bccc44f-943b-48db-cbcb-08dc8b8de03a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 09:47:45.0950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9rdfFK1a9OHZb9w6umtFkJYi8KMCWHGAZo2T3vxjuyg4Zm2Mk6ZyvHamHR45XbpCKunw8cT5lFKpoaMozAOBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6662



On 6/12/2024 7:26 PM, Parav Pandit wrote:
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Wednesday, June 12, 2024 4:00 PM
>>
>> On 6/12/2024 6:07 PM, Parav Pandit wrote:
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Wednesday, June 12, 2024 2:50 PM
>>>>
>>>> On 6/11/2024 6:37 PM, Parav Pandit wrote:
>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>> Sent: Tuesday, June 11, 2024 3:42 PM
>>>>>>
>>>>>> On 6/11/2024 5:43 PM, Parav Pandit wrote:
>>>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>> Sent: Tuesday, June 11, 2024 3:03 PM
>>>>>>>>
>>>>>>>> On 6/11/2024 4:48 PM, Parav Pandit wrote:
>>>>>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>>>> Sent: Tuesday, June 11, 2024 1:57 PM
>>>>>>>>>>
>>>>>>>>>> On 6/11/2024 1:17 PM, Parav Pandit wrote:
>>>>>>>>>>> Hi Lingshan, David,
>>>>>>>>>>>
>>>>>>>>>>>> From: Cornelia Huck <cohuck@redhat.com>
>>>>>>>>>>>> Sent: Monday, June 10, 2024 9:34 PM
>>>>>>>>>>>>
>>>>>>>>>>>> On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com>
>> wrote:
>>>>>>>>>>>>> This commit allows the driver to suspend the device by
>>>>>>>>>>>>> introducing a new status bit SUSPEND in device_status.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This commit also introduce a new feature bit
>>>>>>>>>>>>> VIRTIO_F_SUSPEND which indicating whether the device support
>> SUSPEND.
>>>>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>>>>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>  content.tex | 69
>>>>>>>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++------
>> --
>>>>>>>>>>>>>  1 file changed, 59 insertions(+), 10 deletions(-)
>>>>>>>>>>>> Can you please add a changelog? Especially as some of the
>>>>>>>>>>>> previous discussion has been lost due to the broken old
>>>>>>>>>>>> mailing
>>>> lists...
>>>>>>>>>>>> (...)
>>>>>>>>>>>>
>>>>>>>>>>>>> +\drivernormative{\subsection}{Device Suspend}{General
>>>>>>>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set
>>>>>>>>>>>>> +or
>>>>>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +Once the driver sets SUSPEND to \field{device status} of
>>>>>>>>>>>>> +the
>>>> device:
>>>>>>>>>>>>> +\begin{itemize}
>>>>>>>>>>>>> +\item The driver MUST re-read \field{device status} to
>>>>>>>>>>>>> +verify whether the
>>>>>>>>>>>> SUSPEND bit is set.
>>>>>>>>>>>>> +If not, the device does not support the SUSPEND feature.
>>>>>>>>>>>> That sentence is a bit weird: I'd expect the device to not
>>>>>>>>>>>> offer VIRTIO_F_SUSPEND in the first place in that case...
>>>>>>>>>>>> could this rather happen if the device is not able to handle
>>>>>>>>>>>> the request at a specific point in
>>>>>>>>>> time?
>>>>>>>>>>>>> +\item The driver MUST NOT make any more buffers available
>>>>>>>>>>>>> +to the
>>>>>>>>>> device.
>>>>>>>>>>>>> +\item The driver MUST NOT access any fields of any
>>>>>>>>>>>>> +virtqueues or notify
>>>>>>>>>>>> any virtqueues.
>>>>>>>>>>>>
>>>>>>>>>>>> "send notifications for any virtqueues"?
>>>>>>>>>>>>
>>>>>>>>>>>>> +\item The driver MUST NOT access Device Configuration Space.
>>>>>>>>>>>> ...except for the status field, if it is part of the config space?
>>>>>>>>>>>>
>>>>>>>>>>>>> +\end{itemize}
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +\devicenormative{\subsection}{Device Suspend}{General
>>>>>>>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
>>>>>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +The device MUST ignore all access to its Configuration
>>>>>>>>>>>>> +Space while suspended, except for \field{device status}.
>>>>>>>>>>>> ...if it is part of the configuration space.
>>>>>>>>>>>>
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +A device MUST NOT send any notifications, access any
>>>>>>>>>>>>> +virtqueues, or modify any fields in its configuration space
>>>>>>>>>>>>> +while
>>>>>> suspended.
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +If SUSPEND is set in \field{device status}, when the driver
>>>>>>>>>>>>> +clears SUSPEND,
>>>>>>>>>>>> "subsequently clears SUSPEND"?
>>>>>>>>>>>>
>>>>>>>>>>>>> +the device MUST either resume normal operation or set
>>>>>>>>>>>> DEVICE_NEEDS_RESET.
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +When the driver sets SUSPEND, the device SHOULD perform the
>>>>>>>>>>>>> +following actions before presenting
>>>>>>>>>>>> SUSPEND bit in the \field{device status}:
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +\begin{itemize}
>>>>>>>>>>>>> +\item Stop processing more buffers of any virtqueues \item
>>>>>>>>>>>>> +Wait until all buffers that are being processed have been used.
>>>>>>>>>>>>> +\item Send used buffer notifications to the driver.
>>>>>>>>>>>>> +\end{itemize}
>>>>>>>>>>>> So, is there any opportunity for the device to fail setting
>> SUSPEND?
>>>>>>>>>>>> I mean, if the driver is supposed to look whether it sticks,
>>>>>>>>>>>> there should be conditions for when the device might clear it
>> again...
>>>>>>>>>>> Additionally, a suspend operation usually involves saving
>>>>>>>>>>> things to a slow
>>>>>>>>>> memory (or media).
>>>>>>>>>>> This is because the device implementation wouldn't know when
>>>>>>>>>>> exactly the
>>>>>>>>>> device will be resumed.
>>>>>>>>>>> Few examples, are:
>>>>>>>>>>> a. A gpu device with 128MB of video RAM when suspended,
>> QEMU
>>>>>> needs
>>>>>>>>>> to store this into a (for example) rotating hard disk as 1msec IO
>> latency.
>>>>>>>>>>> b. a NIC may need to store its RSS, queues, flow filters
>>>>>>>>>>> configuration for
>>>>>>>>>> several tens of KBs to some slow memory.
>>>>>>>>>>> c. A block device may prefer to complete some IOs to a
>>>>>>>>>>> threshold level
>>>>>>>>>> instead of maintaining large list of outstanding IOs in some
>>>>>>>>>> suspended memory.
>>>>>>>>>>> d. May be more in future.
>>>>>>>>>>>
>>>>>>>>>>> Additionally, suspend operation needs to be synchronized with
>>>>>>>>>>> certain data
>>>>>>>>>> path hardware engines to suspend DMA operations (read and write
>>>>>>>>>> both) which are inflight.
>>>>>>>>>>> (without causing DMA errors). Same would apply to the sw
>>>>>>>>>>> backend
>>>>>>>>>> implementations too.
>>>>>>>>>>> Therefore, the suspend operation that is initiated by the
>>>>>>>>>>> driver, should get
>>>>>>>>>> the acknowledgement back from the device that it has been
>> suspend.
>>>>>>>>>>> Some of the good examples if you prefer to follow, a
>>>>>>>>>>> driver<->device
>>>>>>>>>> interface needs a suspend register which should behave like
>>>>>>>>>> below queue reset register.
>>>>>>>>>>> Spec snippet:
>>>>>>>>>>> "The device MUST reset the queue when 1 is written to
>> queue_reset.
>>>>>>>>>>> The device MUST continue to present
>>>>>>>>>>> 1 in queue_reset as long as the queue reset is ongoing. The
>>>>>>>>>>> device MUST present 0 in both queue_reset and queue_enable
>>>>>>>>>>> when queue reset
>>>>>>>>>> has completed."
>>>>>>>>>>> At minimum, we need, something implementable like,
>>>>>>>>>>>
>>>>>>>>>>> The device MUST suspend the device when 1 is written to the
>>>>>>>>>> device_suspend_ctlr. The device MUST continue to present 1 in
>>>>>>>>>> device_suspend_ctrl as the suspend operation is ongoing in the
>> device.
>>>>>>>>>>> The device MUST present 0 in the device_suspend_ctlr register
>>>>>>>>>>> when
>>>>>>>>>> device has completely suspended the device.
>>>>>>>>>>> The device MUST resume the device when 2 is written to the
>>>>>>>>>> device_suspend_ctrl. The device MUST continue to present 2 in
>>>>>>>>>> the device_suspend_ctrl as the resume operation may not have
>>>>>>>>>> yet
>>>>>> completed.
>>>>>>>>>>> The device MUST present 0 in the device_suspend_ctrl register
>>>>>>>>>>> when the
>>>>>>>>>> device has completely resumed the device.
>>>>>>>>>>> At this point, the driver may resume notifying the device and
>>>>>>>>>>> accessing the
>>>>>>>>>> configuration space.
>>>>>>>>>>> Can you please enhance this part?
>>>>>>>>>> Hi Parav
>>>>>>>>>>
>>>>>>>>>> Yes they are necessary contents and we will address them in the
>>>>>>>>>> following patches.
>>>>>>>>>>
>>>>>>>>> The register polarity is critical.
>>>>>>>>> In your reply to Cornelia, you descried that suspend bit cleared
>>>>>>>>> in the device
>>>>>>>> after driver sets it (until the device is suspended).
>>>>>>>>> This is ambiguous behavior of the register. Queue_reset register
>>>>>>>>> was like that
>>>>>>>> before it was fixed in 1.2.
>>>>>>>> once suspended, the driver should not access the configuration
>>>>>>>> space except for the device status, so it should not reset any
>>>>>>>> vqs through configuration space.
>>>>>>> I am not talking about VQ reset at all.
>>>>>>> I gave an example of how the VQ reset register polarity works
>>>>>>> (with was
>>>>>> broken like how the proposed suspend bit is broken).
>>>>>>> Suspend register needs to work the way the reset register works.
>>>>>>> Can you please go through my exact text I replied in the previous email?
>>>>>>>
>>>>>>> Basically, the bug is:
>>>>>>> When driver has initiated the suspend (writing 1), the device
>>>>>>> continue to
>>>>>> respond 0, while suspend is going on.
>>>>>>> At this point, just by looking at the device_status register one
>>>>>>> cannot figure
>>>>>> out what is going on in the device.
>>>>>>> Is driver initiated suspend is ongoing, or it was never started.
>>>>>>> It is ambiguous.
>>>>>> From the device perspective, there is only one user: the driver,
>>>>>> and the driver sets or clears SUSPEND, it knows the status of the device.
>>>>> It does not work elegantly when the hypervisor or other system is
>>>>> looking
>>>> dealing with this register.
>>>>> In current proposal, anyone else than the driver looking at the
>>>>> device_status,
>>>> it is ambiguous.
>>>>> For example,
>>>>> suspend_bit: 0x1 suspended.
>>>>> 	     0x0 not suspended or suspend is ongoing. (ambiguous for
>>>>> hypervisor debugging this device)
>>>>>
>>>>> For device migration, it requires yet another side bit in the device parts.
>>>>>
>>>>> An elegant and non-ambiguous interface can be,
>>>>>
>>>>> ctrl_register =	0x0 (a usual default)
>>>>> 		0x1, suspend the device
>>>>> 		0x2, resume the device.
>>>>> status_register =	0x0, (still) running.
>>>>> 			0x1, suspended.
>>>>>
>>>>> With this driver and hypervisor (both) has very clear view of what
>>>>> is going on
>>>> and what is the status.
>>>>> No more ambiguity for anyone.
>>>>>
>>>>> Please consider pros and cons of both approaches.
>>>> The driver "owns" the device, other components access the device
>>>> configurations through the driver, I am not sure there are other
>>>> "owners" than the driver.
>>> Device migration and debug channel [1] plans to access the device from the
>> hypervisor.
>>> I don't see any disadvantage of separate control and status register.
>>> Do you see any?
>>>
>>> [1]
>>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
>>> .kernel.org%2Fvirtio-comment%2F20240601145042.2074739-1-
>> parav%40nvidia
>> .com%2FT%2F%23m14b80fd996e8d2522723967d8af844b70e131a90&dat
>> a=05%7C02%7
>> Cparav%40nvidia.com%7C06c09157b2d74af8b7f608dc8acaab0a%7C43083
>> d1572734
>> 0c1b7db39efd9ccc17a%7C0%7C0%7C638537850271999791%7CUnknown
>> %7CTWFpbGZsb
>> 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn
>> 0%3D%
>> 7C0%7C%7C%7C&sdata=e%2BBDJMpuFzmj47CKqnWU1jXcRZUXATmqhhMZ
>> 7WC8zj8%3D&re
>>> served=0
>> is the admin vq governed by the driver? There should be only one owner of
>> the device, or you need locks.
>>
> No locks are needed. Hypervisor is accessing the admin vq on the PF.
> VF is accessing the suspend ctrl and status register of its own from its own MMIO space.
> If for some reason, this registers is trapped and accessed in the hypervisor too, it is upto the hypervisor on lock/no-lock etc.
Even access device status from PF through admin vq, it is still trying to RW the unique vf->dev_status,
so there are too individuals accessing the same copy of resource, there need a lock.
>
>> I am not sure we want to repeat the discussion on the admin vq for live
>> migration last year, you know it breaks nested.
> I am showing you the use case where ctrl+status is useful without any negatives.
> You are diverging the discussion to a point of no return.
> I wish you can be more cooperative by seeing larger picture. :)
>
> You didn't answer my question, do you see any disadvantage of ctrl+status register?
> If not, lets converge and progress as it enables suspend functionality + device migration both using non-ambiguous register pair.
This is not about SUSPEND or ctrl + status. If we take the transition period into consideration, we need a total solution for all status transitions.
For example DRIVER_OK and FEATURES_OK, or the device setting NEEDS_RESET,
they can also take longer time than expect to take effects, depends on the device implementation.

Maybe we need a new bit in the device stauts: TRANSITION.

