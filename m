Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2131A1EB3D
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 04:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719291132; cv=fail; b=tCjYyuEvB5p+x4m71EA0M42xvIkqvEXmw2i51Ly7cqSgJOHtSLoOeWg81aQCR0vf3V8P9+k4QinaMGMxFARd9d3Hnvzm/RKeov1L0dGwbbYCK1wPTJVs3Q8qcxDpWvErEUVyztwglpyn+F0idnB7okx8bqf18wN643KlroGMpzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719291132; c=relaxed/simple;
	bh=NhluxJfBwDDOfhzw7d2pFJ/r2dO7SlLGuqKzotPF0t0=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=duyVPB6rrg84+c0AUcILylkFU5KdmtXcLpGkRjJBQ9SaWDnpg2MmigVZAiSTRP0OgDeTKvZBN6Gxv0q6c2w4BpVxsTOSUivrGxSspM9ZSEsRBiXqhxHJAwVui/NV/R2hoBJ5PzjqCqc6KX2nFbjLfXftpky3bzIDcHNOVm7ochg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iEFDt74M; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tqFBtQ0c; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iEFDt74M";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tqFBtQ0c"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OLZfbA023356;
	Tue, 25 Jun 2024 04:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:from:subject:to:cc:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=6zMdyw4uO9RzEDRNo27OyA5MmsEZ2VlWCxsQKJpofGE=; b=
	iEFDt74MAEZgrDOfOcjmAgd1rpJk0KSaKio6WGMY8HbNyo+4qj87WhAxXLUgCO00
	3VhgKiT7ae04LnMV/VgZ02tscElTlsZGm+i3mGyClnvBxoggOSqctp4Iz8uMWZn4
	V7RkugxxcFX5sCCu/FQpQ2sPemkiB4BSN4i3NFnDFyWXWc7iZCWcwmgT/B5O0lNV
	9EWQ1p8Z1JbVlmZgLlgDRNlPsyIXRtTrrBqGQVXiSzkPHUHjc/j1fE8BXsvcqivB
	2Wr1yGBgMVeKNhhlxUoUTicjNEtnE5Fyg9T5G8UqJc/Ku2KC68LKAiE9ISoyZLHj
	Uu8yK9JHENW3zHkp9D6ZYQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywp7sfsvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2024 04:52:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45P44crk037036;
	Tue, 25 Jun 2024 04:52:00 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn27d3tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2024 04:52:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isFUePCKeAhNtdicD2Jq6+Msg8gm/LyQYwltWvofqn7+it/yyX5XNX+cDAwypLtWar1bzyKLzVY8vFpUOxzRPjk2xmkw2CkxY5CxV1qvxyHxKPOF6kbWKxkRRvbnFmlzxzFYCjcNJAfCIjPJfOVzRRBmmLvDRYVbZR+80cq7gOC0Ef7JisiQ4rERPrco7W1QM4NP5oubfRJ/ymEHyvPd4mVIP9EbAMURlRskJVKG8i76RH5LNOdml+wX8z9TUyRQBkjqqui9k5DYtuBw+0I2EQwNGjREzvKIlQz9/MGxO4U49TIEWjPL1yFOBRM7q23pQAF72hHHSUDgB3YnU8tJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zMdyw4uO9RzEDRNo27OyA5MmsEZ2VlWCxsQKJpofGE=;
 b=HNemuqLWJxgrm5l4IfYpVt9dwkpdN5PNgpjL0R/rKGTfagk0A1YXbMGMfvA6OpzgW24imXAojFHohyOG2oGKr8QVipqIGrZizBY6cdHBq1vEkViDzjMTJLbleE6LuVlRKUfhgsdwxS6rJH8NBCsjvNDKVGdur6gt5IzfsHx5UMMp2oPmORuEtxsiomxAMKnz7EzMyle+h45eltGeyq+4to87k4xRbzxufJSk2mwjQHqywTvImBqSzbydfwM6u67rRLIELZ9gVqbBgZocH+RaTqX/MsgJne3Hafm5S3AuC32jNGeWQtlNFqJX0QdD2EkrhrrAP1B+uIjxmBRxcjJRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zMdyw4uO9RzEDRNo27OyA5MmsEZ2VlWCxsQKJpofGE=;
 b=tqFBtQ0czOhoRbTPEDByhSF4BhI+Vp0H+90F/0WNffy2DYE7LxmjnXP6/FhCWI6cSkzcbHYYPPka3iJrRa7MgDkA2dKtQ/oay1uIJEGxP2TTWieNZkh4WIsdxDj3xFNqJB9jOaNw9L4gYkki/5A6f6butShplVgU/XwK3TA89uo=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by MW4PR10MB6394.namprd10.prod.outlook.com (2603:10b6:303:1eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Tue, 25 Jun
 2024 04:51:57 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::424f:6ee5:6be8:fe86%6]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 04:51:57 +0000
Message-ID: <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
Date: Mon, 24 Jun 2024 21:51:55 -0700
User-Agent: Mozilla Thunderbird
From: Si-Wei Liu <si-wei.liu@oracle.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com>
 <1717814062.4461155-1-hengqi@linux.alibaba.com>
 <20240610144602.57a04723.pasic@linux.ibm.com>
 <1718026545.7557275-2-hengqi@linux.alibaba.com>
 <20240610221900.1810ea96.pasic@linux.ibm.com>
 <1718102433.0456574-3-hengqi@linux.alibaba.com>
 <20240611122756-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813E2EE4EA2BA729B2F6B7DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240613021132-mutt-send-email-mst@kernel.org>
 <1718591277.4770932-5-hengqi@linux.alibaba.com>
 <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
 <1718869209.8824844-6-hengqi@linux.alibaba.com>
 <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
Content-Language: en-US
Organization: Oracle Corporation
In-Reply-To: <1719020069.8729858-17-hengqi@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::16) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|MW4PR10MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 15fa2bee-2ac0-4f4f-917c-08dc94d28ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M1dBRGZEcXdKbkozK0tQYUFWTkJyVitaVTNtNHNtblZ0OS91Q2dlUEIzaGVl?=
 =?utf-8?B?RlI5S2p3cCthVlNmMTN1OW9ENm5Xd0NrcVV0b2tIQnNhUngwRVJIeG01cXM2?=
 =?utf-8?B?QlJVeEZ6NGRSL0FSTWRmejhIVmdYa1pyMVpTQWxBbVZ2SnZ0dzlwMVB2YkpC?=
 =?utf-8?B?RWtCWXpLZHpuVkJBZFhKTHFvUXo0QUNBbksvVVJvTGk0ZXExRE51MDBtRmlJ?=
 =?utf-8?B?RENqQjErbkxtR2NXUDg0YnlKK1hPb3lBNjNjVTVna3piZG5XZ1ArNi9wZzZo?=
 =?utf-8?B?WXozcGpneGMrcnpQVVpmdkVub0xhL1M3SFdWcGRkY3QrR1pINGMwV2t5M3Zv?=
 =?utf-8?B?UDJsa2tvNkU1NDJvVGxJZnQ3YkJIZnowaG9BVnljNmZkK3hUWlZWalllcklT?=
 =?utf-8?B?U3lJdVNSWFJ1MXRWd2hiVVdNOXd0RlVFVE4vUXZUVGNyV2xxZ3V1dVR6aWR6?=
 =?utf-8?B?YzMrUkdmTzFJUzFHZkYxaUh4UDZiY29aaklJRXY1QzVDbkJGTExyRjJ3dGQ5?=
 =?utf-8?B?N09VNG94RU1SUVh4Z1pBRjltVVY0RkZHZ2RlUjdocldTVE5RNUFHbGFvUm5N?=
 =?utf-8?B?dXRJMW1jU0c4emxhOUtNZk1PRVJLWGVLVkNCNUlBbVlmeWtiMXNSY09aWUo1?=
 =?utf-8?B?dUVvSk05cWkvV2VCOTREUzdlT01CY09xNnRWanUvcVkydjlzUldHdlkvOVM1?=
 =?utf-8?B?SVVyTGl5NHNoakZ1ZjBqM1pIdkZQRk51cHFZU2JjVWpseFlyQWNBaGVHbXFq?=
 =?utf-8?B?RGxIQllnTkJ0YSt5ZnRybWxMUWpSaVVzNkxnUGFMMnNzcjk0bGZ5RHZSdW9F?=
 =?utf-8?B?dm91MGtqUG12OFdCNVpCODdKam80Z2U3dmVRZ0pBM3h2WE9UcDczWStKM2Zp?=
 =?utf-8?B?dkdSOGZRdXpWTThTVlI3NzNNV3cySXJQM0dzLzdwdFdMakhxMVFJeXNNN0Zh?=
 =?utf-8?B?c0srcGFzWTVrTDZUcFk3dFdvc2tpOW5Xc2hScFRWOE40VVNuRWlJSUZuS0pB?=
 =?utf-8?B?MTBNak9EMXBvTXM5Tk1YOUNhZ2g2YXlGcFlXNjBmdm1WWmdLc0g0Tyt5OXAv?=
 =?utf-8?B?WEFaWGlNUW1EMHZiZjBUSDZhcjhCWTlDckZtWjBoUzdsYXQ3NHh5MWh4T2RU?=
 =?utf-8?B?M1dOUG9vb0w1ZGtSeGJJRmRVbTZrVVcxMjBLODNNWGFtVHlRRitTRmM5VThH?=
 =?utf-8?B?YWhsNGxnMzhOQVRsNWRDY0RvV21OdTZIQUhqcVFFanNlK0tkWSsvOFRhR1dD?=
 =?utf-8?B?RVdpZXdielpvVDF6WWxBQXV1UHpNZWpYOHRGL2Jqd2pQSEFscUVnbWswZHFS?=
 =?utf-8?B?NWt6bkVXSmtHcmJzZVk3TkJMYVZEc3V1QVpHMWZCNjd4Z29tM2hYK2tyd0NY?=
 =?utf-8?B?cStOMmV6cFFOVVgvVEN2R2RpWnVKUDNkc25adWoyMnB0Zlk1Unk4dVRCNHR3?=
 =?utf-8?B?dmhZQ21pbTVLdnZkeEJmaFdnalp6QW5ieHMzVDJjZmtEeEhXRkhhbFBhWGR2?=
 =?utf-8?B?UFVxcWZNQWRrck5MclJXdmU3OEF2ekVEaEZpUzdKelNtN1dZMVFweG9pSEs2?=
 =?utf-8?B?Y1FKTXplZjRFSlBxUFlWaHBJbENZNWNqSlA0VllFNndXdXVJdHZCY3Bnc3dH?=
 =?utf-8?B?ODNaQlU2M2N1YnlUSytVUmFxZzB1VkZOVTVERE9CSCsxRXBZK0JpaUZtRk5Y?=
 =?utf-8?B?UUMyUi8zQmkrbnQyalN6czg3eThpTWlvTzQvSGxBUmxCMThKY0ZIVllFSmxZ?=
 =?utf-8?Q?h7UN7xff4yhl9iL9LiP2dHg1GLTKp+DXF7qmZJf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6535.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dFUyRnhyN200WHYwZ1Jaa1Z2ZXZIT2wwVXhGenIrRkRnRVdlRmdGRXI5WVlO?=
 =?utf-8?B?eFFicmZId3pCR2x6SUhGaFMvMm9iZWJsYzJEL0RKSHBTMXdMTk9rSldZNEVZ?=
 =?utf-8?B?bjNZMUJVcGQyL2R4ZWVSblJRMUpDVU1QaFFrcHVBQ3E4bnlIcWQ2QXJabExI?=
 =?utf-8?B?Wm1Ka2JYcCtVb0o0by9QVHpEcG5sTmt1YnpRbXM4ZU5wcVB4amNBUHN6bWw3?=
 =?utf-8?B?NzBKQVV1bGRNbXg1K3QvTDd1eG9VbWFWclEwSkZOb2QzaFVpSlUzM0JWbzl4?=
 =?utf-8?B?Um4xN0Zhc0JzL252eTRQM1VnZU9OZkhVZExCdS9QU3REM3JzMW0xTnF0M2RZ?=
 =?utf-8?B?S2xRSWtZaGQvY1kra3BGaDBWNHNqZkFZSTdNdDdNUUVKeVU2LzdQL1EySkZS?=
 =?utf-8?B?U29YWEhKMENWcThkTzF3bm1FeEl1bW9ocjZBYjQ1Q3JNa2p4blJ0R0Yyc1l5?=
 =?utf-8?B?dGFYcFNsOEZERTRVbHlpT2prMnFjRkhWVjZDWFdnYTdmUnUxMHFmSXJKVy9E?=
 =?utf-8?B?VlBxdkRVVlRhai9OYzdtL3BNRlpDK2dORW5hRDg0NEVYYXkwRkZ5b0ZQblo2?=
 =?utf-8?B?ZWUwK0E4bWFyTVhqWE9qY2RWT1VxL0hqQnZSRGRRY2dUS3EzcUxGM1g5b1BB?=
 =?utf-8?B?WnBLWDVBbUYyMlo5cnpCOTZZTHE3dnVDNXZlR2c4VmRDbG9vSDVxUVVOVmJE?=
 =?utf-8?B?ZTFvb3l0U3l6SVE3b0VVcnduQitQWWlVMDhmRlhjUG16aEoxUlp2UmhBRDN6?=
 =?utf-8?B?N25YTGUyRmp3TGJWU0pqQlNiNG8rK0g3YVdzTVgwK2tQV2krUVMyc3I2MDRZ?=
 =?utf-8?B?N3A1anlpSytHOHBZWnhtSEo1VG80WGJtVHVvbkVMZ2h2VXA1WjVsV3FXM0sw?=
 =?utf-8?B?MlRQRGZhVkFXTWRBWncwTWpsT2krMUNGdWJLTnE2WGtIYUdMTkJ6dEhZWWds?=
 =?utf-8?B?UEJIMnhza0dXU2xHbDlRci9TZzJzeE1IckFXTGhJbzJvMHFPdlErd2FwSWt0?=
 =?utf-8?B?Um55QkMyMVVaU3d1cEVNYWVmQ2VxUGxiajFndlNqamwzeHJwcmxDUnNIeGJk?=
 =?utf-8?B?a0g1QnJ5S0NtRSt5bHEvSU9jb29JczFOQ3AxUlU5cDI5THQ3WngrU3BoaFpm?=
 =?utf-8?B?UmdBRk1IdG1MZkhTaHhTdTA4VnZRSE1JTVFKK1dZU2Fhc3JmbjFjV3dTWnZQ?=
 =?utf-8?B?RW9CSkhMUjZVWC92RjU0MDlwbUJwemVsZjUvTThZNkhkcVozUE1IMFpxNjRX?=
 =?utf-8?B?Q1ZNK1RYdmlhVjFEVW5EU3dTZjV6Mmt1V0szQWNBZGxKRmx1ZDZJYWR3OXhO?=
 =?utf-8?B?MTdDMzFlSm5PWUVQbWI0NzQwNFNRZWlWVjFxZ2lUT3FIUFRucVorNGJGcWN0?=
 =?utf-8?B?SkUxVXRZUms4bjBKaG16Tm1jcGNsSjJYTlBzeGs0OTRIcTNxTHpBYmsxcGVa?=
 =?utf-8?B?UmkzYlMxSzk4eHJmRjM0UGwveElweS96czR4SjVMWHl2WndtajNrekNTdHZ0?=
 =?utf-8?B?clZ1cWpoOUJmd0ZCTTJIZ09WTWVUT0FybFlqRE5hSk1Nd1dkVFBLQ2wrU2Rp?=
 =?utf-8?B?REhPelUvY3Y5RXB2RkdHRGNHcDBwVWE5a0R5VlN6S0czZjVUS2R1QWg0eGt1?=
 =?utf-8?B?RCs1ZGxJbXpENktsR2EyajNuZWZURFlqWXh5Y0h5UTNJdXZpNURWQzlRbDhy?=
 =?utf-8?B?aHdDTEZMbzJndk1oL0pzVkNObHh1VEpEOEJqNFNwOFIrYUVmbVp2R3VOZ0JF?=
 =?utf-8?B?OFlIZXIyRVkrK01uczhSRDJkaWlVYzJVVVlSWUg1SmhBUDVKanF6ZE52ZEtj?=
 =?utf-8?B?UENLU2dodzgxcWxUOGEvc2NxYnFYdjJKakJUbjZhY1UvMEVWd0RKeFFuQzZ3?=
 =?utf-8?B?bTlrL3hQTzY3TlRYMzdIdE82UWwvdG1CZTJDN29XbkJkYmFQblJSY0wzRk5I?=
 =?utf-8?B?dGdsdEl2VGVQVlkwcjhndXNFRWpCTVE1M2tvV3dBRUNUSDRUdE1wNkw5Qngv?=
 =?utf-8?B?dDdSNmtOM2xORDZTOHowNVIzYVFJbVd5b2xUZWc3QjVHOEI2b2lRYWlodEtZ?=
 =?utf-8?B?ZzI0Y2s5QWdxeFVqWDZlQUtuQkkyUXJNdXpIQlRPSUlDOURrdHNqV3RYZXIz?=
 =?utf-8?Q?nzwJUiwDq3EabVfZ4UvACB1T/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	APW+WgVO4lz4cwEHRmLBOe/5wuggxsnvqzrKSMQGXvkSxsRw295Ot7PYRxOZHEK03Ij84l/hAkqMlgRrhGcaHVA0+9377ul4/q98iIQt0FKCmtbVt6sViXf39ABUHpoEJeaIXevckJi447CKlJilnOqf0pBc+wx7TLYEbEDKGCogVrLhiUNmJFwg90DRVVYLAaS/IduBaIS1BsXnNMYpRqg7eRZhD3zmJxHYf19ISfjmkk1yaKeO8KSBnaRXqArQWA8uSShS9W6MShmhbZ7s6U+JZzEbUqXyU1VDN5KhW76WElqbMkKq7SNhL+ynb0kfPoyBLKvJsmb6uWzGwhcJFUxWPwMMv1UkomMXguLgSW5mX0RjCq50DlgVxfl30yt0CbAYDBzJyy01nw0qPJQk7h4tyZfZJVqikyERS9EA9FhbCdOU8a474ydMVItabqjeXLfKWfc4h53BDeXwaNZKQxSrLc52wVnXC7/7fijl4DVZ3xU0GeJ2Rw5iR3h1EDcfPJrPdlGHlDlSA/v+OggylNOHph1S3fZ/dBBk/6VswygQoxXkjQ5VP94wTTlJOfZO6/ozlLXj9iPObxEDM0udf5a0zzqLRF8D3UUufF+l8dw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15fa2bee-2ac0-4f4f-917c-08dc94d28ad7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 04:51:57.4268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7cLr4WVnPsjFP508kzeDej03Ie0wUgIrUyuEKOsxkTLJGRuwj1hjsN2VQz3aE34ylzMcb9YijeSImQAfbpMSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6394
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_01,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406250035
X-Proofpoint-GUID: QxfpS-HpD5OJKldPVnOy517OWYyRyZZK
X-Proofpoint-ORIG-GUID: QxfpS-HpD5OJKldPVnOy517OWYyRyZZK



On 6/21/2024 6:34 PM, Heng Qi wrote:
> On Fri, 21 Jun 2024 16:46:27 -0700, "Si-Wei Liu"<si-wei.liu@oracle.com>  wrote:
>> On 6/20/2024 8:24 PM, Heng Qi wrote:
>>> On Thu, 20 Jun 2024 18:21:03 -0700, "Si-Wei Liu"<si-wei.liu@oracle.com>  wrote:
>>>> On 6/20/2024 12:40 AM, Heng Qi wrote:
>>>>> On Mon, 17 Jun 2024 16:31:25 -0700, "Si-Wei Liu"<si-wei.liu@oracle.com>  wrote:
>>>>>> On 6/16/2024 7:27 PM, Heng Qi wrote:
>>>>>>> On Thu, 13 Jun 2024 02:13:50 -0400, "Michael S. Tsirkin"<mst@redhat.com>  wrote:
>>>>>>>> On Tue, Jun 11, 2024 at 05:43:18PM +0000, Parav Pandit wrote:
>>>>>>>>>> From: Michael S. Tsirkin<mst@redhat.com>
>>>>>>>>>> Sent: Tuesday, June 11, 2024 10:00 PM
>>>>>>>>>> How we can we make progress with
>>>>>>>>>> the realease but sure we don't make backwards compat a pain?
>>>>>>>>>>
>>>>>>>>>> Ideas?
>>>>>>>>>>
>>>>>>>>> There is no functional break with this relaxation.
>>>>>>>>> Device set some non-zero defaults and driver didn't modify them....
>>>>>>>>> Anything broken? Unlikely.
>>>>>> Generally it's inappropriate to leave this decision making to the device
>>>>>> for what would be the best / most performant default config, as the
>>>>>> device is generally considered agnostic to the guest load...
>>>>> Instead, the performance of the virtual machine and the driver depends heavily
>>>>> on how the device is implemented, just as we have proposed various ways to
>>>>> offload the data queue in the device to the hardware. The reason why most
>>>>> devices use software to simulate ctrlq instead of using hardware offload is
>>>>> that the driver has no requirements for the performance of ctrlq before, that is,
>>>>> the device implementation is responsible for and meets the driver's performance
>>>>> requirements.
>>>> I am not sure I follow the arguments of ctrlq being s/w or h/w, I
>>>> thought that it was for the debate why we need coalescing on hardware
>>>> offload device in the first place, instead of reusing event index or
>>>> similar s/w based notification suppression. I don't doubt the value of
>>>> coalescing, but how's it relevant to the default value disposition?
>>>> Generally the default config disposition is not considered to be part of
>>>> device implementation, especially when it comes to the situation where
>>>> device can't easily figure out the specific workload to occur in the
>>>> guest, and there's no perfect single default value that could meet every
>>>> single performance metric across the board. This is a typical tuning
>>>> knob left up to the user to adjust, why the device or driver needs to
>>>> set or load the initial value? The driver just needs to start with
>>>> certain value, be it 0 or non-zero, which guest user can override at any
>>>> point of time, depending on his/her need, and that's it! I guess I still
>>>> don't understand your user case here, why device / driver default is of
>>>> such importance.
>>> I've explained that, and I understand your argument is why default value is needed,
>>> and users should be able to adjust them, right?
>> Sounds about right. You'll soon realize that there's no perfect default
>> that could work with everyone - in that it's just a static value to
>> begin with, no matter whatever initial value the device comes up with,
>> one user or another will come over to you and complain that what is
>> loaded from the device doesn't match the workload they have, so those
>> users are still expected to adjust manually tweaking for their own. As
>> long as it's a tunable that guest user can control and override anytime,
>> I don't feel it too much different what initial config the device would
>> start with.
> When you have a large number of customers and they buy your machines,
> how many users do you think have experience adjusting this value? More below.
This is not what this proposal alone could address, as it just shifts 
the sheer pain to the device and host admin rather than provide any 
flexibility. Technically I believe the right solution is to seek 
adaptive coalescing that doesn't require user to tune anything. Noted 
adaptive coalescing / suppression could be done from the guest or by the 
device. For e.g. the s/w based event index based notification 
suppression could also work with hardware if the event index is somehow 
propagated through a doorbell register rather than load from host memory 
over the PCI transport.

>>> The default value is working when the user doesn't adjust them.
>>> It's not practical to rely entirely on user adjustment,
>> That's where the adaptive interrupt moderation framework (e.g. DIM for
>> Linux) could come to the play, I think?
> Last time, this work is only useful if DIM is not enabled. I don't want to
> explain it again, I've said it many times to different people in the history
> discussion, don't you want to check any history discussion?
I did before I replied. I thought both Halil and Michael tried hard to 
convey is that what you claimed to work by just getting the initial 
config loaded from device will not be sufficient to address all the 
performance requirements in broad and general means other than satisfy 
the goal set by yourself. What I saw is that you kept proving yourself 
by trying to reference your own use case and design - this not just 
mixed different things up but also ended up with circular argument that 
wasted everyone's time unfortunately.

>>>    and for devices
>>> that serve hundreds of thousands of customers, the device implementation
>>> has to be comprehensive.
>> Would you mind elaborating the technical difficulty for why the device
>> implementation has to be comprehensive to serve hundreds or thousands of
>> customers (i.e. adaptive moderation in the device), and is there better
>> way to improve the current interface (ctrlq v.s. doorbell/MMIO register)
>> that is hardware offload implementation wise. I feel people reading the
>> thread without understanding the full background would become even more
>> confused as to why it's relevant to your proposal, to me it's completely
>> distinct use case or problem area that we are talking about.
> Regardless of whether DIM can be enabled by default (it cannot accelerate all
> scenarios, right?), therefore, a considerable number of machines on the
> cloud vendors' line still have to rely on static values to provide boot-up
> performance.
Sorry, this is not a good excuse for people to accept a sub-optimal 
solution. Please talk to the other hardware vendor or read my above 
reply carefully.

-Siwei

>   The vendors will also make optimizations to optimize scenarios
> like ping-pong, so the boot-up performance is very good.
>
> Thanks.
>
>> Thanks,
>> -Siwei
>>
>>> Thanks.
>>>
>>>>>> Unless the
>>>>>> device is specially hard wired to some fixed guest setup that users
>>>>>> couldn't change, it doesn't seem logical that the device could derive
>>>>>> the best or most performant config on driver's behalf. What if the guest
>>>>>> wants best latency for its load but the device just blindlessly guess
>>>>>> the guest might prefer throughput friendly that it miserably uses
>>>>>> latency impacting non-zero default?
>>>>> The device does not want to guess and cannot guess. This patch does not force
>>>>> the device to choose a non-zero value, but relaxes it to allow the device to
>>>>> choose 0 or non-zero, which is very friendly to virtual machines with different
>>>>> performance requirements, right?
>>>> I don't understand the friendly part - do you imply your VM users are on
>>>> kinda fixed wired setup that they cannot change these coalescing
>>>> parameters after driver is loaded? Can the owner of the VM in control
>>>> apply certain initial config for the coalescing parameters to the VM
>>>> image? Or is it the problem of the guest driver that doesn't yet expose
>>>> coalescing parameters to the end user? Otherwise I would think that
>>>> guest user should be able to set parameters accordingly that would best
>>>> fit the specific performance requirement of their own. How the device
>>>> could even help here? I don't feel there's a lot of value to grant the
>>>> device or host admin the flexibility to policy the *best* config on
>>>> guest user's behalf, to be honest. And you seem to admit the fact that
>>>> the default doesn't really matter, be it 0 or non-zero.
>>>>
>>>>>> Could this device side change for
>>>>>> the default config regress boot time performance (which may need best
>>>>>> latency over throughput)?
>>>>> Don't make these assumptions, what if the driver needs better throughput?
>>>> There's a misconception here: what we think that driver may need in
>>>> terms on performance does actually reflect what guest user would like to
>>>> have. Driver cannot read guest user's mind to make the decision, either.
>>>>
>>>> In history there was drastic change in the Linux virtio-net driver that
>>>> ever changed the default disposition for XPS (and RPS as well) from
>>>> throughput and long-lived connection oriented to concurrency and
>>>> short-lived oriented, which regressed a lot of existing setups that
>>>> expects sustained throughput and packet rate after kernel upgrade.
>>>> Although the occurrence of such drastic change for default disposition
>>>> is not so welcome (that is one of the reasons why I valued consistent
>>>> initial value and back compatible  behavior), I don't see people yelling
>>>> at virtio spec for less flexibility of offering the default disposition,
>>>> given that the guest user can override the config any time with their
>>>> own tooling or script, there's no problem at all for them to just set
>>>> the corresponding config back explicitly to what it was before.
>>>>
>>>>>>>>> And device/driver has better performance, is that a problem? Unlikely.
>>>>>>>>>
>>>>>> Even for rare case with a hard wired setup, the way to tackle the very
>>>>>> problem using device's default is still quite questionable. Usually the
>>>>>> mgmt software or network config utility should be equipped with some
>>>>>> default value if need be. And we know the guest has the best position to
>>>>>> impose the best / most performant config for its own load. What is the
>>>>>> issue or use case that this initial config couldn't be applied by the
>>>>>> guest mgmt software ahead but has to resort to the device to load some
>>>>>> default (which is odd and irrelevant to any guest load), before the
>>>>>> interface is brought up for operation i.e. performing I/O?
>>>>> Use cases are everywhere, Alibaba Cloud, MLX and all other modern network cards
>>>>> have a default value that is not 0.
>>>> You seems to be referencing your own setup basically, and the question
>>>> is still left answered - why the initial config can't be done through
>>>> the mgmt software or network config utility within the guest?
>>>>
>>>>> (0 is actually a kind of default value)
>>>>>
>>>>>>> Sorry, my vacation just ended.
>>>>>>>
>>>>>>>> Yes, it is possible. Driver can cache values it sets
>>>>>>>> and never query device with get.
>>>>>>> Don't we already have a lot of behaviors to drive queries from devices?
>>>>>>> RSS context, device stats.
>>>>>>>
>>>>>>>> Before anything is set, driver will report incorrect values.
>>>>>>> Devices that are widely supported and supported by good practices should have
>>>>>>> any initialization value. Just reporting 0 is incorrect value. Although the
>>>>>>> spec now says so.
>>>>>> I don't have an aligned view here, sorry. As I recall having 0 as the
>>>>>> default is just to keep device started in a state where coalescing is
>>>>>> disabled, so it's backward compatible and consistent with a
>>>>>> non-coalescing supporting driver - such that it won't yield surprising
>>>>>> effect (for e.g. regressed latency) inadvertently after user's getting
>>>>>> driver software upgraded. Unlike the other virtio-net features that
>>>>>> could 100% improve performance in all aspect, this coalescing feature is
>>>>>> more of a performance tuning knob that may improve performance metrics
>>>>>> (such as cpu usage or throughput) of one dimension while demoting the
>>>>>> others (such as latency, jitter or connection rate) from the equation.
>>>>>> That said, there's not a single and fixed set of default config that
>>>>>> device could supply which is able to satisfy all kind of guest load.
>>>>>> Rather than rely on the device to offer a matching default for driver
>>>>>> (which I think it's technically wrong), I'd lean to having guest
>>>>>> software or network utility to apply the initial config for the guest,
>>>>>> where they should have best knowledge for the specific guest workload
>>>>>> than what device could do.
>>>>> Before this feature, a good device implementation should also support coalescing
>>>>> (of course we don't necessarily assume it has coalescing).
>>>> Again, I don't doubt the value of supporting coalescing.
>>>>
>>>>>     In addition, virtual
>>>>> machines that tend to favor latency and throughput exist. If the device supported
>>>>> by the manufacturer needs to provide a low-latency virtual machine, please
>>>>> continue to keep the default value of 0.
>>>> No, that's not what I was asking. There's no such requirement for any
>>>> vendor to provide a low-latency or high throughput VM. The more general
>>>> use case is - the setup for real world workload might just be too
>>>> complex that end users would prefer low-latency on some virtual NIC or
>>>> even some specific queues, while the other queues of a virtual NIC, or
>>>> reset virtual NIC might have very different dispositions. Due to the
>>>> needs and dynamics of workload scaling up & down, they might have more
>>>> or less queues or virtual NICs to configure, so these disposition would
>>>> need to be readjusted at any point of time, for which there's no easy
>>>> way for device to adapt to easily. The guest user should have best
>>>> knowledge for the specific guest workload and setup than what device
>>>> could/should offer.
>>>>
>>>>>>>> What will break as a result? Hard to predict.
>>>>>>>>
>>>>>>>>
>>>>>>>> Given the patch is big, I am inclined to say it just should use
>>>>>>>> a feature bit.
>>>>>>> This doesn't seem to break anything in my opinion, we just told the device that
>>>>>>> now you can set more values.
>>>>>> Another thing this could break is live migration between devices with
>>>>>> varied default. How do you make sure the guest doesn't rely on some
>>>>>> default from the source device, while on the destination it just doesn't
>>>>>> get the same default coalescingjjj value? To get rid of this side effect
>>>>>> the guest would still need to apply the initial config for its own,
>>>>>> anyway... Which eventually would render this proposal with arbitrary
>>>>>> default rather pointless.
>>>>> I don't quite understand why this would affect hot migration, the values
>>>>> would be migrated over.
>>>> Then I don't see this has been discussed (wouldn't the initial value be
>>>> part of virtio device state to migrate over?) in the thread or described
>>>> in the proposed text. And your proposed per-queue coalescing parameters
>>>> (default plus current value) would have to be described too as part of
>>>> virtio-net device state, so that people don't misunderstand your proposal.
>>>>
>>>> Thanks,
>>>> -Siwei
>>>>
>>>>> Thanks.
>>>>>
>>>>>> Thanks,
>>>>>> -Siwei
>>>>>>> Using new feature bits does not seem necessary.
>>>>>>>
>>>>>>> Thanks.
>>>>>>>
>>>>>>>> -- 
>>>>>>>> MST
>>>>>>>>

