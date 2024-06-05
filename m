Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41504965F
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 10:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717584921; cv=fail; b=O1X9k/ZFsTroZnskRl1MGvhvZ9jv7T/JKqtnkwRA3VWg51ooTblgomy4LkqbM4qXfN2lTedh+ZtwO4NZr/op6YeYOBeldAghiKE7eVYGv04Gn+m7TNxkDDPt+WoJQwBqBzwqj2MsdtrGJahyaoscSOLHLjGIzr4lHYhfT0Mau5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717584921; c=relaxed/simple;
	bh=1UePHWUMxYARTE+6wg4SnTEOa+VoQU92mjWUDSp/XmU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h+Ft7kaUSJSoCvmvllUyH3e1C2jQEMXB4hejq1MVgsLpZFS3jM38orC6l1cs0IXJ34hOrHo7fKryy+XfAMVmi5gOqNHJg9gDBG3/oJtOH0z2mWGNgLmJgi0GN6cmpuX7MSC0ys9BzMSph55jTuVt4ru4kA8rbJcnP/A3vceamVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=w6roYJa7; arc=fail smtp.client-ip=18.185.115.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="w6roYJa7"
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.181.109])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id A951D10001169;
	Wed,  5 Jun 2024 10:55:10 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1717584910.275000
X-TM-MAIL-UUID: 78b96341-d39b-45e7-9bf1-366e9bd9f24b
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.168])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 435181004859B;
	Wed,  5 Jun 2024 10:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXQFUh90un/peilLcyIwzoIabb03DNOHt/666AeEWT7tCYFlROoBelaM2HTIjBT2YYSoFTRu0RoxPF7FgIdqPjNHjWeXkOfRKELkzzh2cmH2aJYZ6nCdu0Fl7rdRPJFkZfKbfibC0OvqaoKvPBOXY4JgjiR53JalSHDYpzvNHYCo6O2Zg17D+geEqrKZsBV2LxuEHolwLLzKH6b7yiRsTd7fl3bSaAOpMlvk7l4CdV4EhRNN5j+emU+ntfQhNOGSw33Grk90BcI5FlzryR5TLt9KF4+XbTomaOkJnzmdeV5tlbEBgzI2OweOSQHD5PPIqLVHaAke5XWJwV+OPnjkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScRYul20MQQjAWMI8j0FaGcr78Vid6P2Y6H4jOzxoE8=;
 b=Zy4Ao0utNhNu8C07IzH8CqwhbANEYqtfoxNiiT3SvVvCxcHfvwKUK9dk+p9kpxah4MI0E1SfpinivoBd+JR6bvLK68mvfvZdL63knitJHm9qfnnLulDiBSbKE526ihy5TDAB9Dr0UQHBvrIP+xOoO6w1YLRPSqmIoPI+S/XgI7S9e15HdzmZGDuyxRmyq8rjC7phzRx38UnRrbt9YECv5aUbl/juAk7HxVwIeOEBrDxgU1psoZbavf+pCM/zaiDvaODgzTwkhuReUgw6bd0Vs/J0qeJBvS6m6PqFa01wUaixX+hZVr/ByCLiZRkViLIvwm8U1Bgenj9+pewd1xmkLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <c0464dc0-ff60-46e7-84ac-911a3900a14c@opensynergy.com>
Date: Wed, 5 Jun 2024 12:55:07 +0200
Subject: Re: [PATCH v2 1/2] admin: Refer to "no order constraints" only for
 different queues
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.linux.dev, Parav Pandit <parav@nvidia.com>
References: <20240522174505.57675-1-peter.hilber@opensynergy.com>
 <20240522174505.57675-2-peter.hilber@opensynergy.com>
 <jedmes2fxcwdo3gomq4uggxtnnobuhf5hoccqojsmi7wsjvpxl@r2jdfurg6gjf>
Content-Language: en-US
From: Peter Hilber <peter.hilber@opensynergy.com>
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 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
In-Reply-To: <jedmes2fxcwdo3gomq4uggxtnnobuhf5hoccqojsmi7wsjvpxl@r2jdfurg6gjf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0390.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::24) To BEUP281MB3528.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:9d::7)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEUP281MB3528:EE_|FR5P281MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b17cf78-817c-4d6e-3254-08dc854df787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnIya28yK1EzU0NjYVZjNXhKb2kvb3JGcnptQi9PVGxsdjV3SkdPLzVWOHVR?=
 =?utf-8?B?MGRybzlNeHcyWU9Nd2Qva3JUaDJka2lxUlo1b0hoV1lTckMzMi9mcEdtc3NZ?=
 =?utf-8?B?M0E4bjduZHhmMVpzVmFSak50c2ZjT2JiL0FFNEZTcTk4cEx5SkpNbW44cEJN?=
 =?utf-8?B?U1AzT0Q2WjlkclNmZjc3N1lQNjlLMzdnbFRJeGJOQXdhamJnbHE5UUF2SnlU?=
 =?utf-8?B?ZjdRQUloY01ETUZERmhERFl4QlZ5endaeSs3dStrTktrZE9nWDFmOXMwaGp3?=
 =?utf-8?B?QjhUVFdTZEY1U3hTRjNLMFNPaFVyd20vNXhXUWQxY2NIdVowVkRpOVpmK1lP?=
 =?utf-8?B?MkVWRWRhRi92NW5zeCtzUWtrVUM2cjhTbDhYM1RJVVlkVjVqbWZ6WnBsV2hn?=
 =?utf-8?B?aEp4SlhZR2FJWHZ1RFBUVExEUUl3S05ISlR2eWpiUlZxMzFMMHhWdVN2ZURT?=
 =?utf-8?B?SnhiQnc2QUlpS1VPaHFEcTJWM3V2M2tiTjd0TXZjaWlBN3Zna01SYlZFY2Rn?=
 =?utf-8?B?S3pVc2lOd25QeDJFWHd5Q0pDayt6NzdMSElPTUhEQjBaR3B6R0s4R3ZLN2NC?=
 =?utf-8?B?VFhDTEJvRVc2Wi9yTGdzaUVjbGhuTURSdHpkUzltektHM05sYkhUeEtOSWhK?=
 =?utf-8?B?K2N0b1ZNZVB2SmNka0xmZklHVGZTNG0xb1FsSXdpeVVwNnpQNElTejJOcFlY?=
 =?utf-8?B?N0szKys4L0JIVWRJamMraEZGSFpoUHRib3pyTUNzYllFYUluaURJU2RSalk1?=
 =?utf-8?B?SXA3ZFdCeFlrWTJKRDAwd2ZlNThYeUN6UDBQVUdxbnFDVmQ4LzBKelNuRVFk?=
 =?utf-8?B?ZGR1VCtaQnBHODhOVkZpeS93MUNOQVhPRjBsYjhrYS9kd01yWlp1dW1acWZP?=
 =?utf-8?B?SWhrMldRTG9PN2VkTlhydDZPdlF4TGlvU0ZTQXNFUDZWWnB5eVROWk1CeGpZ?=
 =?utf-8?B?VVUvVXdLb084dE95QjJvcWRMQkt3L0ludnV5NUxWNFZ5ekRnaGlIdUZodEla?=
 =?utf-8?B?bGRzR2RQcGI3eTFTOE5KMWlmMFNDNHVBdE5FaGw1ZVRvZUpWRmVrdmNYajhN?=
 =?utf-8?B?cHIzNUhqV1lVdGJFVmtZN1lPbURhSVJ5MHhBemhpVk50amFZWjBQNjdGd2Fp?=
 =?utf-8?B?Vk80Z3p5Qnh4ZkYvOXE2dWJqRUlCdytiMFJiVGVqOGxGSDc4Nmd4eU1leGJP?=
 =?utf-8?B?ZDE4S1ZjengzeU9hRjBGNTFwL044SWgwUDlIK1RraWdIZkE1a240dktGaVNx?=
 =?utf-8?B?MW8vUStXT0hmbzVFM2FROWRKOVpQcTRQdUdKQWF5b0phTmUra0N5dUx6c2RB?=
 =?utf-8?B?N0l5UFVqWHhXSnFjdE1rRW9xWlZXSVZtYVYrK1ZpM25URWlKRzhXVTgyMGNw?=
 =?utf-8?B?NXNMMXVvRTVqdkxPS3IvM0xwTzl1ZVRrQTF4QUUwaHFqS0dSN1grclp3WWZl?=
 =?utf-8?B?aDRVQk9hR21uUEdPdkdlZmFXTnNNbnU5eUdFY0pIbFpuYmRUckdUVU16Wmdz?=
 =?utf-8?B?Z1doSXlreTZIbWtrSkhXUEdJSEF1SXpvU2p2ZU1LVHZWcGFxY0h6U01FRi96?=
 =?utf-8?B?TjRIUUtaaEljM0RvOFBpeTlWb1ViWFRBYmpQa0ZzdXEzUWdHU0s4ai9JZnU0?=
 =?utf-8?B?dTV0bUtpQUxTSFhSL3p5d3dpaGpaanpSZGpOcHBQbHFDOUc2cXdQc21uTFIx?=
 =?utf-8?B?cTZCNEp5MWlRTzZZYUlkaWRFK09EUFJFTFBmVEthdXQ3azhXYlNuVjU3TTFH?=
 =?utf-8?Q?hjeY2P+hB6xHkSPM8RaJw9dxO+aViIGpMAr/D0J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEUP281MB3528.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTlCeDNWaExxblJhZVQrWWdQN0JaY2w3ckFPeStqWUF4clVzaWpJQTJ0UWtQ?=
 =?utf-8?B?TUhPR2hieUFsRjN5M0lJbnFlN2QwVjlwTWZCSmxnd01lazJjL0JGd0NhbjR5?=
 =?utf-8?B?UEVzd0I5NURPNUc4RmNlYkRoSS8rb2NMS1B3N00rSi8xVVVDQ1BIZkcxK2NP?=
 =?utf-8?B?Ry9GSDN0N1FlNVhYdnBzOEhWb0wwQUJxOGlLVWVpd2J2QjBMTjB5WWE2NVgr?=
 =?utf-8?B?UCtzQ0tKNWFLTnhFRTBTNlkxQ0RKd3ZocmtBUnpOVXUwV2Zhczc0VUJGRzdS?=
 =?utf-8?B?enNNWm11Y1liRzZpRHJkL3JYaE5JdExMOXp2enZuNFBrZ0lKbkxuZ1JTMGhI?=
 =?utf-8?B?eFRaUjRzVENXcHJwd3dSNVo2YjJGbE9acnBZYmFFZnpBbkRFbHJZa0lVaUsr?=
 =?utf-8?B?T0VZTkIwTmh6dmszMEJ5bkpqa1dNTStGc0dZRklPc0greVdURk42VnhmT080?=
 =?utf-8?B?OWh6dkw1RnhVQlhrZ1NTRTc5R3NIRmFRNVpWUnRwYVk2VHd2ZFBGM2JpNGNU?=
 =?utf-8?B?REdwV3RzOHc0OGc4NzRVLzNBd0FZdDNxT0hHaWFLRnFsR055TlZPT3Y0dFJB?=
 =?utf-8?B?RFBwZlpWTlFRLytJTFR1VWp1UTgxOFdFLzlYcnNEYmRzQWtHdmZ2amNQVGpu?=
 =?utf-8?B?c0lBVytJektDS3ZkUEhPdmpWZFczWjVlZTBjc2VpQ1pHd2s1cnhJK2w4Yzhi?=
 =?utf-8?B?OWV0aVZSTzFGTCt5ZG9NaVhJejhDM0M2QzZuOW5iOTZ0QlJhODd0TmxUTUUy?=
 =?utf-8?B?WG9LbFFtUmhzbDBsVStrMjQrZWpEem1mS0lxT2srem9GWEtsZkhjbEpFeEtx?=
 =?utf-8?B?R0RNL0Judm9MbncvU0VIQjFMcGtsZ3BhNEhQV3pKVjNIWGVnNWdTbkZKRXRx?=
 =?utf-8?B?Slhod1pjN09FMzkzb2VRbEtEeWxPMXV1NWF6RFlWb0NJN2dtZG90aG5iTjFv?=
 =?utf-8?B?b3R3K0ttMWJmVW1UUEQzc2dZU1ZkNjZXYUhMYVdwZkVLZ3I3VSsvbkRIZVhL?=
 =?utf-8?B?b0FOcmh6a0hMOTJBbVdWNzRoOTdqT0J1K3VpZlpvZkJOMGRVaGhpS25zaGgr?=
 =?utf-8?B?U3BBQTRCd3c2MkdITGxGbUtBeEpUS21VeVVoNHhrMExNTytHWXBIMTFaVngv?=
 =?utf-8?B?dGtSbzFDYmhEYUNmQy9NSWtKWkxFWXMwdkVacFllU0pBWnFRcnFBVkxIZmlN?=
 =?utf-8?B?TkREdUhPcVdldXBBS3hhREhxUXlHWmxsYWtVVTZVSTB6L2dmdi9hQzBXVkYx?=
 =?utf-8?B?U01kbUNiMU9VeVl6N2VpMUNoTWVuNDdEWGh2NUd0ekV1RWxrZ2tuajU3OVpS?=
 =?utf-8?B?YVhzaDJFVjhBUzZ4alQ4Rk1MblRlaVJRVUxhck9hT2RiYlQxQXY3b3hlNllO?=
 =?utf-8?B?ZjZ4UXdZOUpJQmJJNEV0VW9Oa0lnT09GSFcrUGdHNThNQUxaNndMeEdiVmhG?=
 =?utf-8?B?eTlGYkoxL2RjZzk0Z3pndTJtbTFndTRCK1hVZm12TjlidmRJSFViTVZ5SSto?=
 =?utf-8?B?N0M5WHNlWkg2djl0NDEwclRaYXY1MHJOejQ4c2toUFdnOWt2SU80RXdOZkVO?=
 =?utf-8?B?U09jTEJKcDRpZXZOZmFJYlhHRjJyR2NnUTJVSDBkcTVKTDNCOXlZSTl5MzJa?=
 =?utf-8?B?VjVuZ0xKL3ozRDlSMGNiaFhMdVdqellkOURxTnUrczBXM1FRTXNyTnFxc3do?=
 =?utf-8?B?OW5QbGhwQjIwcE5QQXJYM08rU01iQU5WR2lFZkFMQkwwMlo0VG9VMTQ0ajNQ?=
 =?utf-8?B?MjJEdnBYMFF4Q1dkQzExQVJFaDNaZVkzUXZObHc1d3JrMjVVMHZvSlBFSzZN?=
 =?utf-8?B?SzM4NTN2cHFkMldwR1VNRzlCa3ZNZVlkdXdqaVJHc2RZSmJ4UUZpOEFaemN3?=
 =?utf-8?B?amdIa0d6aVJlWGk0cGlMU0RlU1p3UWZ0czA2eWowZ3RyQTRSZEh2Y0tpRmFJ?=
 =?utf-8?B?R0RqZzdhWEhiVDZ3TkhXZ0dQT3NzZEF4dVRHaWoyVWV4cmxWQzQ2UnM4Ymty?=
 =?utf-8?B?Sk9DRWJGNGc0bVhsUHI0REE3Ukp5N3FKYloxRnFBeEU1dVNLTkdsM0g2SmhG?=
 =?utf-8?B?OFlvaENDaWRPTEhTdldUQjAwMDdxYkdkdjlYRFpDbytjRWVtMDF2b1lrK1pS?=
 =?utf-8?B?VjBrNFl1VDE3SGVwNGtrWUh0RzBLd1JtMUl1ZnQ1V2hPMklxbHdFcmoxUjRv?=
 =?utf-8?Q?dLlwHjMF/PVkO5KSZDv6QPUUhfG0wCCq2ZkzkXgsPsnQ?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b17cf78-817c-4d6e-3254-08dc854df787
X-MS-Exchange-CrossTenant-AuthSource: BEUP281MB3528.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 10:55:09.3223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5pSxPDeNR9vpd3lIwfH1jYaEJ2q0kk4vsrJkdxTrcmaNfisXyBkVTZxNKTstH5XmszQkjHn4UQjkkdV+cHnzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB4461
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28432.007
X-TMASE-Result: 10--10.609500-4.000000
X-TMASE-MatchedRID: vbSD0OnL8/LAzFN6pL4VBAw4DIWv1jSVbU+XbFYs1xJf1evRo91InSMy
	182qkOvSRQ8Ofa3OZqT4Cg/I8TS8O4CdRGPeq0l8eJchdZcr1K2RcfFQRqdB9saGZ3GOeK8WC+i
	yfs1TRXb0LyWcnoQP4cLGMmoq0unLCqzLRV65cMeNTaHnGtld6geATH6uEs3iayFQNyBnwgugxA
	0GvroilFi9eXoQrJQ+hpsqUqlX0wmQURqiNbJXhnOjEKYddvv6D8Sl/mQ97T0PbkwnBlKslJyQq
	eSX8lxhq1OKGmdZqMG+gdYbWVxnYdJc4mUApGkiWj/U/cEOmX+OHiw4jVS3m/D4paoNCOyZ6KEJ
	O7SR6XgkvJFrsDh0h5XWHqKOxvV4nIvMjFUC9f8RLjqoJJt/9frDHrB5YKTLS5sGgNIQnnulQdS
	jBe50pC9h6tejU7UDBJetwkYd1rZxg7svMtapLplOmei+s1mUElEc1Ekertx6jiiSzI6Xg5PtYD
	TOWv+Bmen/eVtqRBE=
X-TMASE-XGENCLOUD: ad2fa0b4-71ba-4394-96ea-00b6d43dfef3-0-0-200-0
X-TM-Deliver-Signature: BDD0345C0B218201C61D2254ABC5350D
X-TM-Addin-Auth: apeTx8/BiT1pVDKTEp6FzN94/hWSFWT0e2/ZTOfl0/53IyZcJLclLR+PTmE
	HjpDY7SkZYooItF2zDds1JIjRUbbVvCN+LFEx8/oQjlLe4/fJ3U+lMlx3cGkOdje/IX8Sb4NnmZ
	2meLk3BuXhc8Lhga+fCt181zj0G2T5Qaswl8LdrXVAq7rnUDL8TWM5X18uP61mMz9WCJpOjO2Bo
	Gv9x8bRB/Ub4Ss+La4wJD3vHA9xXFm5LDQCOH02ZMqUGtO4zugywS1cvQAZWdQT8tcEMwqhwEVg
	U9/IQBaUYZ1arWE=.LSuH4JnaLIQ+IKsdQ2WhCDc0zS4zPn47FRIhOF/uWx6SRCaQGaPtmSMayx
	hv+rL5jkDImeReRlzcDxpiUQGfNm4JFjAWdNpXsiYlDHayts+VDo2ddZGlqG+T2eTJb9XZHQfYR
	1Dg64g+VGJbbbctDrXYQFZMUNljrDG8fEdbp8CgEi71/4B5qaa36aAN0nh7WpkXEGeZDM+IyiU5
	UolKl8wRfB8O798mE/JIX70S9ouyyREPt2NazxuzJdKzZFw3mVoZtPO+HrUkrfUfkCTgoC3gm5x
	0fpdPwdU/UYSisn7C7NX9PYocFfnAsSNYco+J61oT4YMKzmk8An4YiavixQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1717584910;
	bh=1UePHWUMxYARTE+6wg4SnTEOa+VoQU92mjWUDSp/XmU=; l=2437;
	h=Date:To:From;
	b=w6roYJa7L87uT2PH7utQJKKnIIkVRz2aqNxbhH0p03t7GYRZxUvc1PrU5T670abZ/
	 x7gByeUfY8+77g+EWw9n8LeqCTCLxmrNHkWx/kYS3S1y4RtABsEuLlg2RYWkTv97gf
	 mMD1UNbsoUWFOwf13BF0mTcN0XoPhCyZ39I/Q/BcjsRs+qAhHpIN9PtSpv2AHcQoxe
	 H24rBpkpFX3UnpSloeAPhi4VmVFftLLT2SlZEVk984CRYdGtz5dK2fQIchqvhGMnem
	 1pfENPpqp0CcOkzc025OhS6mpgMTndlccBcRki35sb/gbm/JhuNZYMMqiInaicpa0g
	 P+hL4ro8HonMw==

On 05.06.24 10:51, Stefano Garzarella wrote:
> On Wed, May 22, 2024 at 07:45:03PM GMT, Peter Hilber wrote:
>> The non-normative section says that administration virtqueue commands
>> "will be consumed with no order constraints". But actually, the
>> requirements stipulate a total order for all commands in the same
>> virtqueue:
>>
>>     The device MUST process commands on a given administration virtqueue
>>     in the order in which they are queued.
>>
>>     If multiple administration virtqueues have been configured,
>>     device MAY process commands on distinct virtqueues with
>>     no order constraints.
>>
>> Fix this by narrowing down the scope of the sentence to "commands placed
>> on different queues".
>>
>> Fixes: bf1d6b0d24ae8 ("admin: conformance clauses")
>> Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
>> ---
>>
>> Notes:
>>    v2:
>>
>>    Be specific about case without order constraints (Parav Pandit).
>>
>> admin.tex | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/admin.tex b/admin.tex
>> index 0803c269e5c4..fdbf2ac5a93b 100644
>> --- a/admin.tex
>> +++ b/admin.tex
>> @@ -457,7 +457,8 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
>> The driver enqueues requests to an arbitrary administration
>> virtqueue, and they are used by the device on that same
>> virtqueue. It is the responsibility of the driver to ensure
>> -strict request ordering for commands, because they will be
>> +strict request ordering for commands placed on different
>> +queues, because they will be
> 
> Should we use "virtqueues" instead of "queues" since we use it throughout the paragraph?

I will change "queues" to "virtqueues".

> 
> However, out of curiosity, how would the device impose an order to commands on different virtqueues?

I don't know.

> 
> I'm a little confused. Also, the example we have next doesn't talk about different virtqueues, so I don't know if we should modify it as well.

I will narrow down the example to refer to different virtqueues.

Thanks for the review,

Peter

> 
> Thanks,
> Stefano
> 
>> consumed with no order constraints.  For example, if consistency
>> is required then the driver can wait for the processing of a
>> first command by the device to be completed before submitting
>> -- 
>> 2.43.0
>>
>>
> 

