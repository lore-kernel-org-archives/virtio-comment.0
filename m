Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E632979DF
	for <virtio-comment@lists.linux.dev>; Tue,  2 Jul 2024 05:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719898263; cv=fail; b=GtQehNhO7XH2Ann/6Ex9wv7YMMaB7D2bKeHrgdiOJZ2i3AcuCuQQ18w6eyPTIdwjldPGm698MYXwYZ76v2CrsDP02M4hT9dI+YD9mV36dYztlSq4anp+S5iNB3834T2KXGSRIH+Bq6MP2G2GDrVU5q2S0E4SKjwKjDttlqN7kEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719898263; c=relaxed/simple;
	bh=LU96qeTgAj1J0up1v5MZcyl+94OJRihY9/9wb6OONKY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=kivuP58zoxntzQ6aFLXA8zDFFhj4gxOiRGKKPuqqtVdJuD/KPpUuqyOiIA7JMn4s0qQ4nZ5maALkRbvlWUpMv8O4OY0fe9pwxnlU8mZL4ST3FKkXZ/3iL6DfFa/I/NY15gD8Rs1eVOmXR/htfZRDZqFwkj6jhuapVCOme91zQww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=BFY2VlX6 reason="signature verification failed"; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="BFY2VlX6"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461HxO5t022313;
	Mon, 1 Jul 2024 22:30:50 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 403sdckp82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 22:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmOg7u8iYznD64ZVAnPPy7uhezgC2JQdhFuf1Pbxk+cMYNz4/fnuidLh1i460ktFrAPiIdkPY9PpsvZ/DvAyyLwINrq0yJv4Z6mRu83IXMdhxuJGEMyB2ogztf+R9TSFHe+iqayAL7VaIL4GGB36WSzLF5HxaFUv2XXVTapKHphXCg+YsUmaT0vj5Qmy6/NT09DY7v38fzLR24sDFQAymQGZe4utw4jDyrci9m4SFHmrwEEWkRbBN/+BpoZSmW7RX+RPQXO8e5xmk3YvuY3bQ3rBfz+WTlNmqaE/vQMru82gYBsbTyAQ0FUC710TrdzQ4stxuP8W+w9716Kznk6zYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrxvT9hzBu/xPYmfqj9kR8LWqT3UVtU9wmgFGKNaykY=;
 b=G5wg+tLLYHu+JKyt4upyNi7LSyO2qJeww6K33cMKhUiDl0C8ur+w4+tH0wy07l9TsrDagZm1GRVbBosmY8MW+fhCI8t/PD9HInB6H2X4IKHueN1Hrk8R99N9TnysO5msKccZQqiTdQjxYxToUUglxuk4k+18FxmJGSUzBB5BFiel7hPaEGLM2ASnspodNia0WsutrZdNOr4oyCccJVQ+UAZcgNP8Tl4XQMwxNUzWK/2d2zYDEP4nzXkDeL94d10coSeC59vdGB3Dyxe5QmYRs7JwfxkDVV+PzRktSITgtNuOCLZbGNmM9XiZdp/l5yfJhTPcHLl/0N7M1CQ4PnBrYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrxvT9hzBu/xPYmfqj9kR8LWqT3UVtU9wmgFGKNaykY=;
 b=BFY2VlX6YGUqA7+zKXCVXFQ0gscWg4tAjI3yrYZT9fuNQUyYXwQczwhdHxDbHGh+2LoGtjqOWBMOc+3jjA5qBevC2bzudbiOMdbmg0N/RvL3Ru7geGTSz3lsTVVBBeucE67CtVYmQTmOgbwexgiDVDtiA7OHex0PqF/Hnds5DZ0=
Received: from MW4PR18MB5244.namprd18.prod.outlook.com (2603:10b6:303:1e0::16)
 by MN2PR18MB3462.namprd18.prod.outlook.com (2603:10b6:208:268::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.36; Tue, 2 Jul
 2024 05:30:45 +0000
Received: from MW4PR18MB5244.namprd18.prod.outlook.com
 ([fe80::52f3:9792:ee42:90b]) by MW4PR18MB5244.namprd18.prod.outlook.com
 ([fe80::52f3:9792:ee42:90b%7]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 05:30:45 +0000
From: Vamsi Krishna Attunuru <vattunuru@marvell.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Xiaoguang Wang
	<lege.wang@jaguarmicro.com>
CC: Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>,
        "parav@nvidia.com"
	<parav@nvidia.com>,
        "mst@redhat.com" <mst@redhat.com>,
        "leo.liu@jaguarmicro.com" <leo.liu@jaguarmicro.com>,
        "angus.chen@jaguarmicro.com" <angus.chen@jaguarmicro.com>,
        Xiaoguang Wang
	<lege.wang@jaguarmicro.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>,
        Satananda Burla <sburla@marvell.com>,
        Jerin
 Jacob <jerinj@marvell.com>
Subject: RE: [EXTERNAL] Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new
 used buffer notification suppression mechanism
Thread-Topic: [EXTERNAL] Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new
 used buffer notification suppression mechanism
Thread-Index: AQHazB2LwynMG7RG+0ahzZh9MxoGJLHi45dw
Date: Tue, 2 Jul 2024 05:30:45 +0000
Message-ID: 
 <MW4PR18MB5244C8932384D80A1F6A400FA6DC2@MW4PR18MB5244.namprd18.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <1719882918.7093904-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1719882918.7093904-1-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR18MB5244:EE_|MN2PR18MB3462:EE_
x-ms-office365-filtering-correlation-id: 39b213d2-f141-4140-998b-08dc9a581f2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ODc5K3YrbHJGR2wwOFUrN1dpazJlTzk2dDNJdyswZnBEWEVMc1N6WFMwNlQ4?=
 =?utf-8?B?THlIeHVoU3QycmFVcmxqRk5kaCs0alBSdWNmTUwydjNQZEE0M1VWcjdvWWpQ?=
 =?utf-8?B?cFJpVVFMN2l1dlB3Vzg3bHdJZVE1R0wrS09NOHFZY2k0NCtrVi84SWdIaVNU?=
 =?utf-8?B?b041bXQ0eDI4QjhMNmFocUdybGZ6amZWemhEeUFPd0QvTjUzd0FJbzVTWTR6?=
 =?utf-8?B?cHJ0VXFHcForVkJDbzRJNWhXd3ZHUVpWckl5M1Bvc29WVUd5akxJUlYrTTRB?=
 =?utf-8?B?NitudjZvZ2RlbTJpNjZMTHlQMC9TOWlIOW5DWnhHTGtwNlIxTU1EZWNvdnNo?=
 =?utf-8?B?Zi82L1VtaEZkdGN3c2NCUDV6MlNmbWx4RWtsTHA1eXJFa3N6aGFzaEpTWTRx?=
 =?utf-8?B?aW43TnBKYnhyd3BsY2pNd3RDQVRQSGdkRkIwdXpzUjNXbUY5R3FOMWRuNGVW?=
 =?utf-8?B?WHBKMGhxQU9RODZhUlZDQklmNEJMMlYwNGZrNXNXYk1EZU9ITVRvZWRpbnV2?=
 =?utf-8?B?ZEhZbXVvMkRBNEFvWitrM1R1eC8rZy9UZFgxanYvNFY0VUd0bUdmKzRMY2g1?=
 =?utf-8?B?MDcyZnQxSm1RUlVTbUZ3cW44bmY3eWE3dDNOZWxVb05RajVRQmZ0Q3ZaK2F5?=
 =?utf-8?B?VE00NTIvalJZS09zUFdVUnA1SDVmT29rOWR1M0l3L2VPOHlXZk13V1lXcVRV?=
 =?utf-8?B?K2ZTRU44a2dkQTFubnlNLzhMVzA0R1ZTWERRcjZuajc0R1FjVjVZNXE2eXB0?=
 =?utf-8?B?K2kzNHZPcTkvSitzcWhTRHg5bnNRRHhleG5valhRNWZUYmVmTGN5Z0MvV0tl?=
 =?utf-8?B?b1ZwRFlWN0lrZUlJU2tjbCtZVXN2U0JZU3J5Nk5hMWk1aElGN1BJUDNrV2dY?=
 =?utf-8?B?VFlvVmlObi9xVUpEREJkWXNXVWRxd2R0ZndqU29hMlN3Y0FoQTNndU5hY1Fp?=
 =?utf-8?B?TE0wWllLMTNSWW01UDJuc2EvQjd2M1laQlVRMFJDWW5wcXJhMzJiZDBTZWV5?=
 =?utf-8?B?VGs4Z3ZqaVJVNkNkb1p5Ung3MHZWRGF6WUN6VDV0Nzc3ZnpmS05rdnUybjdw?=
 =?utf-8?B?QmdSYVpuSEdmV2xpR0ZhSDIvY2o4Q2dKdWgyTnVoOWtWYnlLczQ1OFpicGQ0?=
 =?utf-8?B?a0hiVG1zVDJEbEU2TStNQ0JOOFRKbjd3WEJQUzNyUXprR2N3ZlhCTmM3SE5M?=
 =?utf-8?B?eEYra1pza01zZFBONWxCMU5BTzV6YUI0ZzkyMkZGYmF2bnYrN2lkd3A4QkJT?=
 =?utf-8?B?VFFEc1JCTVh1MHA1T1pEMlNOMVNRYU4rcUJTcFV1WFMxUnNyVXY5VlBSVkh6?=
 =?utf-8?B?Nk5YbTBnOHpBeFJjLzk4TTRYNW5KOGt5bytyc3FBZXdicHE1QndTWWZwQzBN?=
 =?utf-8?B?SWpBclQ0N0hXOGVYQ1d4SzExNm9KVUpQb3lVSmhVa1JmY1FMaGdvTk9HVTJ6?=
 =?utf-8?B?aE1TTWNrOUdMSm4rZG9oNEZkaGF1b3doMEZKUGdLVVIvZTNsRDRncThzd01q?=
 =?utf-8?B?TnRqZVJFanFvOENFWkwvd2M2dzhEcFVxTjRNQmFqbnBJem02ZWQvTFdBWUEr?=
 =?utf-8?B?UDN6REp2OWxGdjhkYU5TaTU5QklUWFFPLzZzUXZRa0N6NlhVQjRZWDVkTXBy?=
 =?utf-8?B?bEhMT1pmMkxOcEtISmF2QnZ4Q1BDUWpTYnBDb2JGREdiQTdteUtwZEo3ZkRr?=
 =?utf-8?B?YmorV2E3OVZkQWVMcWJSY3lNRzM1aHZVaE83dmJYMjZjRU8vb1RwTlVwNDN4?=
 =?utf-8?B?SW9RcERiMzV6cWpYYmY5bHhqYnpTVGFUcjQ0R0thNFlrb0lCNXNBNHhpUVpT?=
 =?utf-8?B?TFp1anZzWU5oZXhqN3lHMnZoek9IZVo1UzF1YjJXdFFWNFRuSFpBUWkrbmJI?=
 =?utf-8?B?Z1hIaFkwSmFSREFmSXM2YlE4L0tNN0l2VmhRTFBLSWtFTmc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR18MB5244.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UHozQlZITG10MUJvdFM3bTFZcGtRR2cySTBTQXZuTFNYY25veUtTaVo4ckhm?=
 =?utf-8?B?a2hvZUF6YlJ2YmVicHlWNjBBdlJLM2pZeFg1bERLMFQ0cDR2WWoxb1oxcS9w?=
 =?utf-8?B?UXNpT2xWSlhjaEJnVWpsc3g1UmNhaGt5OEd1dUE4SFBaMnR1TFZ1VFlPb1Ev?=
 =?utf-8?B?aGk0ZlI4dmsrY2w0eVBjTnB3amRwdHhyUXhSMEhKSVltaTh5bzVoVjFPSnJo?=
 =?utf-8?B?NzlKclRrc3ErM05pdFB5cGJjdnhxWlErbHg5WU1OUStNdDRVTHo2U0ZNdkc0?=
 =?utf-8?B?MHIwSHpMOXBKem5GVlFtb291UThKUFA5cUpVYnNuZlRXSU5xZ1IycFFVeVg0?=
 =?utf-8?B?RkJnNXJFb0wzTGtRWDVzbzJHOFFHT2JpUjVFV0U1cGlvY2FQaUdjVlc5Vnpz?=
 =?utf-8?B?UzRsdTZQZkxTaHhNdWZ0c1NKaDg5UksyN3JwNndHbDgrYmNVMDJIbWJsWHlX?=
 =?utf-8?B?OUgwakxiekI2eWVVczhtYm5aK3NRVEFKUWhEcGpPK2NtMkRQc2lGS2lkZVpp?=
 =?utf-8?B?Zm5JOHd5Q2g1V2hVNHkwc0pjUEp1TkZMbnZXVDhYZ290dURLSTR3OFR3dEcw?=
 =?utf-8?B?YldONTRNR0s4ODZvU3podGxOQnE2Mzlqa2NENFFmN08vQ2FKckdzam8zNkFI?=
 =?utf-8?B?RXRxS0Z0ekI5VUdSTmJGRXJNWGFFamFFWlFJR2U3ajNmUFZDTnZkY2pVaGJx?=
 =?utf-8?B?dVBPSlIxNlFJT0tMdTJ3a04wZ0ROTUZ1Z3pGWElIcW02NW9ZRmJRT29IUW9q?=
 =?utf-8?B?cXRidXpya1RhQUxVcEtIaVBTWGh6NzhBZ09TVW5JVmJCSHFONlYvM3NaZmgw?=
 =?utf-8?B?cUkrQldTb0NOM2J0amxiVDRpS05UOWpUdlBjM1FXNzVZOWE5aFhtUXM5cnRU?=
 =?utf-8?B?bmtuRjJlWDZRRmdxQ1RhSHFxdGpNSEd6NnlFN241NXlDTGlMNmMwdi9SL3hy?=
 =?utf-8?B?WklFWUsybno4L3IzOFR2NXE4azdPSENIT05lQ3RMdUtWNnBpZVRiUUpWZzlv?=
 =?utf-8?B?NnpDcHRNa2dGNndjWFRkcHJodi9jQi9oRGdkSllrREQ3RkJod2pBbXpLU29T?=
 =?utf-8?B?MDEzUU4xOTlOSjM5TFVUVUVldU9YZ290QnlxSkl4b2JoVFVteWphc3lHQzBW?=
 =?utf-8?B?eWVWZXVIMEhhcUxPNDIwVW9PYXBBYTBPU3o3akJhQjhvQ2MyVERyVjNPYVh6?=
 =?utf-8?B?bTZlTGQ0dENBUk9GcENPRGllQlhyd3U5bDZyWFFwam9BZkZIdlg3Ny93RFVp?=
 =?utf-8?B?LzBFS0tjdHFmUkxWcjdZWUhwdk00U3pZKzhOT1VVQVRYaUZJYmJmMFd6dHNT?=
 =?utf-8?B?T04wL1JlTXo1USt0QmJnMXB0d3NoZG9lcm9UMi9QcTNWVmxGL2w0T1FUUTNk?=
 =?utf-8?B?Qi9LS3lXU2JRZFhhWUp3YklQYXRDeFQ1enAyekUvYTZ3YUd3Sm1JOXVyS0ZJ?=
 =?utf-8?B?WEp0aDZvQkVKYnN3T24zYzM2WjVXc0RpbFRYZEpTcE5uTGl3T0p0Nkt5eW4r?=
 =?utf-8?B?N1hMWWpzSUFLUFl0OWxzUVNldTI4djJQSXhTelV4Q0VTNUFDdXFHOGVGUUtr?=
 =?utf-8?B?WDBXYk5JQTNTbk8rZ3F1Vmd0NVhtbG9vYmRrVmc3U0xDeW9BRXRmZ28yUGor?=
 =?utf-8?B?akMwUE84K2NBMnM3SE5hcGVlMGs2QTV0blJKQmtIWEx0dittVlQxTzNUeXR1?=
 =?utf-8?B?T1gzRjdNc2hDMytVZ3ppY3hnNW5iZDF4ZTJVREVNWWlZbXlLYUd3UHhpalBO?=
 =?utf-8?B?MFNyYkxDdnc1MnEyRHJMNnNkZE82RHpzdFQ0NXREUTdaRVNOZ3VIcFBXTTR4?=
 =?utf-8?B?V3A5QVFsN09FUzg2eDBPMmdEcERzVld3RHlrdyt1Z0I3N3lLVlNtZWdzczZm?=
 =?utf-8?B?aWF3SUtENnRXU1UvWmhLZHQ4R1JETVpkdEdiUitRWWRoTU1IZE4xcGxZeXQ4?=
 =?utf-8?B?clVLalU5MHY4VElKSG1nakRLRFBYTWpaZUQwdFEzdy95R1gxcThZOE9hNlBk?=
 =?utf-8?B?VUNiblI1OFF0Vi8yRE4venNsNVhmQmYrcnhGUWQ4VVBPRFVuckJqWWNwMjZG?=
 =?utf-8?B?bGt2TUxWVkpicGYrSm9zQkszNm45dUN1WlBlMzRZeWRhTUhEc1VQTEpOK28x?=
 =?utf-8?Q?f9qoJn7elHonxE46E4e2rXaon?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR18MB5244.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b213d2-f141-4140-998b-08dc9a581f2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 05:30:45.0367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wcD9daprHWMOUA3HVhhmMDPlSgeCguBZ4oJGO9dTf9a8iAwGKyTXsawDAsfD8qYhdhX/KTJgKEvVMgncc9NXtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3462
X-Proofpoint-GUID: 22zh4SB8rskmaSzJWKFEErfQoQWKJn7h
X-Proofpoint-ORIG-GUID: 22zh4SB8rskmaSzJWKFEErfQoQWKJn7h
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_02,2024-07-01_01,2024-05-17_01



>-----Original Message-----
>From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>Sent: Tuesday, July 2, 2024 6:45 AM
>To: Xiaoguang Wang <lege.wang@jaguarmicro.com>
>Cc: Vamsi Krishna Attunuru <vattunuru@marvell.com>; Nithin Kumar
>Dabilpuram <ndabilpuram@marvell.com>; parav@nvidia.com;
>mst@redhat.com; leo.liu@jaguarmicro.com; angus.chen@jaguarmicro.com;
>Xiaoguang Wang <lege.wang@jaguarmicro.com>; virtio-
>comment@lists.linux.dev
>Subject: [EXTERNAL] Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
>add new used buffer notification suppression mechanism
>
>On Mon, 1 Jul 2024 11:=E2=80=8A44:=E2=80=8A35 +0800, Xiaoguang Wang
><lege.=E2=80=8Awang@=E2=80=8Ajaguarmicro.=E2=80=8Acom> wrote: > Currently =
for the PCI transport,
>used buffer notification suppression > informations are located in guest
>memory, for example, pvirtq_event_suppress=20
>On Mon,  1 Jul 2024 11:44:35 +0800, Xiaoguang Wang
><lege.wang@jaguarmicro.com> wrote:
>> Currently for the PCI transport, used buffer notification suppression
>> informations are located in guest memory, for example,
>> pvirtq_event_suppress for packed ring and virtq_avail for split ring,
>> then PCI devices simulated by hypervisors, such as QEMU, can vist
>> these suppression informations directly before issuing used event, the
>> only overheads may be just proper memory barriers, but for some
>> hardware PCI devices offered by DPU(Data Processing Unit), DPU would
>> need to submit DMAs to copy guest suppression informations to DPU
>> internal memory, then check whether used event should be notified by
>> examing this internal memory, which is obvious expensive, and this DMA
>> operation is needed every time DPU attempts to issue used event, DPU
>> may also choose to add a hardware component to polling suppression
>> informations by submit DMAs continuously to get newest used event
>suppression infos, but it's also expensive.
>>
>> To help improve this sitiuations, add a new feature:
>> VIRTIO_F_USED_EVENT_AUTO_DISABLE. When this feature bit is
>negotiated,
>> devices will place new notification area for used buffer suppression
>
>
>How about reuse the doorbells, like other devices?
>
>We can do some refactors for the doorbell? Let it support some new flags.
>
I think refactoring or overloading the current doorbell region would introd=
uce synchronization issues on the device side.
Anyways this proposal places the new notification region next to the doorbe=
ll region only right.

>Thanks.
>
>
>> notification in PCI bar specfied by virtio_pci_notify_cap, also for
>> better used buffer notification coalescing, the device will disable
>> later used buffer notifications automatically after sending one used
>> buffer notification to driver, and after the driver finishes handling
>> current used buffer event, it needs to notify the device to enable
>> used buffer notification again by writing above new notification area
>> in PCI bar. Device will receive this notification reliably, and device
>> knows that it can issue used event now, but it may choose appropriate
>> timing to send used events according to its notification coalescing
>> policy , now it also does not need to DMA guest memory to obtain
>notification suppression.
>>
>> Signed-off-by: Xiaoguang Wang <lege.wang@jaguarmicro.com>
>> ---
>>  content.tex       | 38 ++++++++++++++++++++++++++++++++++++++
>>  transport-pci.tex | 26 +++++++++++++++++++++++++-
>>  2 files changed, 63 insertions(+), 1 deletion(-)
>>
>> diff --git a/content.tex b/content.tex index 0a62dce..84505da 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -448,6 +448,7 @@ \section{Driver Notifications} \label{sec:Basic
>> Facilities of a Virtio Device /  The driver is sometimes required to
>> send an available buffer  notification to the device.
>>
>> +\subsection{Available Buffer Notifications} \label{sec:Basic
>> +Facilities of a Virtio Device / Driver notifications / Available
>> +Buffer Notifications}
>>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,  this
>> notification contains either a virtqueue index if
>> VIRTIO_F_NOTIF_CONFIG_DATA is not negotiated or device supplied
>> virtqueue @@ -488,6 +489,35 @@ \section{Driver Notifications}
>> \label{sec:Basic Facilities of a Virtio Device /  has been negotiated,
>> these notifications would then have  identical \field{next_off} and
>\field{next_wrap} values.
>>
>> +\subsection{Used Buffer Event Enable Notifications} \label{sec:Basic
>> +Facilities of a Virtio Device / Driver notifications / Used Buffer Even=
t Enable
>Notifications} This kind of notification is only necessary when
>VIRTIO_F_USED_EVENT_AUTO_DISABLE has been negotiated.
>> +When this feature bit is negotiated, the device will disable used
>> +buffer notification automatically after sending one used buffer
>> +notification to the driver, and after the driver finishes handling
>> +current used buffer event, it needs to notify the device to enable used
>buffer notification again.
>> +
>> +\begin{description}
>> +\item [vq_index or vq_notif_config_data] Either virtqueue index or devi=
ce
>> +      supplied queue notification config data corresponding to a virtqu=
eue.
>> +\item [used_off] Offset
>> +      within the ring where the latest used ring entry the driver has
>processed.
>> +      Without VIRTIO_F_RING_PACKED this refers to the 14 least signific=
ant
>bits of the
>> +      offset (in units of descriptor entries) within the descriptor rin=
g where
>the latest used
>> +      ring entry the driver has processed. With VIRTIO_F_RING_PACKED th=
is
>refers to the offset
>> +      (in units of descriptor entries) within the descriptor ring where=
 the
>latest used ring
>> +      entry the driver has processed.
>> +\item [used_wrap] Wrap Counter.
>> +      With VIRTIO_F_RING_PACKED this is the wrap counter
>> +      referring to the latest used descriptor where the driver has proc=
essed.
>> +      Without VIRTIO_F_RING_PACKED this refers to the most significant
>bit(bit 14) of the
>> +      offset (in units of descriptor entries) within the descriptor rin=
g where
>the latest used ring
>> +      entry the driver has processed..
>> +\item [enable_notify] Whether to enable used buffer notification.
>> +      The driver may benefit from just informing device the latest used=
 ring
>entry
>> +      it has processed, but not enabling used buffer notification. This=
 field
>only
>> +      occupies one bit, if set to 1, it will enable used buffer notific=
ation,
>otherwise not.
>> +\end{description}

Once driver sets enable_notify to '1', it's not supposed to update the Offs=
et field unless
device clears/disables the notifications right. It's good to document the s=
equence that driver
is supposed to follow for updating offset & enable_notify fields.

>> +
>>  \input{shared-mem.tex}
>>
>>  \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio
>> Device / Exporting Objects} @@ -872,6 +902,14 @@ \chapter{Reserved
>Feature Bits}\label{sec:Reserved Feature Bits}
>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bit=
s}
>for
>>  	handling features reserved for future use.
>>
>> +  \item[VIRTIO_F_USED_EVENT_AUTO_DISABLE(42)] This feature indicates
>> + that the device  will disable used buffer notification automatically a=
fter
>sending one used buffer notification.
>> +  Note: when VIRTIO_F_RING_PACKED has not been negotiated, the
>> + maximum queue  size MUST NOT be greater than 16384, when
>> + VIRTIO_F_RING_PACKED has been negotiated,  the maximum queue size
>MUST NOT be greater than 16383.
>> +
>> +  See \ref{sec:Basic Facilities of a Virtio Device / Driver
>> + notifications / Used Buffer Event Enable Notifications}
>> +
>>  \end{description}
>>
>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
>> Bits} diff --git a/transport-pci.tex b/transport-pci.tex index
>> a5c6719..62ba9dc 100644
>> --- a/transport-pci.tex
>> +++ b/transport-pci.tex
>> @@ -551,6 +551,13 @@ \subsubsection{Notification structure
>layout}\label{sec:Virtio Transport Options
>>          cap.offset + queue_notify_off * notify_off_multiplier
>> \end{lstlisting}
>>
>> +If the VIRTIO_F_USED_EVENT_AUTO_DISABLE feature has been
>negotiated,
>> +\field{notify_off_multiplier} is also combined with the
>> +\field{queue_notify_off} to derive the Queue Notify address for enabling
>used buffer notifications within a BAR for a virtqueue, but add a 4 bytes
>offset:
>> +\begin{lstlisting}
>> +        cap.offset + queue_notify_off * notify_off_multiplier + 4
>> +\end{lstlisting}
>> +
>>  The \field{cap.offset} and \field{notify_off_multiplier} are taken
>> from the  notification capability structure above, and the
>> \field{queue_notify_off} is  taken from the common configuration
>structure.
>> @@ -563,7 +570,7 @@ \subsubsection{Notification structure
>> layout}\label{sec:Virtio Transport Options
>> \devicenormative{\paragraph}{Notification capability}{Virtio Transport
>Options / Virtio Over PCI Bus / PCI Device Layout / Notification capabilit=
y}  The
>device MUST present at least one notification capability.
>>
>> -For devices not offering VIRTIO_F_NOTIFICATION_DATA:
>> +For devices not offering VIRTIO_F_NOTIFICATION_DATA or
>VIRTIO_F_USED_EVENT_AUTO_DISABLE:
>>
>>  The \field{cap.offset} MUST be 2-byte aligned.
>>
>> @@ -596,6 +603,23 @@ \subsubsection{Notification structure
>> layout}\label{sec:Virtio Transport Options  cap.length >=3D
>> queue_notify_off * notify_off_multiplier + 4  \end{lstlisting}
>>
>> +For devices offering VIRTIO_F_USED_EVENT_AUTO_DISABLE:
>> +
>> +The device MUST either present \field{notify_off_multiplier} as a
>> +number that is a power of 2 that is also a multiple 4, or present
>> +\field{notify_off_multiplier} as 0.
>> +
>> +The \field{cap.offset} MUST be 4-byte aligned.
>> +
>> +The value \field{cap.length} presented by the device MUST be at least
>> +8 and MUST be large enough to support queue notification offsets for
>> +all supported queues in all possible configurations.
>> +
>> +For all queues, the value \field{cap.length} presented by the device MU=
ST
>satisfy:
>> +\begin{lstlisting}
>> +cap.length >=3D queue_notify_off * notify_off_multiplier + 8
>> +\end{lstlisting}
>> +
>>  \subsubsection{ISR status capability}\label{sec:Virtio Transport
>> Options / Virtio Over PCI Bus / PCI Device Layout / ISR status
>> capability}
>>
>>  The VIRTIO_PCI_CAP_ISR_CFG capability
>> --
>> 2.34.1
>>
>>
