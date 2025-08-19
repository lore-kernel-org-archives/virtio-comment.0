Received: from esa.hc503-62.ca.iphmx.com (esa.hc503-62.ca.iphmx.com [216.71.131.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA720266B6B
	for <virtio-comment@lists.linux.dev>; Tue, 19 Aug 2025 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.131.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755620095; cv=fail; b=t/VaxOpmM/2Np7MS8RehXF1O0CXRxA8cUC5tlAcDVzOsIixeYsq7o7SNssbDUBi12l0New/Qt0JDEABJjgZIe57+YB9pJvIeptzDZ/XBajMoO/9G1xzOVfc+ieEINyxlPeQiaA4kvjCKGvvwV2Kr1f8a6/DXguZEnXbLkutuZZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755620095; c=relaxed/simple;
	bh=dRUrqY65e9ysZY20Mpcw0UsYhlhMrJY0QD4k6eHi7b0=;
	h=Message-ID:Date:From:To:Subject:Content-Type:MIME-Version; b=fsJ8XojGLGT06U0qKRZQDugjaszZmtdov79sbqjKv+lJSLWFZKXkAcISwVHQhqMhmA4koGdSDsEMgCB60jH7CMw2LPpPTaoFprQ7XV0oKjM2ztIJzAN9qOVA/vekd5JJAg4Q8F1Lf16TzXpgToG2GLhZC5wN9i2bnp0vcwMDTeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uwaterloo.ca; spf=pass smtp.mailfrom=uwaterloo.ca; dkim=pass (1024-bit key) header.d=uwaterloo.ca header.i=@uwaterloo.ca header.b=e54o3yxk; arc=fail smtp.client-ip=216.71.131.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uwaterloo.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uwaterloo.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uwaterloo.ca header.i=@uwaterloo.ca header.b="e54o3yxk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=uwaterloo.ca; i=@uwaterloo.ca; q=dns/txt; s=default;
  t=1755620093; x=1787156093;
  h=message-id:date:from:to:subject:
   content-transfer-encoding:mime-version;
  bh=dRUrqY65e9ysZY20Mpcw0UsYhlhMrJY0QD4k6eHi7b0=;
  b=e54o3yxk8GeZmhGkfmAELZTlgao2ieWSivaRWvk9Yip+08E74EdPLshC
   uI6fn5L3CF/thJMSYQIBx044P+yYb+Em0oNUWKPdM/6QEl1HwPDtZdLYE
   /7VLEeqcjEzJJ74x/3E5WJrRo9GoBUQSGL+8FS2nlasrO2/ZJ0Zh6uSG9
   k=;
X-CSE-ConnectionGUID: pfmV+j1TSQezC9ZYcVy3bA==
X-CSE-MsgGUID: nIi4pe3bSkWYHN8qOy4lJQ==
X-Talos-CUID: 9a23:x3FCyWNRWPSEn+5DQCdiyg0WQ/weS3DP5ybiEkSGGD1jYejA
X-Talos-MUID: 9a23:rBFcwwa4xdDUkuBTsR7t2Clvb81T4JufKGZdiLIX582mDHkl
Received: from mail-canadacentralazon11020101.outbound.protection.outlook.com (HELO YT3PR01CU008.outbound.protection.outlook.com) ([52.101.189.101])
  by ob1.hc503-62.ca.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 12:14:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSGextaAM3IZ4VEVgC5XHNnKWVmQ9eu1KTWuU7yfuRKcbCuPpWHj+9DfzVVprefNbXccnYi1sG3nwcjYUxASAdkvU+YLg3UKYHUe8L7Y5MqLvN1FOfNqOmdiOrSG16di4xQDNaWG1Zg1KlXS8RmsXGkSQeWAwr/oFB6WyG9bWmbHslPv7RXpu2QrOQ7xOBxlatxvyKhdjVYDMsxtTHKSnO1bGLanneXoKiOWUsavT6u/UEcw9FGSLdoifR6PhyErML9b8pxxTxNJtThzoAdTh39qHcDA0HtyqPZ2XTc9TXcg5WUDUP9yEj9RRuQ1g7ciec+BppRpEQRZEPNtb0cOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPsgw4vHxzjHSHDpv1BCPCz8xEDfEXEyuR3ED8nwnug=;
 b=EtljCNwXHG+HBwqVukvhHthAA4WM/sIufplb8O5ro9Z/HWRICGdpDJw5NJqzySfGY3Xg+yjW8be9H2A2TFnWEJ32s262WBTZ4kYhDtpdrVH9e54Ms1iqfM1nIlSIJ+TgqTXeEMkNPHO9MzJ2EzxzUO4OpLm8kMndBd2Kqj/vu4ETM+MviN964546kfuUNEPHayF04l0/vSn8sDAUvLvg9WovuDwXosYgoGQx3lUaYQHGOaCKI2Zk6zAmaT2UAueFxVPIy+11rqmmMYSbI0jRwIueH8+R3kUz//at/vdjrczkv2YducYl3j3UQ4AkykUMbFHaFu1xTnaJCnG+wdOekQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=uwaterloo.ca; dmarc=pass action=none header.from=uwaterloo.ca;
 dkim=pass header.d=uwaterloo.ca; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=uwaterloo.ca;
Received: from YT1PR01MB9051.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:ce::13)
 by YQBPR01MB10998.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:8f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Tue, 19 Aug
 2025 16:14:44 +0000
Received: from YT1PR01MB9051.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::33d1:efe6:28b1:53cb]) by YT1PR01MB9051.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::33d1:efe6:28b1:53cb%2]) with mapi id 15.20.9031.024; Tue, 19 Aug 2025
 16:14:44 +0000
Message-ID: <b6f972a2-8fe0-4caf-9aa9-2a6b24bf48a8@uwaterloo.ca>
Date: Tue, 19 Aug 2025 12:14:42 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Siddharth Priya <siddharth.priya@uwaterloo.ca>
To: virtio-comment@lists.linux.dev
Subject: duplicate ids in used ring
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::10) To YT1PR01MB9051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ce::13)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT1PR01MB9051:EE_|YQBPR01MB10998:EE_
X-MS-Office365-Filtering-Correlation-Id: d7bfd987-3549-4924-3dcb-08dddf3b8245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWl5ZDJ2RURGK0tHYnY0cWZTbFhJdUliSnQ1Qk11TXE1YnZQVVJaMGdFaUp0?=
 =?utf-8?B?eUd2QnVUak1uUFRYNHpLMUxBVVZZWi9ZWmNiamU5U0J6R3dNY1Z0cFBRaGxn?=
 =?utf-8?B?d2pEOExLTlFrcUVMeGtQQmFDSEVzTFZNUDQ2UVJYb0w1TjNKV3FWdkZaTGpt?=
 =?utf-8?B?Zy8yN0ZIK05kRHZIMkV4NmdPTHVQVzBUTDJKSFRzQkxYS1FBNkFPYUlHd1lR?=
 =?utf-8?B?ZEJqbThpM0h1eld5aW9DcTR5V052VlFTaE44RzZITkdwWVVZeVowNm1qRFFO?=
 =?utf-8?B?OS84cVdnWVpGV3VRb1FQY2NEeTBWTlBLbEwybnhpN1I2L0ptaUlSKy9pZDZP?=
 =?utf-8?B?OXFhWFRYLytUanpIM2l0NnRPQUpYYUdtZkhaLzN4WWpQU0U2TlZ1Sk9Rbi9W?=
 =?utf-8?B?Q0dMOFFIRUxuZTAxWE4xU01STkpIWVNTY2NqbDluc1RRbm5IeWloaHVDV05S?=
 =?utf-8?B?Y1JmbmZadXdoSVBZQjg3SGlMUHRCcFJpdHRTLzRlWmhiRHFVNi9UYnFRekIv?=
 =?utf-8?B?L1BrYWRLNUpOclhZZ3VlMHpsa2RsQ0x2UWd4SXA1TGQ5QTdoMHo4bXlYNTBo?=
 =?utf-8?B?VWNLQTFQVmNFNk1zOWFnZGFQREl5dXFhQWsyZVhNUll1am1oTFoxQkhPY0Fk?=
 =?utf-8?B?eU9yajlNcnZUR08zbkFNeWV0QVBCeVhqT0dtN3pzb0JUcXhkS1BiaC9WQWNR?=
 =?utf-8?B?QVBRL082djZMaHlXSENxRnpxb2FDYmdvbU8wdmN5KzNhNWtNRHI0eHF0SGI0?=
 =?utf-8?B?S3pVeGNjb1d1ci9mTXBNdTBkS0NJNGM1dDRkRGhIQ3VzSVpkUUZYRGRLdUlZ?=
 =?utf-8?B?RGI5Y3k0dFN6NFRucGN4QWE1cWlFZ0NJRzZVd1p6YUxPS0dqM1ViQWJuYnNp?=
 =?utf-8?B?czhUNW1zUHJaVDNxZFg2ZlowRGF3M3FtKzdFcm8zY0pHd3FTdWFaTHY3eW05?=
 =?utf-8?B?STNlTnhxWkRBdmQ2VytaenNCeHY2MWlLTDFTRzZXVlIxQ1BSeTR5alpxb0tV?=
 =?utf-8?B?UDJsL1NOanQ4SzhFajNuTWJPVFc3T05rbkhhT2dRTmZ6aXVESG9hdXhSTzRT?=
 =?utf-8?B?UWR0YVo0NWNtTjQwVGFaaXZsT0dURW1EcDhDdjNNYmc4QStheS9ROWpwTGsr?=
 =?utf-8?B?U0ZxWlJLd1F5aGhKNVVyOHV6QS9XaFlXVlFrbkZyd211TkFsb3E5Zk9sL0lz?=
 =?utf-8?B?SXB1eUU0MGhXUUlIWUVsMkFTemg0YzRYNGFTdHNIRDJ0VG1EZEJ0TWV3akw5?=
 =?utf-8?B?K0ZPUUQyS3l0bVdRR1NHYlAydmhSbTZhL01ZbFZHaU45Z0VHaitpRkNoNzJa?=
 =?utf-8?B?TjBCRWVHdUVYaGxZczZ6TFJKdmlvYW9rWWFlNkJNUFp3QjB3K25LaGliMk04?=
 =?utf-8?B?anlMV0t4YjJWTWdQU3kzNU9ybkUvWnozU3pzN0I0ckh6c0VkWTNBT01zdTBu?=
 =?utf-8?B?aklEdUxHbXA2OUhtQU9CR2hOa2FFdkw4TG05dDdPanZ0ekRYMFNKeW9zZDcw?=
 =?utf-8?B?NTAweVVwdkphTE9vL3lIdWlGenJEcW1lN1h2WGN2WG1CMlY0SnNvN3h5c3Zt?=
 =?utf-8?B?RG4vcGo0d0hNd0dHL1BFYW9EWWdFTlh3UU9sUDE5TUtsNTZuamxJa2lZMzkx?=
 =?utf-8?B?ek9xL2VEMGdNUmxDbGRaWW14SjdmV1c0TFlXdGtHaWVBY2FjZFkzYXVqemUw?=
 =?utf-8?B?aHI0ZDRSU2dMZUVjTUlubmxySGFBYVlDc0VHMTVJSzF0amFDQlZEb1JUNzVX?=
 =?utf-8?B?QmlNdnVRZTFaTlZHUFkrVlM4V1BWdjdNK3p5ZjlkWjRuU2c2Ylo0UTBnRjRw?=
 =?utf-8?B?RzY2Mm5nZi91REJPUDlmWDhiNEVHZmJ1L3NGdHc3QU9HYUMzVnJiUVRIN05n?=
 =?utf-8?Q?NyDJ1oUBL6ECW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB9051.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnR0U2VKODJHQkVLZWpXNHRnVEt5RTZBdmI2YWhLbjZmYzdFZDZzVkl3KzdT?=
 =?utf-8?B?L2JLcFdCd1VqZW1NME9OTlpDdXlwOUNWdWtrYzdwc2c4OEpDRVB3QXpLTis3?=
 =?utf-8?B?NWgwMXpwL3M5SjBZc01LenkrZFQ4ZEh5TlBWck1YanRwTnI0VGZ0aTFrWmw1?=
 =?utf-8?B?SjRaWmI5cWxoOWtNN21VQk9tbmR4TjhpTEhrR2FRSUpIVUF3YllrenBwYlZo?=
 =?utf-8?B?cEtRMk5hK2FwOXdLUVh5TG1aeFIzOWxGZWl2dzVvSlhDVDM0OXVtSVRXOHR0?=
 =?utf-8?B?d3VrdXpwV0U4TDR4QytZT0dTOFdUczNLS0l4UkVaenJ0MnBXR2R2cHBLd292?=
 =?utf-8?B?RmE0cVA3WlBGSlA4ME1XcTY4NEtCZldqdVRrVko5SWd0Z2svaW1GTnRUTjh2?=
 =?utf-8?B?aXd2NzE3Q2pSMWFUdFpVamVRVm90aVhidDRFbklVWlhUbS9weDgwQnJnMmdH?=
 =?utf-8?B?SDZabm11cnpMSnpmMG1QNHAzK0NIWFZjSGtqMk5ibnoxYVl4MzBxa2Vxcmhq?=
 =?utf-8?B?QUg2dzF2RVRyUVFDa1k4dmFab1Fid0g2bzcwQ1lrOFM1aHpuODhuTTF2NWR0?=
 =?utf-8?B?b04ySTJ2WTRBTFd6NWlyZHN1bkhhM0M4S0J2K3NHTnM3dWpuTVo1YWx1TkNo?=
 =?utf-8?B?SkRXSk90eEVHYjd5bTlMdHpXa1BCTTVBSWh4Sno2Wm1HbHc5Nk5kTGlRNW8x?=
 =?utf-8?B?U0RmSmxFSVpMQS84bGduZ0k0TGNQd1NpWlpUUnBPR2xvVCtWWW1xaHpDaWFq?=
 =?utf-8?B?N2Vqc1JJNE5QSWNNU1NyaUk2UWlHdFB1UEJpQktRL0FrY0tOM0RkdUhJT0Vp?=
 =?utf-8?B?ZS9JeEVqaWZiUWRPdVdZTUU3NEJvRkVzdUs1WTZqZzJlbmFzVUhKWUE4WlJV?=
 =?utf-8?B?ZTJjd2VqdGNnMmZjZmdXRnFSeW5YekJnVDMvQVBVWi9qNy9CS29NU2lrYzFr?=
 =?utf-8?B?bW9YbFFQKzhHSm1rNDhwdUt1ZkhxSC9UWlNvNDloNjdwbTJTK2NSZXFhS3Y5?=
 =?utf-8?B?T0tFbkJCN1ozb0N2UVUzSHV0VDNBSHJNYUV1S1VUT3YwaUJkcHk4WlZyaDZm?=
 =?utf-8?B?R0o3eElTZXVIL1BpRENHdkdKQXJzdjkwSFNuSGVnY2Z5RTFxbVlzc1ZvREky?=
 =?utf-8?B?U2xETWtDVlIwZzhBNllicnNYV1o4SDV3U2E0TFdoM2gwZzNPckNOdm1hQUo3?=
 =?utf-8?B?REFIZXl5cmFaN0s4M1g1ZUM4dW1OT0hjajA4YUZZc1NyUE5ZQjlwSmRPdlY0?=
 =?utf-8?B?WTRyZmRrV0VIRzBlRzhKRGVLU3ZlTzFpeXNZdzQrT1NkbGgreUJqTWJKRFRv?=
 =?utf-8?B?VW5tN2tWbEZIQlNvK3RhQmtXeGx1Uit5aElHNnduMG5OaXFPaWNyM0YrRXVX?=
 =?utf-8?B?Q1UwWUlBVkVWZDF0cWNscldoM0JiNklpVGlZUFc5cXRTbElJWXlST1g1eENl?=
 =?utf-8?B?WjhwUEJFSE11S2dvVG1BeUo0ZHROTEltRVI1cGlPTUJ0TnZEMUVYdjZUblAx?=
 =?utf-8?B?ckp4Lzh4YkVXV0MrekJBaXNGeHNFeGdOTGZ1OTlEN0NXc1FTTmRPU2JPMWFX?=
 =?utf-8?B?YnI1d3NEbklPRGRpbzZKQTNqZEN4Q0Y0M2lPSUtnTGRkSG5tdzc1YkdtZXVO?=
 =?utf-8?B?d3dZblRuYVoyTlpaVkg5VDlaM2Y3eVVIRkdHaWMwRWJ5MC96MmtXVFdLM0RM?=
 =?utf-8?B?NFFhSEgwdjk2SUNoMmozNTFvR0kwRWZLcUVLRktBWFp3ekl1OERyLzBudk9o?=
 =?utf-8?B?SStjcktDL1VZQmhaVzBWTzRNMTNQdC9UZVJQNVYvcCtUaGJ5VmE3MVhEU1hx?=
 =?utf-8?B?MW5pREsyNXYwQUFyM1VZNndUZzRKNlFiTzNZNmFaNWVwYVBoMUkwYWRkSVlP?=
 =?utf-8?B?d3hNRnBWNys3OWRPaDUzbysvbExUS1NiR2xpbXpvaGpvOExjb3NKSkVjRkdv?=
 =?utf-8?B?cXlCc1JJOXQ0Z0JCQnlaY05RdVZIckFYcERwZjlmejQweUZnQnNkMG9tZkx5?=
 =?utf-8?B?c2RaNFU0YVhSYkNpVEdMR28rTk5objZzeDZNMnRqdk1LUHdtMnlieWE5bGVn?=
 =?utf-8?B?NGZNRlpYd3gwYnVpVTJDcGNBdkFBdkgzd3VnZzA1VzRDNzVQSjBreXoxWWRH?=
 =?utf-8?Q?hrkw0cVCwMw5QFRnhI17kTuBO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TsvOa6YiqRe16H37g9jsMU+Z9xRRxmygS8P/nyrRM2pZNfOKEbPkSlKqlfEtkRbJCGRFulGuVfMpL8sjetHJfOABi58gkTwQfUMarDTXnJ8IbEn5dW7219gRk/pfPOLt3UZaELC3k18LUzAYSFMQTV7lxAkNxSxmsuh3VJto5tR42AbmXbQwtbngZURb6SpF7uXxDd1gIWwHZxQyL9CFC0kyjwpZt9PYp6Nrl0G3J/NLvVPuxoKjG6R9pgnRms2dbrRmS5C0e/0qu7EMWmt7PZGI+7q0D9kJ7EODg8g3oUIBw6F1HXWD77dGlvUcaZ/ajiNcZy56YSU2VABksFd5eVt4ljpGomaVffnpOIkvJOL5kN8T875eL3um1MLQ0a4FeMb20goSkCiJmNNo2tE0AaOFreZDd0CWG4+yJZnNN2opEWBe+4+jWtYxVXE9dOVTmeELNdKeJ0ki8Q9Q7uKfkOHLqKoAEYAQkVvv/LEr3HbAJ+mivRF3qbAFmBS3UyiBmxcr/uCZFPJQlBt5/Q7m++i75ja/yXFMy1ifoyQ2w8sXRFTNuZJw2hzpPi9wdg4gaha1XDpUXzWJwtbgMULqxuh+sXfPzIaQnewsiuM2LhXxBkcmub2PuJlyea46Bh+B
X-OriginatorOrg: uwaterloo.ca
X-MS-Exchange-CrossTenant-Network-Message-Id: d7bfd987-3549-4924-3dcb-08dddf3b8245
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB9051.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 16:14:44.0354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 723a5a87-f39a-4a22-9247-3fc240c01396
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsMh/s+QSWLNTmFGIDrVC6+oLLSClLXmAEU1xehroDMfM5e+49CC6WvMUEsAK957xniILFJgBDzBt26Js32fyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR01MB10998

TL;DR: The virtio spec does not consider duplicate entries (IDs) in the used
ring. Should this case be promoted to undefined behaviour [1] in the spec?

Background: I am developing proofs that the rust-vmm/virtio-queue [2]
implementation meets the virtio spec. I noticed that the spec does not state
anything about queue behaviour when a device adds a 
descriptor_table_index ID to
the used ring that is already present. As a result, implementations diverge:

* QEMU (with VIRTIO_F_IN_ORDER): The queue enforces a uniqueness invariant —
only one copy of an element may exist in the ring. If a duplicate is 
added, QEMU
overwrites the matching element with the new length [3].

* QEMU (with VIRTIO_F_RING_PACKED or split): The implementation assumes the
device will not add duplicates, and correctness relies on the device [4].

Problem: For packed and split queues, the implementation implicitly 
expects the
device to uphold the uniqueness invariant. For in-order queues, uniqueness
emerges implicitly from ordering. From a device developer’s perspective, 
it is
not clear that duplicates must never be inserted into the used ring. Since
implementations differ, the invariant is not consistently enforced, making
device conformance difficult to check.

Proposed solution: The spec could explicitly state that breaking the 
uniqueness
invariant is undefined behaviour. This mirrors the ISO C standard’s 
practice of
using "undefined behaviour" to signal obligations developers must 
uphold. The
term is widely understood by systems developers and would make expectations
clear.

```
Example change (to section 2.7.8 The Virtqueue Used Ring):
   ...
   Adding an index into the used ring when a virtq_used_elem entry with 
the same
   id already exists and has not yet been read by the driver results in 
undefined
   behaviour.
```

Looking forward to your thoughts.

Siddharth

[1] https://en.cppreference.com/w/c/language/behavior.html [2]
https://github.com/rust-vmm/vm-virtio [3]
https://github.com/qemu/qemu/blob/master/hw/virtio/virtio.c#L938 [4]
https://github.com/qemu/qemu/blob/5836af0783213b9355a6bbf85d9e6bc4c9c9363f/hw/net/virtio-net.c#L1977

