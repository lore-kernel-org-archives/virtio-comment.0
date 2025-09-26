Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011017.outbound.protection.outlook.com [52.101.52.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FECCA4B
	for <virtio-comment@lists.linux.dev>; Fri, 26 Sep 2025 12:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758890826; cv=fail; b=p/EoiiabBMmuMAkU0XX0Q8mmbo3Y0oKaU5Yvx+1UckQjfxgCqh6z0TSneVnReB4aDIZgBDMqakUY7cxT3xWzK9iZx2cQM8mNUJ6shX5HUaXBkesgLV6T2jL9/WSq/wlAvRDA7AFaDaIY0Uwu9QbJYQp8xfVf3pBsTr5Cft80np4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758890826; c=relaxed/simple;
	bh=VEUygtDk0G3gu5eCLOev9UcZahM+vQY0AzAvj6ZdSMU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FtCvvQSuD3pdosjdJawHvjAdV2+aouoGqVnLHdKRcE1dlwmkeqiysCZuMMFp8myKlEWikrIS5tvZp++vnX7v3aG0/ZTiqGRULTY12h+GkYxiIoSQnNm6y4VVeB9mFwOcHTy+QdbpTZ7xlYXu29X+3+Uj+CeefJNSkoURarew7I0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WjoyQgYq; arc=fail smtp.client-ip=52.101.52.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WjoyQgYq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8L/If2XywwQ3m5e6bNFTSTLWPDmYeDoWmmFuxEwzGTcRIpnr6yOk+zFv3K44lqRn9aAPwdGpuO/J6NMvkpUgPTpnvexb48WFtw3rqK7m76O6QAHLorcRjE/myDAA0uhK08pv48wfuTPltMyS1Ws6CDhKAubGxo1mZLtY8N+5w+XdWQZHwg4hL2FIAddRQOgXe2I4qEvukMPbgpz8I6DkUFqYvuKdv2lz5AZe869Phi5cIbgj16MJryPK+2B86LfJBfV9yXnmpXLgloHN6CiIqHh/grMLk5ZjurOK7FyZlQQ/CpvcmN1v2rn8hR2TtZis/sYVWZEGdVhuTTzqUSXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEUygtDk0G3gu5eCLOev9UcZahM+vQY0AzAvj6ZdSMU=;
 b=uJfMA7f2X9zDe5FYHti4wkB3myL6n53VrCE1A2jmJqBU5chaMtHOfHWWENatO/DNw3Zo2VRYY4C0fbQvpdUXuQKJnjiAsQhvpp+L5agVBfRQjh0vOgQhxqJI1HCFMioX9koS52jN5J+GF2pYwG7t0iSx9EjudSC+ZPqlPTfwBLyvqlrA5EV1ZJI7SKH1qacV89PcFOpZpfEdIKMPNg6pX+0uYr5XTgmvpyy3g+igPPLwW4zQ8Pz/MOiqscxMmhUpDuJwDAavRtlmdU7N/XKSRUeMcBrXhnWg64ANlGewI/CudiKoOltlJ880gDCx09c9HGZxtO4zn9bu3X+g7twfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEUygtDk0G3gu5eCLOev9UcZahM+vQY0AzAvj6ZdSMU=;
 b=WjoyQgYq3X9FYx6FuvjL8Z1xpDxpT+7KzDYFhhfz4EylZzFc+dSYv0CriQRMtp6BVDPrAxabRsAOoT6+AF3Om4g5uu8AO3TfEw4/3K0IHbss8rG+YoMMaUEVlO8h4Zaj28MzWMBdisKJBRglo3ucQ8x7ebya5b9ecPwWT5wuWzDQhcOvv5h+njq3rNBHSU1VkzcEhTh3w0SvjzxZJlMjqRxX4UiiXpaVa5G/n1WmwIf90kjDUPSMkcmJU9XHTfJUk0EnXtFhMcobbh18ZKVmc0wHMfbCQYjfkkUbMAib7Oi6uTfugNFGGMF2POw+hXu7HgkJDhOfx8JRN8INmrVGeg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS0PR12MB6608.namprd12.prod.outlook.com (2603:10b6:8:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Fri, 26 Sep
 2025 12:45:37 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 12:45:37 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "cohuck@redhat.com" <cohuck@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Subject: RE: [PATCH v5] README.md: add example email for TC vote request
Thread-Topic: [PATCH v5] README.md: add example email for TC vote request
Thread-Index: AQHbmY1XuaNg0a3bckuX+fwMWZEJl7Sk3/IAgAGzzWA=
Date: Fri, 26 Sep 2025 12:45:37 +0000
Message-ID:
 <CY8PR12MB7195B666399E7D7A6AA18B49DC1EA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250320114326.2075821-1-mvaralar@redhat.com>
 <CAHYGQ0zWNkFyrUC=wRxN+KG+Cu6t=2nOO3gCEhFiTUrDpdSnkQ@mail.gmail.com>
In-Reply-To:
 <CAHYGQ0zWNkFyrUC=wRxN+KG+Cu6t=2nOO3gCEhFiTUrDpdSnkQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS0PR12MB6608:EE_
x-ms-office365-filtering-correlation-id: 0c7bfca4-4eea-4dd6-8a29-08ddfcfa97e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RTdzSWhPazd5azVBQW5mdDFMU3I2WHVBRitzNThOYVo1WnIycVJaVUJuSjlu?=
 =?utf-8?B?N0VpbXR0QjhNN0Fwb2lmNEt4OEFxcU5GeDAxRldhaDdJSmJSYWZRUEh4K2Qw?=
 =?utf-8?B?NXRRTWJ2cFBNaHhOM3dXUzUyWHRSM0p0TjNSWVJHRUNRSU1hN1NTLzJvd1NY?=
 =?utf-8?B?bTYvR1JkbkRxZG5nU0RZZXVWUDcwcGJTWUJmQ0ZFdWIwaHRvOFlzR0V6RkZE?=
 =?utf-8?B?MGJ1cVFrQjNsMHlwYkl4d2picEZpZUU2djdsa0ZnejJxU1lpNCtIeUpObmoz?=
 =?utf-8?B?amFjTlJ5czRlYTdjMGRlMkd6YW8zOGdpUkdNbFdzaG5HaXhqbkFwVTltL0ZF?=
 =?utf-8?B?c3JOUkpmRDB2OWlTM3pYcmhSYjFScXMyd1FwZDhtREU0eUNGUElhNzJ5aUhs?=
 =?utf-8?B?ajcrV0dqSENjVkZhcUs4dUsxQ2lYODNNVHVDanNMSHB6anJ1YU1KTW1aaGJY?=
 =?utf-8?B?TUg3RTdPRlIvcGJIWmRpNzlUTjVjRHNRVGtSRytLbWpCVjRobjJQRnVrSHpP?=
 =?utf-8?B?VFdnQjBySEEySlAvcTE3anptVGJuMlJkNTdpVjVKRjJwQ2MvbDRmcWxXVU9Y?=
 =?utf-8?B?MWZmOEgrNkx0c28zTHNkZGg5a3YyNFlxOG43WllrTjRBaG05bFRmamNrbGc0?=
 =?utf-8?B?bE85VmJzc0lVVmVtMU9OUm1PenlIZU5CZUVOd2RtYWd0NlhnRFNyaU11QXk0?=
 =?utf-8?B?Ym9HdFZaWHNjYmpnZXpQWUVwSzU1YmFDTnpJNkphQmE3dDV1SmVWRzZ5U2Ft?=
 =?utf-8?B?OWZKaldsWkY1eU1tZTM2UkMxZXV2UGc5emhuR0Q5cG80aVhEbVdCbThUeWY4?=
 =?utf-8?B?Q3lxYjJTdnJhZEhRNFFUNkoyRUx1YkVaRDRIZUU2VENqQ0NxZS9PWnhma0hU?=
 =?utf-8?B?OHNtYk11M042Wlp3YnV3ZFhIcnI0SWVya1dzMWVEM2Rlb1UvOGdpUUJObUN4?=
 =?utf-8?B?dDk4WFBQMDVKb1k2bEYwQ3hUTVV5TEc3djZQaTJ3ckRDMmhhMzcvRmM2TVdo?=
 =?utf-8?B?NDlUSFJxZnNkRVdXRGpDZG0vWVFhVDF6ejdobFNWdmtPQjBWOW41KzR6RnBn?=
 =?utf-8?B?K2xUYkF3WkpFK0V1TGo3NDkxN2NRdWVlNXlTVFRJdFhUZEl6VXpwMVFJVHNk?=
 =?utf-8?B?WWtTMnJrMUczWjQvZmVKL3VnemJGbGxqdk9NSE1odzdCQUhQVzMzUkZrOGhH?=
 =?utf-8?B?M2l2L2c0amFTbWtJZlJJU1N2eE5GY0Z0UkRSQkJqQUg4bVI5QkxYK0NSbzd3?=
 =?utf-8?B?SExCcjFPSlFlUGM3QnBjNlZCWmpsTUlvdFJ3aEJRWGQwWnY4T0ZldVRBOUtq?=
 =?utf-8?B?RldraU54OXRmb3BDRUZtdWkvc3oyZ3IwN0pLWVQ5MS9UYk9oM2ZqOG5lQ05w?=
 =?utf-8?B?S3BubllWRGlyK3o0cUZVdi9DSVpVQmt5V2dZRGloZzJrRVVUbHd3M0l1Y016?=
 =?utf-8?B?V2txWWRzN2dlTkxRWkxkUVpleTBPaytoQmJJS3pxOXhiSUltUjlXTUxiRVFY?=
 =?utf-8?B?Q2s5VkxSN3NDNHhkRzdtTndKS3AveTdKRG80bEpNWThBaUhuVWJUSVNMQlpG?=
 =?utf-8?B?Z3Y2ZjgvS2R1dDhyZXNibWtuTFB2UXVkZ3lnZWxjdlRwekRzS09NVlZoZUJk?=
 =?utf-8?B?MTZoOENldS9UVHk2bGFwMVdIdnZ1VzlGY0pTRUpza0NIT0prUmdORUNjc0ps?=
 =?utf-8?B?VmEzd01ydDhLamx1UVZVcmFuZjFodXdHc3RQRXN0Ui9YYWxNaWg4dHdCWkxQ?=
 =?utf-8?B?QTByYXVtSEJhbDJvS0lBKzZpYlprc3ljcE1Yd1BTVTZlTk9LQzdMTUVva1ly?=
 =?utf-8?B?YmlTa0pvbVk1T2Zlc2lzVnhIaTJxRXUrVFlVTXZSYnRDU2VLdXpqU1B1U0xs?=
 =?utf-8?B?bnk2R1hoN01GN2RHUEk1ZEs0SEYxcHErektXWGVodDhkM2dWQ2czRnM5SG5E?=
 =?utf-8?Q?H7nOzfi5mcQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aXZxeTRmbmR4SG81TlhLaEJsd2djN2FYY1luV1N2UURDL2oyajVUbFdjWkNV?=
 =?utf-8?B?OE92K1VFN3BTSSs0YVZ6Z2FrT2RVN29vYVlwZmZ4eUJEYjdUVEd3OHNPczI4?=
 =?utf-8?B?byt3dGZmb3VkelVNaElJSzVaSW5scG1Ydnl3RElTQ3R6V1VZZkZzZGJyaGkr?=
 =?utf-8?B?UTEzYWVPNHNBa05vcFM0VHlqMnRDQnlVQkhid2dZNnJqVXNSMVFxQmphWW54?=
 =?utf-8?B?cWJJY3FuNzEvTzM2c1VESVNyb0haT3FoZHdubm9YS3JsTFVSUEcwL080OTFi?=
 =?utf-8?B?WUNKMUJLd2VSdE9JWmwxYXNZWGxWTEJSMmxucVRranFhejl0aTRNT3Y2Tjdh?=
 =?utf-8?B?MFpaWDVIckg1alBIcWI3TUJjam5DWlhyTjYxOWJtWjA1UHpqMzQrbXdUQktK?=
 =?utf-8?B?YjhqMElIUDl4TFdjSkVueUR6RXcrK2ZXc2hYTE4yaUNMNWsydUM5YnhhK1Ay?=
 =?utf-8?B?d3JycGpENHJrV1kzc200R1dFZFc0VUNHYjA0M1huM3NtUTNkdTBVa3ZEVFUy?=
 =?utf-8?B?RVVCQnZTLzR6bjQremgvOEdwYitVNHc1TitaSGlITHUyNk42WWtJVUlDSWFp?=
 =?utf-8?B?QlhSZkcyeE5ZdTBPTm54MUNaKy9wVThMMExwRFBWRzFPdURiOWdwL2Q2UVFj?=
 =?utf-8?B?bEpCeWJybHFLeW5TdlBDZDU1YWYwTFk4M0lqUEg4RGJJcWtmNHFPbUg3bVNn?=
 =?utf-8?B?c1hYTGZzU045TjZWaXNCS3JEdlhHRTB1RUNlTE9KaHp3eFhyYThLYzZ0d2dB?=
 =?utf-8?B?WmxtNEhjT3N0Z0xxb3pFdUcySlJwbEIvWUdlYkhMbmVkUEwwOEZ2UmZaZm4y?=
 =?utf-8?B?OEg5MlVheVcyNHR5Q3FJWTh3OWp6Uk1zYWU5S0o2Wmx4amdQOC9ucExWVW1s?=
 =?utf-8?B?ZkZ6NUlLTWdDb2lhQTc0VUF0dGpYK0NPbG1RaS9YcCtZMTZ1R28rQTY0SWs2?=
 =?utf-8?B?dCtMTi9wS2lNZ1JhdktLUUJtTVZnUWxKSGtPbG5NNDcxc0RSNFAzTEwwRHha?=
 =?utf-8?B?T2lQOCt1U2tlTGYvSmEwOG96UFNib0lGT3huS2ZNZHVNcnRBNFJzd1htMzBC?=
 =?utf-8?B?T29XQUdyeVN4UDA4bU5vRFhKNUdSRTdGdndTRjlQU2NVdWp0VEZXYnRacW5i?=
 =?utf-8?B?L05OdXhWMldoYlNwNGNIOUR2anhCQVNwdkovMysxNWxYQXZoeFRIRmZNNEdU?=
 =?utf-8?B?RXd6aWZXdkJrdEplZ1BLajU1cmRwdVIvYy8xSms2ZWFaRkVXODc1bE94bXVE?=
 =?utf-8?B?Q3EzbUZLcGFsV2I0OUZsVVkrcUNYZjhEWkhCMFFSOFhveVowY0FoL3VuQTQ4?=
 =?utf-8?B?SjNCN0drbzRISktjdHoybk5aL1pMUkRlQkplcFhCQjlaTFNpTlkwakE3QklG?=
 =?utf-8?B?eVlIK1hMQmc3dzRoYTJvQzFHdnZoQ2w5aE4zV1dlckdMQjJNckZ0dVFLY1B6?=
 =?utf-8?B?a1pObmZuSEFpWWI2QTljRVBsSjRuMTkwQnFxVVM5dWZ3T2ZSWVpKdDRrSmkv?=
 =?utf-8?B?RHVpMzN2WEZINGNGTWlUVU1QL0tDek9FMkxHeksyeFAwMk93TzI4SXgvR2dZ?=
 =?utf-8?B?TlRkdzNTbjlLQkN1YUYxekdUT011Q0F5dUpqVWNwa1lBenNoT0hPQW1BVkJY?=
 =?utf-8?B?RGZqL0RvamFpazNrajlTM2ZDL0UzaWJSK25KSmpJa2JPcVVxWkhjY250VHVy?=
 =?utf-8?B?WjBHL0ZnYzFzUG52eUovbksxMGg0TTM0aW1tdFJKWjZTUnZBWmpDYzE5bVMz?=
 =?utf-8?B?WjRZRlkrU200NG95NzhlZlYzWmVLUHAvMDZoZjJFWXJKNlcvSHNkMjFCOWRz?=
 =?utf-8?B?UFNBb2ZXaHlBd1J2RTA1Ti9oSytsVkJvOEhrRzdtMzgzZk5RSnh4UmwrcEZk?=
 =?utf-8?B?Y1pIb00xZzFsYXVSbjVrQkRxZU95K1c3MUJESmhhSHpwdnQwc1Vwb2E2RVBX?=
 =?utf-8?B?ZE1iVjZtclZRakdSRjlOZ0o4YXlhWjRvTkxOQW1GN0tmOFFsVUtIT256UE5x?=
 =?utf-8?B?VXBsNzVRT1lBRmY1UmhqZU5jaUhPSlpBNXZPSE1ZZjh6YmQ3ZzFCV3dKYmVW?=
 =?utf-8?B?bXBKZE1VWVo0aGliRitNSDBmZlMzd1VMUTBPZUFzeHBXb3l3YlJQeVpRd3pT?=
 =?utf-8?Q?gzD8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7bfca4-4eea-4dd6-8a29-08ddfcfa97e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 12:45:37.6386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +zRkB0ftKyZ08r9JNmQ3UH0g7XOXOk8TZBlunwu0xrPPE59elYuCMmhpToEwUzEruKiJJam0qUvsXfRb2eFCgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6608

DQoNCj4gRnJvbTogTWF0aWFzIEV6ZXF1aWVsIFZhcmEgTGFyc2VuIDxtdmFyYWxhckByZWRoYXQu
Y29tPg0KPiBTZW50OiAyNSBTZXB0ZW1iZXIgMjAyNSAwNDoxNiBQTQ0KPiANCj4gUGluZz8NCj4g
DQo+IE9uIFRodSwgTWFyIDIwLCAyMDI1IGF0IDEyOjQz4oCvUE0gTWF0aWFzIEV6ZXF1aWVsIFZh
cmEgTGFyc2VuDQo+IDxtdmFyYWxhckByZWRoYXQuY29tPiB3cm90ZToNCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IE1hdGlhcyBFemVxdWllbCBWYXJhIExhcnNlbiA8bXZhcmFsYXJAcmVkaGF0LmNv
bT4NCj4gPiAtLS0NCj4gPiB2NCAtPiB2NTogZHJvcCBzdWJqZWN0IGFuZCBvbmx5IGxlYXZlIGJv
ZHkNCj4gPiB2MyAtPiB2NDogYWRkICJbXSINCj4gPiB2MiAtPiB2MzogdXNlICIoKSINCj4gPiB2
MSAtPiB2MjogYWRkIFN1YmplY3QgYW5kIFRvDQo+ID4gLS0tDQo+ID4gIFJFQURNRS5tZCB8IDgg
KysrKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL1JFQURNRS5tZCBiL1JFQURNRS5tZA0KPiA+IGlu
ZGV4IGMwNmNhZjYuLjBiZTM4OWUgMTAwNjQ0DQo+ID4gLS0tIGEvUkVBRE1FLm1kDQo+ID4gKysr
IGIvUkVBRE1FLm1kDQo+ID4gQEAgLTIwNiw3ICsyMDYsMTMgQEAgVGhlIG1haWwgcmVxdWVzdGlu
ZyB0aGUgdm90ZSBzaG91bGQgaW5jbHVkZSB0aGUNCj4gPiBmb2xsb3dpbmcsIG9uIGEgbGluZSBi
eSBpdHNlbGY6PCAgPGNvZGU+DQo+ID4gIEZpeGVzOiBodHRwczovL2dpdGh1Yi5jb20vb2FzaXMt
dGNzL3ZpcnRpby1zcGVjL2lzc3Vlcy9OTk4NCj4gPiAgPC9jb2RlPg0KPiA+IC0oTk5OIGlzIHRo
ZSBpc3N1ZSBudW1iZXIpPC9saT4NCj4gPiArKE5OTiBpcyB0aGUgaXNzdWUgbnVtYmVyKTxicj4N
Cj4gPiArRm9yIGV4YW1wbGUsIHlvdSBjYW4gdXNlIHRoZSBmb2xsb3dpbmcgdGVtcGxhdGUgd2hl
biByZXF1ZXN0aW5nIHRoZQ0KPiA+ICtUQyB2b3RlOjxicj4gPGNvZGU+IENvdWxkIHBsZWFzZSBv
cGVuIGEgdm90aW5nIGJhbGxvdCBmb3IgdGhlc2UNCj4gPiArY2hhbmdlcz88YnI+IDxicj4NCj4g
PiArRml4ZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9vYXNpcy10Y3MvdmlydGlvLXNwZWMvaXNzdWVz
L05OTjxicj4NCj4gPiArPC9jb2RlPjwvbGk+DQo+ID4gIDxsaT5QbGVhc2UgbWFrZSBzdXJlIHRv
IGFsbG93IHRpbWUgZm9yIHJldmlldyBiZXR3ZWVuIHBvc3RpbmcgYQ0KPiA+IGNvbW1lbnQgIGFu
ZCBhc2tpbmcgZm9yIGEgdm90ZS4gPC9saT4gIDwvb2w+DQo+ID4NCj4gPiBiYXNlLWNvbW1pdDog
MTI0ZmNkMGU5N2YyMDlhYWIxOTYzOWU3MzY5MTE2ZDk5ZWRlMjJhMg0KPiA+IC0tDQo+ID4gMi40
Mi4wDQo+ID4NCk1lcmdlZC4NCg==
