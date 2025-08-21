Received: from esa.hc503-62.ca.iphmx.com (esa.hc503-62.ca.iphmx.com [216.71.135.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA8C2DEA75
	for <virtio-comment@lists.linux.dev>; Thu, 21 Aug 2025 22:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.135.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755815367; cv=fail; b=n9227fBJ2kfKYz+Ub8DyEwGLP4PoOlOqG0majs081xq4Sj88ZIbvn26dLSTbhQiGIQzEiasegAB0UT3kzmzNubpDXJJnx7XWOMlP59jNfMVBle6zAk6KUXRMF6c7hGIQx3KmA+cZqFtSOKnz9qDkygibgYEn2yNjt7uqK+zHKZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755815367; c=relaxed/simple;
	bh=6+DM1GsIlSJLXRkf3vH7E2evNFo7E+Fp87G1S4C0PJE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=SN6tfKiXaondZzQRbbo6CHZZ0djb1Nk04nudu31w7t6Na18KYOHuQxb7ifuAXsspFWUmFSOFjeAe5DO3KAomlSkBVe12R+du+AufVl3dCT4rLnygQRx518LsPph2Cr84m5/zqz0kKbqoJYd2+0EFU5dHfQUU677pW+EncQpbr7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uwaterloo.ca; spf=pass smtp.mailfrom=uwaterloo.ca; dkim=pass (1024-bit key) header.d=uwaterloo.ca header.i=@uwaterloo.ca header.b=x86BZS0f; arc=fail smtp.client-ip=216.71.135.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uwaterloo.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uwaterloo.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uwaterloo.ca header.i=@uwaterloo.ca header.b="x86BZS0f"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=uwaterloo.ca; i=@uwaterloo.ca; q=dns/txt; s=default;
  t=1755815365; x=1787351365;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6+DM1GsIlSJLXRkf3vH7E2evNFo7E+Fp87G1S4C0PJE=;
  b=x86BZS0fyqoOS0+J2gVVx6Fy8ZBr0zd/mWt0s8cFXsACS3pQ9HDRjoWr
   2KBq27QJ8FAKetotVL8eQ24ViIP1Kd9B1lUyPohwGcuiH5jA8KMgwzcUi
   N3z6gZcawW6atESQDEvlVarTRVJUP+YCuZS5eafTslw9hKAyeOQ31A92L
   w=;
X-CSE-ConnectionGUID: sWX4bkhBQOqiQVVXwLurUw==
X-CSE-MsgGUID: O12OuOq5TIKpADewkKXOiA==
X-Talos-CUID: 9a23:3xCqFW/FJd3Y+DWy3fGVv1UrKpwvcX339VDJInaGN1Z2bKCPdEDFrQ==
X-Talos-MUID: 9a23:TCavrwX4GYusMyrq/Bi13hZ/E94134WNEGkhnIoFmPmjNAUlbg==
Received: from mail-yt3can01on2106.outbound.protection.outlook.com (HELO CAN01-YT3-obe.outbound.protection.outlook.com) ([40.107.115.106])
  by ob1.hc503-62.ca.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:29:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfrrg+RKz0Vbfb5Vki2wuEXyW+DPRocpCC+OwFSx389Jy5k5Vmu2r4KKosiLAgUy0wZhDoTPR2kE0ZqwwMrE4OwFYcKGp1oizGpIzYdXJVD5WUD+nBtkNtT2VM0akJFIqyJHTBRhL1zHwVvWHqrjWp/W8WUrX+f+MmsakkVulitguTAcxSuVHk/m52do3vEqXqveV1j7bl1WYxzFukOysmCkhtjl13suh4TQwxqVLojbFuk/Zkf9WxzcwvRdSP/ikJBSfQay+Jo134UcU3KuDmx9ujes3+iwxAPPZ//VUeOrHsLP6EdPPxUy/+jjK+jDS3KTqyFzhYbFKmDkkXy0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3QLcwqFQD1m7CEjJ2QtOg63pWqnExwVVRG18GVbGnQ=;
 b=sXU8F5KjSlNhgWy6Q1V86JYl/ptMkhwI9RezknrhYzOa+Zw5rHVECTyDkZSWTpM4ExQlvDxwvi9OFk5hsTu0w1e2ehSny4Nuu0fOznsWeMttezj/Alc9n8v5XzkWVakc4b2h2uVIWOiFhbGNMoKwBEyHlluD+dutU54YjFQJhy8Ays6wM+/5ks47I9cUF8muqnh+fZAP29DxIJ7XSmvNE9AmejGpKArBn4Ne29SzW28TfAlKB4rcIDXipczNy5N9YqLKz3bAWhI8auoLJed4vBIKYPsUbuIBvcFtyIQlzdmGwtvr5S02R+/h9uqv1LI17lCYUE2eNdGIZ5PSPL9q9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=uwaterloo.ca; dmarc=pass action=none header.from=uwaterloo.ca;
 dkim=pass header.d=uwaterloo.ca; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=uwaterloo.ca;
Received: from YT2PR01MB9046.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:bd::13)
 by YT2PR01MB9416.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Thu, 21 Aug
 2025 22:29:22 +0000
Received: from YT2PR01MB9046.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ec1f:2b06:cb5c:c606]) by YT2PR01MB9046.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ec1f:2b06:cb5c:c606%3]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 22:29:22 +0000
Date: Thu, 21 Aug 2025 18:29:20 -0400 (EDT)
From: Siddharth Priya <s2priya@uwaterloo.ca>
To: Stefan Hajnoczi <stefanha@redhat.com>
cc: virtio-comment@lists.linux.dev
Subject: Re: duplicate ids in used ring
In-Reply-To: <20250820180705.GB108699@fedora>
Message-ID: <d7aa91b4-73ce-c0fc-aafa-5fac67a8affc@uwaterloo.ca>
References: <b6f972a2-8fe0-4caf-9aa9-2a6b24bf48a8@uwaterloo.ca> <20250820180705.GB108699@fedora>
Content-Type: multipart/mixed; boundary="0-518655061-1755815361=:99618"
X-ClientProxiedBy: YT4PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::17) To YT2PR01MB9046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:bd::13)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9046:EE_|YT2PR01MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d6c5c2-9360-4af2-ea47-08dde1022d17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkJSbW9DUW1yYXhyVFBsUmZBQ2trdjJLSHd3cmVWTTBwT09PdEE0U0Vyczhh?=
 =?utf-8?B?SXJLZC94U2E1ZkxrV3RNQk1SUVE0SzFoaktzRVQxMWZ2eDlHcnVUaXE3K0Mw?=
 =?utf-8?B?WmFaajZiekt5Tk82KzM3NWR5N3VicUxzQnJDMVZTcHZCVDltY2xVdE5MVFFM?=
 =?utf-8?B?bjZKUU1Nako3UXoyQVF6ekI3SXZhRUo1cUVoVlREOTQwMDBLK04vaEp0RGRj?=
 =?utf-8?B?djZxWGIwMG5sTkNZclUyNFlQaXE1aGJCZFBkQUh0U1JYQ1IwSHBvT3VwQXcv?=
 =?utf-8?B?cEQ3ZTRsdkIxSU9rZ240c3FVcG9qdVc4N2dHa0JQdHlxemh2NnFVRkJGVm1L?=
 =?utf-8?B?VHg0VjZLRzNSL1V1cDdxVzNIdTM3cTliaC8xZXc3WitnNUh3L25Nd3N6WDhw?=
 =?utf-8?B?NENIOEhpNkJaTm9zZjBxcEVvdGxySDZkR2ZjcEJZZ0VqYUhSS2lmSXA5SXRh?=
 =?utf-8?B?VU5YRmVsdTdaVGt6bW1IbkY2alZnRytuQmRMaVBNMkVxaVJrL0hUNUliY2lo?=
 =?utf-8?B?UmYzMmFKUDBIWXRTL3V0bFFFN0JzUzJjYU1KMGFlNklFYVo1emFkNWxjcVVW?=
 =?utf-8?B?NFNzM2IxMUpqYzNIZEhlWkxkS3F5ZGRvc0dhR3JLeVh5eTNEYUF3bjBNNlBh?=
 =?utf-8?B?OTVzZER1ZXhXeitQRnZEQnlLWSt4d081SUR6MzFBc0VjNkNLcVMyeDU0bGVj?=
 =?utf-8?B?ZXBGd3hSV0VLWS9TRnEzZUtKekNoNXF3ZURpeE03K3N3c2JNNmtFTUYzK1A3?=
 =?utf-8?B?WUhyaUhwKzBRR1JrcUl5bXhyR3Y2WkovQ0RoVTVadmROWUM1R0w2RDJ0d1A5?=
 =?utf-8?B?akszZ1JRRjMrd1ZNVWJsdERkZ3luT2EvTndrS3diWnhqWXkvR3ErSjZXcHVk?=
 =?utf-8?B?cmpFc0sraHc2eUZwcnR2eHFXNXdycjE2RVNrVHpvNDRuRjRXWTZZZGZ0dTFM?=
 =?utf-8?B?ZFcvWDZueXlhdkFmdVh2a0ZwMW1SK3hBU2x6T1ZXNW1LQ1dxZWZxWG44bk9k?=
 =?utf-8?B?MEtTcldUR1dFbFpacnNPOE54V3RjaW9OWGtMR0krNWpiM1lNRzJKNFQ4YXIz?=
 =?utf-8?B?M1pXbGJPMW82SEZOR3M1UGpnYUhzZ1pTeVJCUHAvYUlQbTRNanBGY1ZMK3hS?=
 =?utf-8?B?cGVvZTc3L2UrYStjODJYcjl3WlhFMXp2UHVrYjFianlzY1pPSEtvZEFvYkJw?=
 =?utf-8?B?YUpjdVNFWEUxQlllUGV3RTBJbXpKQ01Fd2JmUHQ2UDZTS3dmbFB5SU1FN2ll?=
 =?utf-8?B?amxvUjZXM0tzclp1Ykw0ZXlhNmlnY3hzRTVLNWxoVkR6WGNSSVBHTk9UNytY?=
 =?utf-8?B?U0I0YnRSZkJhUjRlcjNpR3RIYUxCTUJGU3d3dUlBdG5CUmEvYjU3aWZzVk5m?=
 =?utf-8?B?dmFUK1NMazNLc1puYkdteTIxZyt6SG84aDBaM1VPdk40TzdGWWpwK2RaWGlD?=
 =?utf-8?B?VHZyeHIyaGNyS1RCelJqVXozY3VWTEVVeU95WmJyRVc1WVN5NnV2eUtCQmRI?=
 =?utf-8?B?LzhRQUR2K0JKM2tXYmZRQis2MVY0clBZV05Jc1RaWWR5RTZSdzA1YkpoME40?=
 =?utf-8?B?dmRYVWRCSmgrWWdMTXFId3RCSFV3cU03TnZya21TR3pwQWczT1IyYVJDOEZm?=
 =?utf-8?B?a1gwVlIrTERnN0hMU0M4QzloTEFNVnZEZk93NGxhMXlrVm9PaHJkVDgwekdL?=
 =?utf-8?B?REoxQzNKeWtwbmI2ckF5bzdESG1uYTBrMGdvQ0pUdnFOTHhzb1A2OXlWVWhK?=
 =?utf-8?B?cWoya2JVaWk5UjVFRmIvZ1J1NlZjUUxmZlVCZFYwYndQYXdJSzA0RUJ2Y0dG?=
 =?utf-8?B?OGE5Rk5hNk14K2NKdDlRQlhmTzE5YzJVVmhwdVhuZENXejJPaXA1WnprUlNB?=
 =?utf-8?Q?EHpr+AnzOLeJx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9046.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGZvTk5FRmRWOGo5WXgvM2xEMW5hb3p1MVJXOVZGUDkvRTB0RFFubnpUam01?=
 =?utf-8?B?VmVPTHZ0OHhFOFVsRnR1UHl5VkY1UGNlMThOOHVKdlBXNEFMZEhSUFlMc0FD?=
 =?utf-8?B?bW9SMXlqTzYzdWxzbDBYQ2lSSXRkMUFINVF1a1NCZFRWZWxLVVhINU5NSERK?=
 =?utf-8?B?dkdpQ1RCTnZKQTZMV2Y4V0hyWjZUWjBtUnl0bW11a2JQdjg1NnVaQWZGZFJl?=
 =?utf-8?B?a0QzTS9KWFVaVWlWL2JLTzVLNmNTeVc5K0pVcDFjUG5LcVJuK3IrNFVvMHBz?=
 =?utf-8?B?VDFWYjkzNVZHelROdGdzSEJSN0hwdS9YdHdIRnZ5UFRscHIyVTJrU1pyQkRw?=
 =?utf-8?B?V3pyeE44elA4WTVqbVlad2JMRmlGdStSRUpxVXYzdVZJNHUvdXhlQlFTRnBr?=
 =?utf-8?B?QnFXRkk2MGZoTG1XSFV4YzVVQ096S0ZodEI4Sndad01hbFdYZTdVUTZGMzht?=
 =?utf-8?B?OVhpdUgrS1cybEU4aFRMbE5DYTJGdnJzMGtubW0rSHVKdWxHanlnR2pPUmF6?=
 =?utf-8?B?UmR3amVUTDdVVWl3clhFUFhlY0pQWnAzL2wzbjdWN21rOU5ucXVuZVQxd0gw?=
 =?utf-8?B?VkJWbCtMc04yTEtLN0tUSUIwRk40VEUyTXdzdm9IRVlReUxlbXJNNUhjeUc1?=
 =?utf-8?B?VGxSTWZ5dytnSForRGE1eWEyS3ZXSW5nVi9jN1oxb2NIQ250L0lla2pKNUNV?=
 =?utf-8?B?Ny9CbWI4UE9jd3FkaHkySTZhZ1llb2tYdFZIeW9XSzNnakdRTjVLaUpIenlq?=
 =?utf-8?B?UkUxcUUya2FodTVOakt1aUNkSnVkYkJPK21pWlV0VVNwL2dhY0VPNjNmTUF5?=
 =?utf-8?B?Q01Db3QvcHdkcW1XQkJtMWdKdDJsSndEN056YWhTSy9kL3YwaXBvT1kzMW5R?=
 =?utf-8?B?OGkvRFBhRG1DRUZQT3QyWjhqT3dmV2I5d1ZXcnR0Z2ZOYzFNK3hrOUsrWlJ6?=
 =?utf-8?B?N1hqblRjRXBDY01OSEJYdEdqY0d4ZXJFVUQ2bzVIR2NTU0ZrQTkxR3dsSFpO?=
 =?utf-8?B?dXFBQWY5SGlXc01LU0xqOEdhaGdwYjVBMXdnQVdNWE5POGJBZHhYZlM4QUVw?=
 =?utf-8?B?a3BsOU1kbEgwODFwUDZUc0RmaXhScEYwYmh4dEhibVFtaVZLZHo1b2JCcW5p?=
 =?utf-8?B?eUNpMkNMQ01ZSjhzczMrbFYvRXhXRjVjaUY3TjB0T3RnSEljNHJyemFLblA2?=
 =?utf-8?B?c1BzcjVBVGhCSmtCS0ZhMWszLzI0Qkp3cGlSeHlZSjl2TFYzVzdVeWlwRWhZ?=
 =?utf-8?B?c2p6UlpWbTBBdlU1d0xFWmFaV2xxdjYzN0w0U1piT01QN1RhTTQ3S0NVeHRI?=
 =?utf-8?B?N2x5aURGcHlLaWZxeUpyVVZNZUZ5ZHBpMkt3d3E1VVk3aTdXVnpHb2RmMDJS?=
 =?utf-8?B?T0s5OXcvWkh4NHZnRTNwSTFpOXVlRG9ZWEg2VitZWHNnb3BKdWpsbUh6WGpw?=
 =?utf-8?B?SGp4eFV5OENFVmtLWHhJYURIS09mUmcwaUxqbDRMWW1Vc3RidVlrUzl3NXFB?=
 =?utf-8?B?T0oyTXFUNzYzSTN0TUpQNU1BbFpFUno0QVpheHJrWGNuOEdMNWFwQ0hZWVFG?=
 =?utf-8?B?U1IxUmx2S1BNelduT1Fvdkp4QUY2dHBaZm1hbVBTdXJ3a1BqOWxaV0FUaXU0?=
 =?utf-8?B?ZS9zOUZMVnVESEhCQ1BrclB6U3Y4RnkvMEFma0VISmx6b3VhK2lwOEFyWitE?=
 =?utf-8?B?UG5hK001eEJ0ci8zYWMvVkRERWJMZzNwNlgxWWc2NUVJUlBxUTBoMGg3Z0Ey?=
 =?utf-8?B?Tm9BRmN3VVcwMS9xelExUjRJU1lBZ1VHaTlKS1lTZ2FwdGY1Z2VIeHYyN2E0?=
 =?utf-8?B?T2ZnOCtSampldndySGI2SHlORVRmcjNsNnM1eVdXT2gzdmpFNnV5Rkp3MzZZ?=
 =?utf-8?B?bHpFZjZXTS9GWWFzbE00TjFsWXFIckg5dHdhTWNEdG9Femxkd0FMSFFadkRp?=
 =?utf-8?B?a3ByRjJGRVl4aFhLOWxkQ00zUXlRMi9qanNmREU2YTFOVmRNSnhxNXdOQlNv?=
 =?utf-8?B?ZzMzN2xoUkZDSW1PR2VOb2dmTkFWV1VlR2s3Z1FsTjlDNkxhUmpjbE5iemZa?=
 =?utf-8?B?V0JZbUNsclhDcTFibTJyMnhuRjQ1WGUwQ2F1S3ZGZThHYUNEMVZMaTArUE9B?=
 =?utf-8?Q?SsbHHMjaSTc3TCDgGz1d0gvuU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7tzzoBR9GcH/KSJYJVKpHERprXUrakTcVvp24HPd8nJFtkIOYGcGSRc+Ag5Eiuz5OcF4g8Gxls0UAjvMfDbkckBGOO5Yk4BcaYQblPX+2WUn+tNMl/MurEbgGaiA62YdtyFXTOcUNldae27lLNPS28cx8scjo30KSwpgM5jVP3ZwEYv7UvbiNuwbH9g2exgkCEV/QsHtCk4KqqtzCRBhgZmQOWi3qH0qBZZygnbO0ZEh/Ns7k3+RssTZGhrSLHjM2P3+IwGMBmoSsh4rJGD51kZEpU7Y5+KUw4j1XFVEjGHYWrQ5qfANQGZ2OppxRqZ/BFkPAsSbJ66ExqlrX00rUkYGhpFxzOVu1nUk8izxemQ7kz253ykyz3JShx0OhkKb3mvxrzfuhbRCqHTXdJ7qME+JHO87IjBOQWNROvypTlX6Se7brXZfj7f0g0t/miZBR2R73N0IMCJEEp+WkWC9Y7bV7jL4q7Gnp5XaislWtLnv2emnj2QqkAdpis9q5rZC44tsDA0YLSApVwzDv/+ntbg+8CaxNYQKQYebNOK9p+PaelfaA50o/qAk4nY/UPCNzOPyMTcwnuOeHTSIilQoTAspebS0HbiqHfDefOQOM3yS3Y/U50IOnkB6plag5rpy
X-OriginatorOrg: uwaterloo.ca
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d6c5c2-9360-4af2-ea47-08dde1022d17
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9046.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 22:29:22.0451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 723a5a87-f39a-4a22-9247-3fc240c01396
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgXVuXIYIrXnUxrYTrZRK3fLQS/iOLSQMOJXS5KxhlxQgWYIGJQu4DNRLzRHJoIYA7u2pwdNUGhPIefjHmMf8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB9416

--0-518655061-1755815361=:99618
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT



On Wed, 20 Aug 2025, Stefan Hajnoczi wrote:

> On Tue, Aug 19, 2025 at 12:14:42PM -0400, Siddharth Priya wrote:
>> TL;DR: The virtio spec does not consider duplicate entries (IDs) in the used
>> ring. Should this case be promoted to undefined behaviour [1] in the spec?
>>
>> Background: I am developing proofs that the rust-vmm/virtio-queue [2]
>> implementation meets the virtio spec. I noticed that the spec does not state
>> anything about queue behaviour when a device adds a descriptor_table_index
>> ID to
>> the used ring that is already present. As a result, implementations diverge:
>>
>> * QEMU (with VIRTIO_F_IN_ORDER): The queue enforces a uniqueness invariant —
>> only one copy of an element may exist in the ring. If a duplicate is added,
>> QEMU
>> overwrites the matching element with the new length [3].
>>
>> * QEMU (with VIRTIO_F_RING_PACKED or split): The implementation assumes the
>> device will not add duplicates, and correctness relies on the device [4].
>>
>> Problem: For packed and split queues, the implementation implicitly expects
>> the
>> device to uphold the uniqueness invariant. For in-order queues, uniqueness
>> emerges implicitly from ordering. From a device developer’s perspective, it
>> is
>> not clear that duplicates must never be inserted into the used ring. Since
>> implementations differ, the invariant is not consistently enforced, making
>> device conformance difficult to check.
>>
>> Proposed solution: The spec could explicitly state that breaking the
>> uniqueness
>> invariant is undefined behaviour. This mirrors the ISO C standard’s practice
>> of
>> using "undefined behaviour" to signal obligations developers must uphold.
>> The
>> term is widely understood by systems developers and would make expectations
>> clear.
>>
>> ```
>> Example change (to section 2.7.8 The Virtqueue Used Ring):
>>   ...
>>   Adding an index into the used ring when a virtq_used_elem entry with the
>> same
>>   id already exists and has not yet been read by the driver results in
>> undefined
>>   behaviour.
>> ```
>>
>> Looking forward to your thoughts.
>
> The conformance clauses (\devicenormative) in the VIRTIO spec provide a
> way to forbid things without specifying what has to happen in the
> forbidden case. That can be used rather than introducing undefined
> behavior into the spec.
>
> How about adding a "The device MUST mark each buffer used at most once"?
Adding a normative clause sounds right to me.
>
> Devices could behave in many different ways that make operation
> impossible and the spec does not explicitly list each one. The scenario
> you mentioned seems like one of these to me.
>
> If it's helpful to add some of them to the spec, that should be fine. I
> think the only drawback is that the spec may accumulate a large number
> of clauses forbidding nonsensical behavior, making it harder to identify
> the non-obvious clauses that implementors really need to watch out for.
>
Agreed. One long term solution is to add pre-and-post conditions for 
functions in the reference implementation.
These could be in comments or runtime checks in debug builds.

I will send a conformance patch.

Siddharth
> Stefan
>
>>
>> Siddharth
>>
>> [1] https://en.cppreference.com/w/c/language/behavior.html [2]
>> https://github.com/rust-vmm/vm-virtio [3]
>> https://github.com/qemu/qemu/blob/master/hw/virtio/virtio.c#L938 [4]
>> https://github.com/qemu/qemu/blob/5836af0783213b9355a6bbf85d9e6bc4c9c9363f/hw/net/virtio-net.c#L1977
>>
>>
>
--0-518655061-1755815361=:99618--
