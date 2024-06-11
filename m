Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7CB178CC3
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718100635; cv=fail; b=YN+l1+65ZyeTAByL9Ul+YHmf37wJDxvfjqUJiESjG7LCtsMgl++P1L96DCf8MKpkXBgJ6brcBcFza/pelsisR6bzoD0alK/weh6pQkSh5aEzvRSrLA2DSQww/LOi55ObgkyQjfxiYSYxCCr8z6SXAPkun2byeE2kcH61ilFyw4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718100635; c=relaxed/simple;
	bh=XM86WlXcmYP5y4cy7LBXTyspOlV7BU5wU0BYHMevu+0=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VpWGSVB5l+yN0r6P+F2XOqvxckuxgr8si3BJJDbcvKkkYlFdUB353yqBGP0kNljEsz14VEsq+kxzUow/p+3ai7Nm0zARw8UMfsLFJfeZcYzsCWXWYYr3+sLd3ZLDcgYWAm9F7MbLAARfMjFe/OGB1y5bVfTwKSDGRrPr8yHPMrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=irpLe7pv; arc=fail smtp.client-ip=18.185.115.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="irpLe7pv"
Received: from 104.47.7.174_.trendmicro.com (unknown [172.21.197.65])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 9018E100017AB;
	Tue, 11 Jun 2024 10:10:25 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1718100616.506000
X-TM-MAIL-UUID: ad5d268a-6349-4ab0-9643-158fc84ccd66
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.174])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 7BA5310000312;
	Tue, 11 Jun 2024 10:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBWB53A+SQa+xRYQ6RLAmxsyhKpk48fCxgOlwXVE67Di3pkswtoPDfMNKrPnpvGJFnJMOOr6ypaJQ2ltBaDbl+f0pcpyy2s2Cbjsscm0yEv7wGtFYP/plqjwKDamyMEeTxIst1qaTbfwsaots+KSLKNA2dUw/Wp6iVIY8+EuDbpNWX8IJ+kZYwww+UP1cwNsHNI3vSy0QFDxkV/AS1qHH5JWpVTOKZeQUmRTq/hlpSKnxwvxWkxWV53IYPKfblldqkziK0uPgZQd0mrxPpJ/DX28P8hs4Hs6oTLLkheoCNtfr/xj2TWobvlVu9qLGOmRLQwuE5OJ3lfx+xu02vx4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwQDHZA+27c97ofpilknsQG7hNjAeP4GRXGqpXL9fkI=;
 b=KYUz54W1azWAhmbhrDnZU70SfJ7NVYUfwViq93P9xXGmUklGYJqa68HX2i/NsgBii5CW3Xf4F7peNUTHmHeBTY9h3DkEOiEAiLC7ylFSHXBkLw6W4Kzzke1FC5ZjvGXB8SwbexKAFRwAkQxCbVRphntH/FY+OChARHtHCqU6FkCMeSit3TnQa78MwM7lCi0hmNF3vCy9wjEwTuJUBnWC0pPez0EF8aSPQ8dL2x5A7VxZFXQOEJZeR6+qqM2NBiQBJqobOMVyOosBurxp4x8uZ4kpgmYKb/CnOlRlK3anISa7O0BLia5hm9Zt5EzqiljuEDBjQ5nE0eXWKcH0vIeWPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <21f91356-0ca2-47c9-a659-d73c768717e4@opensynergy.com>
Date: Tue, 11 Jun 2024 12:10:09 +0200
From: Alexander Gordeev <alexander.gordeev@opensynergy.com>
Subject: Re: [PATCH v2 0/1] virtio-media: Add device specification
To: Albert Esteve <aesteve@redhat.com>, virtio-comment@lists.linux.dev,
 Alexandre Courbot <acourbot@chromium.org>
Cc: changyeon@google.com, eballetb@redhat.com, daniel.almeida@collabora.com,
 ribalda@google.com, mst@redhat.com, gurchetansingh@google.com,
 Matti.Moell@opensynergy.com, cohuck@redhat.com,
 nicolas.dufresne@collabora.com, alex.bennee@linaro.org,
 Alexander Gordeev <agordeev@qti.qualcomm.com>
References: <20240607133508.1400529-1-aesteve@redhat.com>
 <CADSE00K5RjuLY1UKfPiAMXv=HWJC3hdp9yvo_t7yr9HqhAVotw@mail.gmail.com>
 <CADSE00Kcc-uVKYkNT-LHX3kQwmhQNLgKp8FRMrWz0hWg+e_c8g@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADSE00Kcc-uVKYkNT-LHX3kQwmhQNLgKp8FRMrWz0hWg+e_c8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::21) To BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEXP281MB0183:EE_|FR2P281MB0170:EE_
X-MS-Office365-Filtering-Correlation-Id: f371a133-ae37-4fad-0bee-08dc89feaeb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|7416005|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eU8rNVk0VmEvVVluZ2o5OG5aM2ZWaTRxYUVIQWxwaGwwTmpVUllneXR4Vzg2?=
 =?utf-8?B?S3RKUFhJSVM3WHR3ZWJQWnV5OWd2S20zZXVlWFdZNHVGUlBla3QzdTBQMU91?=
 =?utf-8?B?aEJ3OSs1cDZIL1EyeDRKOFVwSXBqRWhlbktabTRMN0dYUHE5UWk4ZE5BY1c2?=
 =?utf-8?B?QmZHOEUrWHlzV0RzWWgwd2dLbXd4eWhmUndqN0tieWJONlNES1dCY016Y2hU?=
 =?utf-8?B?QzdpZFBXekJ4clI4Mm9Kd3JTVk9SbGxqblE3TFBxYlVEUEJ4d1JvTnlrNGNJ?=
 =?utf-8?B?NmFRTkhld1hzQjBRQlNoZzR5dHlzY1IxZmtkWnU2L1R0aUNUUGt3dk1RN2VQ?=
 =?utf-8?B?aHA4ajdudzhIK09raEJhUjNWZmhVMGhETWZGTDNHMWhZVHhuTFFwMFhZbUly?=
 =?utf-8?B?OGF6YlNxRG5oUnBQL0h6L0FPZ2wySWplR3owZnFzMUxxNGZoWEI4bG5xRE9u?=
 =?utf-8?B?bkxBV1krKzVVbm9QTFIwWmhaaXRIaGhIL052YU1uazVPZm5wZFB4em4wYnl5?=
 =?utf-8?B?WnhHY0htd0R1MUNvTGJWalNZc0VGZ2ZPTFFOMnZuYXdmVFRJZGZPOVdyaUVa?=
 =?utf-8?B?cWdqa1NFK3RXaVJYVEV0dkllTEk3djFBMS9iV2hCWW8xdHFVWkFaWFpET3BR?=
 =?utf-8?B?VUJLRlluSTd0SDZkTVhCaGhVVUdqTE05WmJvSm1QMWZDRkpsQUVFMTBDRndn?=
 =?utf-8?B?QW8wcFVLNEZlMHlCby8vcE0wR1hMc1hENHg2MHJ2UTgvQkFEQ2I0TUM4cmdO?=
 =?utf-8?B?V3pMU25CYkxRcFR3Y3RMazZkREFKS2xwZ3BGN2Z6Y0VsdkRKUWpZY21JQlh3?=
 =?utf-8?B?QWNRMDBqTVorRGNnRkZweWFWSTdwN2kvR3RVWHJUMGxlRE1HbHgzZE9VVkp5?=
 =?utf-8?B?anQ2aWh1UVJ2SnNjdDNoRmpzTy95L25RM0ZmT0NsY2JXVDV6ZWdwSGZ2UE5u?=
 =?utf-8?B?cFRmSDBhMjlIUEtUSDhnMzVGNStHaDFuak5wSnBpMVVlMHR2a3hzY2hBcEVs?=
 =?utf-8?B?RkhqR3I3NjgvMkZ3aExFMFRmU2FiU1RSbHdGVENQVEduclFEQXozOUdXaE9v?=
 =?utf-8?B?cktlSkoycUczbFFQamZSbktyZkFBaDFrM2pMRXBYTGtKNkdqS0hNTVd3ZWho?=
 =?utf-8?B?N1AwTVhZTmNCSUNGRXRiODBZdC9zYWc1cVlvYzFNTlkyKzZzNzRSdWltUjc5?=
 =?utf-8?B?OXpNSUNnaTNOVCs2WWgzWGdsTWJXSklMOEdoUVBXM3p2TGZVSDM0SXkvYmV2?=
 =?utf-8?B?dnZteUt6VmIrdGlWUm56bDZYV3o5WWdyU0pGdWc1UE4xenRPR2hxRkRQMEFS?=
 =?utf-8?B?OGZVZVRkZmxEZjdyY1Jndk1FNHNRQ0E1VlJ3N0J6OHBzY2ZSWjJKaDhUZDRF?=
 =?utf-8?B?OU0raW40UzFaWkUrcHBpRzN3WGI5T0U2bDRsWGMvQjh1Zm5uS2NxeG1Rb2dp?=
 =?utf-8?B?SWVWSjBZQUtyMSt6ckxjVEJnTUwvbG5FL0hxNGRBTFR6ZjdUcng2VFBQWEFT?=
 =?utf-8?B?bkVXNkRVdlR4eTlsZ1kyQjdtSVF6ckZ4TmhhbTNibWMrdjJKcDNjT0s4UWtD?=
 =?utf-8?B?Wlo3UlpwS016Yy9pTHR1czZBaGxhRHlFTFRuSkgwRURZQVp4dTVSWW1OK0p5?=
 =?utf-8?B?eXgwWTFUZlZVZnQxK0RQU0NSbWhTQlUydVc5TXVkdmtWTEVOcEpKQkZnVzdE?=
 =?utf-8?B?SkI4ZG5XREdiT3JXNkNZL0F6eFJsU0F4WkVHYnlpYUJoTEp4UkxONVZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTN3Nk1ETFlUVEV0UUlxRm5veVo0TE53Rlk1RTNWQ0NaK3EvejM0QVpGQUZF?=
 =?utf-8?B?dGJOYTcyT1NrWTA5bzBkSkw3eGVWTjBrTHExeE5ic2NmL2ZrekwzTEVpaHZr?=
 =?utf-8?B?NEZjMTdtL2c4WHQxcG0yQWE2aFRmZ3J0T2JXcEJuZ0ZmT0NCZU04Y2gxaytW?=
 =?utf-8?B?YkZJRlA1QkNsa29vVUswZVFIcTlMMG5keDh3QnNzaVZFdkhqOUJJTTdJNm9m?=
 =?utf-8?B?ZDQ1QXBHZGczQysraHpzUnhNWVRtcjh1Q1dEbExvbTEwN3h3TERNMUM0b1Fj?=
 =?utf-8?B?Zlljd3RzeUZtcjRXVmlPeTlSenZ2Um80V2N5NWVkSzd5SHhFU3IxenNJUFNX?=
 =?utf-8?B?aFBLVFRaTFpQUGdhLzNseG9ZQjFkb0Y4eEJiZTdLUGJMdkZVYnQwM2xSMmJL?=
 =?utf-8?B?ZWdQSmZ4MnFCUStRbWMzUTZEbG9nbUJGOU1GM2JIZGtVUUpsY3VQQ3F5d1U3?=
 =?utf-8?B?bUE4dDE5dC9mL2c2RkpZTVlwMTEzRUNyUkhQcTlFUHNvMnZReFBHL1pndk9y?=
 =?utf-8?B?aWtQdThYcDVlOVQ1emRtSmRRNmQ5bmpGRTlrSkRMQ1hBWFlHNmFxb1JxT1hG?=
 =?utf-8?B?Z2JGQjh4VDBiU2gyV3lGMmsyQWN1WVl6THZvcFVLMGQ4eU5NMXlDS3NxaU1v?=
 =?utf-8?B?MmNKSm1oT091VlRmSjQ1NHZpOVgvSytFTXpBa0QyRWZFbWl3YzVxQ1BjbXpW?=
 =?utf-8?B?czFSS0hPSDg0MHNINXM2c2x0ZkVuSW5QS1NmYkMvQlhObWRmdkR0VmpveXVO?=
 =?utf-8?B?NjhrUnRycHgxdHN5RnlRb0tWbERNMEhqVllCeU5oc2pKSENqMm04MTVydmJH?=
 =?utf-8?B?WHEycm90eHN3ZWM3bUJteHNGeTI5KzlxZ3dNU3NTRFliN20rT1FTMElOZmpx?=
 =?utf-8?B?b3lidDN1Ny9CMDhoMHh5YXpnNGpuR2dBdysxNDM2Q1lVNmJvYkVIb1VnSmZU?=
 =?utf-8?B?TVgzM0w0K3VqSTRhQytoeGlWNnRRUUpuRHJ1d3U5RXZwNWRXa05MQmpGaE9W?=
 =?utf-8?B?cDJ5b1ZSa0xRSkFaS0RqcW1PS04rSTA4UUR5aUs5UUZYaFhBeWl2bk9aamdZ?=
 =?utf-8?B?cXVRbXBneEtLUjlCTE8rK0ZsNmZ1dFl3OWxSSURBMElnNk1obnFYQWI3dUNo?=
 =?utf-8?B?dlIvazBXS050QVoyZWE0ZlB0TDhoaWM5bEJYdGg4QkJmREFEcm5nSjA0Z1RZ?=
 =?utf-8?B?WjNvbDE5aDZVbEVVQ0QvQmllYnNTMVpWQmhwUzAxOG45Rm1XZDlFMmIwUzJB?=
 =?utf-8?B?YXQ0NzBKVnhFSFcvNzFPQ0YwaG5VK0ZYanBZMU8yTnQ3L2Jxekt4c0Z6TWlv?=
 =?utf-8?B?cHgzWFV5Z0ZmQTZLR3JEL0hNeVZSQVpjbVpSaEZXMjlidHRlWFRQT1VCOVpO?=
 =?utf-8?B?c3hYekpTQjd6elY5OXZPWXU1N2I2aDBEVm5IaktlWFQwODl5WEFqUzJhb1hU?=
 =?utf-8?B?SVF4dDUrNGJzZHhSTDBLbFlhOHBJRHNqMlpYZEtBZUlydW1ZS0FiUUMvM1lL?=
 =?utf-8?B?R3B3UHNqZTh6UHpTa3VKRTgxc0hxQThrdzRIVHJBay93cEg3dlRHazZtbzZi?=
 =?utf-8?B?M2J5QnR5UU5IWC8xN1AyTG5kTlNOQ2VyMUtTY05KMnphb2ZUZG1Qc21tNlAv?=
 =?utf-8?B?OHRQNFY1T2FNZVI2QkJQZmhjSWNZK05kdDFiRmIxaWRFclF5aWxWdkR1a0U4?=
 =?utf-8?B?aVF3WDJZVytDeEN6TEtIV0hGR0hlN04vbzdsZXBmME1aZzFuL3dTckhzUURq?=
 =?utf-8?B?cTdjdmxvZndFWGFLTWJXUkJ0dTdzd052SUFZSVBwV2JvNzNqa1Q4WU1JNGpq?=
 =?utf-8?B?NkJrRU9XZGdDcXNQQ0xMVGp5MkdmZ21id3ozLzZHZlpBVDJESm5mSWhERzNl?=
 =?utf-8?B?a3JFSkMyVmhWNlNBSkZBTVBkN0NuSDZVU1FFRXFqVkk5a0JzNTVoZ0s3VlVr?=
 =?utf-8?B?S2dBQUQ0UlJYMEdScFJWSERRV2JLWU1yKzZXZ2h0MWRwdkNrbHdWV21vZU5X?=
 =?utf-8?B?eDQranF2YnJmVzFCZ29RRTVvVi9UVmRpS05ibmpmangwQTJzVGJaNTh1a3RY?=
 =?utf-8?B?eEg4ZEJCbExUN3NVN0JKTG5uOFk2YlNqeHRjWGEra3V0T09FMkFXR2RQcnJt?=
 =?utf-8?Q?1KG2FCv/iigW8DWHlEl/EOkxW?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f371a133-ae37-4fad-0bee-08dc89feaeb8
X-MS-Exchange-CrossTenant-AuthSource: BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 10:10:12.8126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCiLNOHbFndoZS/Sc5Y3hRmvRimaOhC2qdYEAq5yYF1990qyA4ATsaKxOl4CEBzY1xvC8spu/eL+/0O43zdmeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB0170
X-TM-AS-ERS: 104.47.7.174-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28446.007
X-TMASE-Result: 10--31.968500-4.000000
X-TMASE-MatchedRID: F3+qgMqW0mjEeENaa6f3ipQ/7SF2k7HSDDgMha/WNJVtT5dsVizXEmQ6
	8uvIXW1et1APveIASG3vYJak0RJUxw5SUMZwjKbG74+fgHHc1auB7KF1cYE+v2txVUHuXeM7kFW
	5vh2vIHea1mkZKpmCWc1d2kIvnhPgj1KclCv3JuCiRRlLvgq6cQJCLBvbqknu59KGlOljPvuYdS
	+Ejz6sYl71pXn4zWPzNMoo72Ta+qEjqYdaW8/3vjAXtaS/K6C0Sr+cp4/vPz2WzpGKWacixM8NE
	ee6WY0A7odPl3EMwghr4I4pTWvHspPUWs48YIZH0fEwGdG8tx4Wd/c/Vdyl4GOKEs8foflONaaQ
	sf15i58JZ8bKkznFds5lZ3LpJTH3mYGJ1ru1xbK4fmCMI0rbAfsIJ9FNjq1IxgiPAz8l1ftHR2l
	d6S/pSaumPuzPINuKMusAEehbNyJdybk6PefGSlei7Fq6pZqWWGSYKNZi9aVS1vM/0iAx5T7Qn1
	lMCQHYeP67MLlvTVv3hvTkPj6q7kfvSokBgSLMaroq2fxRivVoawTQgfnXC1O5Jpn8oJ4ziWjL3
	UYH9kQhiIPh6+O2xXorxRU2ZbH1zjkgnWDMIz13Di2jZb1Y9B5DtycMKPBk2Ae4dEJm7k14PMDk
	yRelrPyphej11L0he5cGRexguoTWOBvjmoiJUlGySNoYMxCekh0LRDkkMBzKICKMKO5WPVR9c2W
	IQnIjLQx5cStQEwaiWUArLmVkh6c6FwT3Jn1FxZnlpJ7gQ8CdYRN1L2Va2Dok3jqw+x8wtRmafR
	p5FPMMrMnMiN4vY/6PGJ5l13V8LpPeCOcVNAzCW4/KwZwvWmsCVKm5hjwd2j7jyCKpnCcCFYY1V
	LKzEL+mYZVOIbiG0PrEu9fgzghrabTbV4Kt2llks+Ha40i4YppqMItbEgPjZrmGw5xz1ag7Zo5U
	OBRpoli4ZoiOHT/pP8tMOyYmaA==
X-TMASE-XGENCLOUD: 1370072d-b191-4789-afee-2397edb47aa0-0-0-200-0
X-TM-Deliver-Signature: ADA55AD312F5DECA293E45C5F544B07F
X-TM-Addin-Auth: VT1Cml76le2O97VLelt/A/4VlXkhssgGxrlCNmYx65S1shkdUS7MnCdQOay
	ATehL0PK0B0UY0OIrMOxwWbJmyuLD11TmXlCrbHE3MoLXOt6BXaFHs8Mtby0PlpJPSYefOuZx25
	DgkKPVp1IG1ZlWyvD0gu0TM45AmnjQauVCQ1FPlYc+Q+KqpNBej7OzW1ICu7MreWjEOLSZI8D19
	6ycedQ/xp70qOzioikNrcoiFAUki9CgeQ8GOgXiy2tOM7Sb9E6OQIyxgo7mNM81OYM82JhXmxiP
	N8MeFvce4nKgJLs=.RZcj9uXvuOUY32xj6hpII4oOgr4bablkugHCCi0GvyFnFfPaEITWFLhvMg
	QagNv7Aw3xMMa/mkNuEwMPWpXXr+H51N7hIxA2z2BoCJFGX2JyevvWF2POe8EbpD8AB1NyeIFT1
	ph+4rnLqS4jSPvAOy7WPXopIvN4svzjvh4IHvQuaVFA0gLKkg9BSIwM7QIYtx4s2qh0LV0ORx0+
	U1PvN7Ymq+PtD3vECDajUJtvVJk6pwRPLFqnKVpl9KKmIENQQpLGE6kyRIYVunPZLrs1Whdd1HN
	xW0LsEtOm8BMLBc/GDow5/5HDpG1s49RfI0I3I9C+CMTW5PpHjdsX8rbdjw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1718100625;
	bh=XM86WlXcmYP5y4cy7LBXTyspOlV7BU5wU0BYHMevu+0=; l=11958;
	h=Date:From:To;
	b=irpLe7pvN9DGdlwL5QioDSH+UDXW9mDQ+IvxQcCyIeW7x8PcPiqz2fVJRkqiMHNS4
	 wyJUTEUnFUE6GTe83GeOZqBfWCEqRSaVC37yU8TOtfGa0Vpgkx9DimY+fEtGwewok9
	 NIyc3u1OTR2jXMJrAOyjjKYPxmKFkSowJmOYFze581aRqhuNawGrbL7kRU9mJM0Be5
	 Lciu9gu/OkNQRMBSynXBSD/2flh3xdFhOgBYxXC0soT+YA+XdOr5s4yN1mlVIDM/Ib
	 GhqKAxrHXHSEWdAtfNAy3XYneJfVIi6kjqZ4soR8DkmcRjDpJStFdAGfrJeaHWuaYU
	 nUwTMH2Gp4uMg==

Hi Albert, Alexandre,

On 10.06.24 11:24, Albert Esteve wrote:
> Just saw Alex Courbot's point-per-point response in the previous thread.
> I'll link it here, as I'd prefer to move the discussion:
> https://lore.kernel.org/all/CAPBb6MW36YaZFaWgksePQ=fMC7QffJD6ZpHN-iSzhLYp9Ho0sg@mail.gmail.com/
> 
> Again, sorry for the confusion.

I think I'll quote Alexandre's email and respond to him below to have it 
in the new place.

Replying to Alexandre:

On 08.06.24 03:50, Alexandre Courbot wrote:
> On Fri, Jun 7, 2024 at 10:29 PM Alexander Gordeev
> <alexander.gordeev@opensynergy.com> wrote:
>>
>> Hi Albert,
>>
>> On 07.06.24 10:00, Albert Esteve wrote:
>>> Hi,
>>>
>>> This a formal attempt of including virtio-media
>>> device specification.

The thing is we already had a long email discussion. Unfortunately it 
didn't help to reach a consensus. You asked Cornelia to organize a 
meeting. So she did, there were a bunch of virtio and V4L2 experts 
invited by her. We both had an opportunity to bring our own experts to 
the discussion and to present our points of view. I presented the same 
arguments listed below in this email.

I clearly remember, that all the experts told you, that you're going in 
a wrong direction, if your goal is standardization. I don't know what 
can I add on top of this. I think it is time to take the opinions of the 
experts and these arguments seriously, and stop pushing.

Has anything changed since June 2023? I don't think so. I promised to 
continue the virtio-video development, I provided two drafts. I think, 
the last one addresses all previous comments and I'm myself satisfied 
with it. I'm also working on the driver update, I've published some 
intermediate results. You promised to make a downstream specification 
and implement it, you did it. Great, everything went according to the 
made decisions so far.

You know, virtio-video is not a toy project too. AFAIK you can literally 
go and buy a mass market car with virtio-video on board since 2021. So 
our device and the driver are in production for years. Yes, the driver 
is based on draft v3/v4, there are problems, it needs updating. It is a 
work in progress right now. I hope to bring updates within a few months.

>>> Virtio-media came from a discussion on virtio-dev
>>> mailing list, which lead to presenting virtio-v4l2[1]
>>> specification as an alternative to virtio-video.
>>>
>>> Later, virtio-v4l2 was renamed to virtio-media[2]
>>> and published through:
>>>
>>> https://github.com/chromeos/virtio-media
>>>
>>> The repository above includes a virtio-media driver able
>>> to pass v4l2-compliance when proxying the vivid/vicodec
>>> virtual devices or an actual UVC camera using the
>>> V4L2 vhost device (available in the repository).
>>> Steps to reproduce are also detailed[3].
>>>
>>> There is some overlap with virtio-video in regards
>>> to which devices it can handle. However,
>>> as virtio-media will likely be the virtualization
>>> solution for ChromeOS (already landed into the chromeos
>>> organization) and possibly other Google projects for
>>> media devices, it would be desirable to include the
>>> specification in the next virtio release despite
>>> the aforementioned overlap.
>>>
>>> The device ID in this document differs from
>>> the ID in the virtio-media project repository.
>>> And it will probably need some discussion on which
>>> would be the correct definitive ID.
>>>
>>> Full PDF: https://drive.google.com/file/d/1pNCFP06VoV8Zuyx0aDVQ7HAT4xp-pZ0a/view?usp=sharing
>>> PDF with the media section only: https://drive.google.com/file/d/1sn3NUUeCm46zVyJKHkpytTIgGw1fUt5T/view?usp=sharing
>>>
>>> [1] https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0
>>> [2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html
>>> [3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
>>>
>>> Albert Esteve (1):
>>>     virtio-media: Add virtio media device specification
>>>
>>>    conformance.tex                           |  13 +-
>>>    content.tex                               |   1 +
>>>    device-types/media/description.tex        | 578 ++++++++++++++++++++++ >>>    device-types/media/device-conformance.tex |  11 +
>>>    device-types/media/driver-conformance.tex |   9 +
>>>    5 files changed, 608 insertions(+), 4 deletions(-)
>>>    create mode 100644 device-types/media/description.tex
>>>    create mode 100644 device-types/media/device-conformance.tex
>>>    create mode 100644 device-types/media/driver-conformance.tex
>>
>> I'd like to add some general considerations:
>>
>> 1. virtio-media device capability discovery is very chatty
>>
>> V4L2 requires potentially hundreds of system calls to get the full view
>> of the device capabilities. This is inherited by virtio-media.
>> AFAIU V4L2 developers agree there is room for enhancement here, see [1],
>> [2]. Also I've been told VIDIOC_G_EXT_CTRLS/VIDIOC_S_EXT_CTRLS were
>> added for similar reasons.
>>
>>   From the point of view of virtualization developers like my colleagues
>> and me hundreds of hypervisor "exits" are excessive and costly. It can
>> noticeably increase boot times, which is something we fight against in
>> automotive. AFAIU other virtio developers agree with this, see [3].
>
> There is a simple way to mitigate this: allow an arbitrary number of
> commands to be submitted by the driver with each command buffer. The
> host processes the commands sequentially and stops at the first error,
> if any.
>
> That way, when enumerating formats, the guest can place a bunch of
> VIDIOC_ENUM_FMT ioctls covering an arbitrary range 0..n in its command
> buffer, and get all these formats in one vmexit instead of n. In the
> case of a video decoder supporting 5 input formats, all the formats
> are enumerated in 5 exits.

I don't understand how could you end up with a fixed amount of vmexits. 
When I try to count with the batching as you wrote, the results depend 
very much on the amounts of supported coded and raw formats. I can 
easily have 50+ vmexits on our hardware.
And of course it only gets worse with the encoder, because you have a 
lot of controls to query.

> Having this option could also enable other optimizations, like the
> guest being able to queue all its CAPTURE buffers in a single vmexit,
> although I doubt this would result in a noticeable performance boost.

Queuing of many independent buffers is already supported by virtqueues. 
You can simply queue a bunch of commands, but trigger an interrupt only 
once.
The problem with the device capabilities is that in many cases you have 
to get the results of the previous command (batch) before you can submit 
a new one.

> But at the very least this should address concerns about noisy
> enumeration. I haven't noticed any slowness due to format enumeration
> with the current scheme, but the option is trivial to enable.

Well, I discussed the hack you mentioned and other ways to squeeze V4L2 
in virtio with some very experienced people in my team. Everybody says 
this is simply not the way how it is done in virtio. I think we both 
heard the same thing in the meeting a year ago.

>> In contrast virtio-video has been doing this in one command from day
>> one. Yes, the data was incomplete. That's why in draft v9 I added TLV as
>> a way to store all possible capabilities. I hope the linux-media folks
>> could take a look on it. Maybe this is something, that can be adopted in
>> V4L2?
>>
>> 2. virtio-media has a hard dependency on V4L2
>>
>> There are certainly some "patches" on top of V4L2 in virtio-media, like
>> the representation of the extended controls (which actually looks
>> similar to the representation of the controls in virtio-video) or
>> VIRTIO_MEDIA_EVT_DQBUF. But how far can this go? Is it OK to add your
>> own ioctl ids in virtio-media?
>
> virtio-media doesn't add any ioctl ID and the extended controls use
> the same structure as their V4L2 counterparts.

Have you considered adding an ioctl ID to get all the device 
capabilities as a single blob?

>> AFAIK the linux-media maintainers have been overloaded for years, see
>> [4]. Would they be happy to deal with the additional requirements? Would
>> virtio community like to have a dependency here?
>
> The burden of having a couple new events in virtio-media seems lighter
> to me on the V4L2 maintainers than the one of having a whole new video
> protocol to maintain.

You've always wrote that virtio-video is the same thing as V4L2, but now 
it is a whole new video protocol all of a sudden.
In fact virtio-video allows to use the controls from V4L2, for example. 
Also the general flow is aligned IMHO.

I meant the potential new requirements for the V4L2 UAPI. I think it is 
a much more sensitive topic compared to only one of the many drivers. It 
is true, that the burden is going to increase in any way. But I wouldn't 
try to speculate on this, I'm not a V4L2 maintainer.

>> 2.1. an example: format modifiers
>>
>> There is a patchset aiming at unifying V4L2 pixel formats and extending
>> them with DRM format modifiers. It is now at version 7 submitted in
>> 2023, see [5]. The first version was submitted in 2019, see [6]. Not
>> merged yet AFAIK.
>>
>> In virtio-video I just added them in draft v9.
>>
>> I'm absolutely not trying to criticize here. I just try to highlight
>> that there is a lot of legacy and the process is painful. Right now we
>> have an opportunity to design a new API according to the current state
>> of the art of the stateful codecs.
>>
>> 3. uncertainty with cameras
>>
>> AFAIK there is still no agreement about how cameras should be
>> virtualized, see [3], [7], [8], [9]. virtio-media provides support for
>> cameras in a specific way, which might not be desirable.
>
> There is definitely an agreement on how cameras should work on V4L2 ;
> and thanks to that you can operate a camera using virtio-media,
> *today*.
>
> I'm sure the virtio-camera specification, driver, and host devices
> will be very impressive once they are released ; it's just that I
> would enjoy a solution, however imperfect, within my life span.

Well, you have the solution now. Nobody stops you from using it.

>> 4. (minor) is it possible/hard to implement the device in hardware/on a
>> micro controller?
>>
>> This is something I thought about recently, there might be a use-case
>> for it in the future. One of the concerns is that dynamic memory
>> allocations are IMHO inevitable in virtio-media or virtio-video up to
>> draft v8. I think multiple virtqueues in virtio-video draft v9 would
>> help here. Not sure yet...
>
> V4L2's MMAP buffer type has that covered.
>
>>
>> There are also other minor concerns, that are probably tolerable.
>>
>> [1] https://lore.kernel.org/linux-media/20230922100303.GF19112@pendragon.ideasonboard.com/
>> [2] Page 6 in https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Hsia-Jun%20Li%20-%20V4L2%20M2M%20EXT%20API%20enhancement.pdf
>> [3] https://old.linaro.org/blog/the-challenges-of-abstracting-virtio/
>> [4] https://lore.kernel.org/linux-media/4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04@xs4all.nl/
>> [5] https://lore.kernel.org/linux-media/20230206043308.28365-2-ayaka@soulik.info/
>> [6] https://lore.kernel.org/linux-media/20190319145243.25047-1-boris.brezillon@collabora.com/
>> [7] https://lore.kernel.org/virtio-dev/87354dtp30.fsf@linaro.org/
>> [8] https://lore.kernel.org/linux-media/00f53c06-e66d-aa46-ca4f-c3baab6cf455@xs4all.nl/
>> [9] https://lore.kernel.org/virtio-dev/CAAFQd5BrhDZtFX3vdhBVSLXthe8CykYsZzVQ9ddZxVNvNS3ArA@mail.gmail.com/
>> 


-- 
Alexander Gordeev
Senior Software Engineer
