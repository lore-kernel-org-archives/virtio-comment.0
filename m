Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A304139D
	for <virtio-comment@lists.linux.dev>; Sat, 15 Jun 2024 04:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718426018; cv=fail; b=XpsWaH057bM4lODaLAw3rNNHlhSwHKQzvLNMqkLKEkwemrH/9WrvyHAT03iD9AGSZZoFdl02eXCpei1WR2YTundIJYVCGhaN6oMXwzXXp/n+Aynq27fL02XObjixOuqint9NHZpXXcgIfXBmlEKGPsduTu1HDxHE8D6plRr72uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718426018; c=relaxed/simple;
	bh=TZZgbzJCu8p+fYFCO3qS3jfFIcsNGJe0aOHSUQhhGrE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JwHRHXN/9dc/ftcOrh+PsB+hKaV/jhIVQ9yGFUHT7Q7OSzYhtM7qYFd2f58DrtfEGG1myYi5DbISZFhfU7V47S6M4mVXx0mSeU78caErPw5hStcJEJz/8n4+nMNqcT/zZbYj6A7x7RpnjTBLP2+ZZqqVynSBbUd3H9i9F4VQUkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T3Q7HdME; arc=fail smtp.client-ip=40.107.243.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T3Q7HdME"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuHjXhg5aUTyxeu740MvBNCYVbNTKrYPYcwQAKVQ1Xi1k58wrFNxY462TZL1f8Hj95kMm4eycpyXL1ulJo3OyWt5JtG0+gNKyqeM2ozubRUEPDHtrSy7b+QuBNH8/veyesuahDR9nZ7JmF18UhMfQ82j0iS5aqBxUZ6++7qQAIxZa23k05BpTm/wYoGngtpDH3bIxLAGGDog8jfLK9XcR5GLCRvDMvT/sfQ6odIPNERlW9cH2+bHAdLxrCVGYtQpLSje/NOIrGE+EvJdRPrQUrJIC3+g/a5i0o4WX8IA6qzeqRj1kaImvK+5WdiZNXkGSfALOS2h3z6CRmyNb2ykUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZZgbzJCu8p+fYFCO3qS3jfFIcsNGJe0aOHSUQhhGrE=;
 b=f/X3aDNiIulpPRG3anNZ4GCW2Env/AiSDwkanizDBv3kO5BDaFaRiMcROiRrNepfH5vCWjsyCmDUjjExUwMxWH+Jgn6xPXp3OMfGGQc/mZRvnXTOvQqaSgg0EwCPTxKA70Jg1724q6V19cmP4Y2EMPs7Np+hixSBINLgeQiaRAzHBB5QWu1bqZAwQp+QQOUw2NfXTpX12uonL6hsrgtXKNC5xfH82JPhPOPHje01UsGUpjrKQ08qJQzLILdlJ/r1rDaSLk3TEmVf2SBl4ZGj5/A/JX9LZQPw1H/kLRyXrYLab5cro49gL93nEhxa6gh5ANQ9vqmmf+QgpdCc9nHqcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZZgbzJCu8p+fYFCO3qS3jfFIcsNGJe0aOHSUQhhGrE=;
 b=T3Q7HdMEIipE5kccsQMokk/4AkDJ88H2yP4ZOC6zMZmwPjVkkijA/RNP3WnnmoeBR3EYhSBuI0b52QvKSDQEoYHYAD50OZwEtz0t4/UzZ1m0PCG6u72N9EdWgpw+t9h9cE9xLwjn1u6/vvuGeLfi40vL+lWfVSnYehVS0ozR87nj+tjvG77UYiBotPoXmSy+DfYo7lnl+OuXtwhaCqSW+ckxZ31145CNrigVWyiRNKsF9x/zrA/6B/qCjjqd7c9qGseNnllm6+CbzdQagT7ke5weAPGUhDtfXh21vb9sxi8fzQz83MmYqPciuZXGPcKd6FrxaLKaU56q500ikadWeA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SJ0PR12MB5611.namprd12.prod.outlook.com (2603:10b6:a03:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.27; Sat, 15 Jun
 2024 04:33:32 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7677.026; Sat, 15 Jun 2024
 04:33:32 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, David Stevens
	<stevensd@chromium.org>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Cornelia Huck <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?=
	<eperezma@redhat.com>
Subject: RE: [PATCH v5] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH v5] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHauK5veGmfTEYzl0u4eTEkaSch67HBLmKAgADZnUCAADjDgIAABE1QgAAOSoCAAAA+cIAACrUAgAAEsSCAAX7ugIAADIHggAAHPACAAA394IAAEL8AgAEnjgCAAENfAIACw1Uw
Date: Sat, 15 Jun 2024 04:33:32 +0000
Message-ID:
 <PH0PR12MB5481C44455741A4A1F36C8FFDCC32@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <3319f7da-5c1f-48ff-916d-03791edf1783@amd.com>
 <PH0PR12MB548190E2CCAED2E01410F79ADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2657c74f-1caa-4e5e-b767-b16e059247ae@amd.com>
 <PH0PR12MB548198E64803B0A7D9389E9FDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2f9636c7-06ca-49ec-ac86-f8a2f1f97b4f@amd.com>
 <PH0PR12MB54813032E8F5B0DA32BA1B23DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e25f93cd-baa3-4a54-bf9c-1fc27fa95c41@amd.com>
 <PH0PR12MB54818F69437BBA6D533ABAF6DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
 <395ddde1-f8e9-4b6e-bf90-2f9c42406366@amd.com>
 <DM8PR12MB54804F81E1673C09213A4302DCC02@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20240612081135-mutt-send-email-mst@kernel.org>
 <CAD=HUj5oeJa3Przmsd+MYDO0AAEhs-4sDvFQoiMhVTjnveNONw@mail.gmail.com>
 <40c1d6fb-c04e-41b4-a4d3-baf36aba7d15@amd.com>
In-Reply-To: <40c1d6fb-c04e-41b4-a4d3-baf36aba7d15@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ0PR12MB5611:EE_
x-ms-office365-filtering-correlation-id: 655f3337-9030-4b5c-00a9-08dc8cf4503b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?NkxzWXZ1VDRNZVFFZVYvdjIzdWh5dTdUMVkvVlhzT3JySmJsZlJndGpWQjE4?=
 =?utf-8?B?RDdmeEh3akJWcG82SHVXWGtsc3htNnA1dHF4Y0ZZMHhITGFWcE5taDdsVW9C?=
 =?utf-8?B?YjFMVjJvaHFvR1IycTdOS3ZmM2pvK0xMM0RZTCtZcjdIZEcyZkVvOXlhNlNE?=
 =?utf-8?B?OFlVeXprNENYaHdLbGxGL3Bka2s3YUdXSHlzdUJMK3hqTnY1MVpEM2RjQmFX?=
 =?utf-8?B?bFFlU0NJZjZUV0VhbkNJOE9MWGpreWZsWk1MelQ1RTk4Zml4bnVtaEtQbzlG?=
 =?utf-8?B?L3BrRnNlNnV6VDZKSjhzMnZFLzdxTm9MTThMVmxrMDV5cW5xTFdlVlJlaWl2?=
 =?utf-8?B?S0NBN3MxaG4xNmNNNjVYZnovOW1PU1ZsTG5aNW9tN2lEbDBIUy9POVFGVmNE?=
 =?utf-8?B?bUVxbytEYmhCSytIVWlySDNIQzZBenJmU3Y1bEpMSktxN21DMFlsYWVPTms0?=
 =?utf-8?B?U0gwd3BDejhtMmxKc2dFNGc5b1dkMVQ2L1h1RGNMY1Y1VlRFdlRzY2tQbXpU?=
 =?utf-8?B?b09sdERUaTUwUWZZUnRkbm1UU2hWZTF5b21RRXBvVFpmRGVVQmJieUtjREZJ?=
 =?utf-8?B?dUk1cytyUHY0N0VjSHVtV3I0WmFrN3dPcG1ySi8xbjJNRU4xK1JEME04MEFu?=
 =?utf-8?B?ZlRTSnc1NDVrSWV1SlF5QUE5d2FZbmVlMFdHL0I0TGRQdHZ5Z05zc21GODdx?=
 =?utf-8?B?eTN3OU0wNVBqS3RRRUlJbytmR0FvclZZcU1YektTRTlHT1Q5OUFlcTBWWi93?=
 =?utf-8?B?ZHZ0cmx0d1QybzFwVG1QSHRjZ1c3NVZpRnVDOGV3eFFPRHNSZTk3SHBlQmp5?=
 =?utf-8?B?aTl5bWc0MkNnN3pLOGhmMXY2WkJvTndTK2t0ZFBkUW1jUlFMaE11emo2TVlz?=
 =?utf-8?B?QXNqT2FXSFpxcEpsRjRINVZmWWVXNzdqdGVkYUF0K0hham1vR0lqcmFUVGRW?=
 =?utf-8?B?SHJnSEZoOEFmQ1dQVENTRDhpckgxQkdHU2I0T0NWN0tkNkkvV0tuOVRpSVFt?=
 =?utf-8?B?U0ZNeHBQV2xiVzJuN2taRVViV1pXRzh3QXV4WW9BNUJSWkVocVFEd29pc1py?=
 =?utf-8?B?bmxWN1o2WWswY0tDTDBZWEtUZzhCNGFoYnNQOStERDdoYWxMVE5YRVAzSS8y?=
 =?utf-8?B?N2g3WnFOVjBQWGJGUkhKTmZNN2pBMmdvN1RzZHNnbFBXZzcwVEVaVUdKbEp2?=
 =?utf-8?B?V2RETXVJNlVQVk9YdGhmdEU3YWJISHZSa1NXZTgvM0UrMlNyNzFkSFhod3lH?=
 =?utf-8?B?N3o5SVJRWkNMU2xnNHZ1eWQxVW9rQzJWbjZOVTExK005ak1DcFZ4UU1kS3FY?=
 =?utf-8?B?NmFhVnhWRTUyMDNGbisvcU9kUHkwbkUvY0xNUDUrZjJOUmVHZ1RYYldKUldE?=
 =?utf-8?B?MXhiOWFoaHcxTTcrd3ZQT2hweTFIQkRJYlB1dXlOcmhqZmtjUzlxbWQ1eC84?=
 =?utf-8?B?ZG1SbC9ucDl3R2ZYQktUVGJGTzczdEhjSU15MmRrK2FpNDNmcjQ2bFc4Um82?=
 =?utf-8?B?NHIzejE2NS92U2M3eldNcGl2M3VYUytDVlEzVEtkNk9STVRPVXhQeVd2cEp4?=
 =?utf-8?B?dTlrcWFwMkRlZUFXTHlNNG93b0ZvMGFIWFJRMVRabG1BS3dkSzI4TCtGTkFP?=
 =?utf-8?B?TkRMTExsNldZUU11dEtGenJiRkd3ZE42YjJYTlJWeXdiRDd6R0RPdFlNc3ph?=
 =?utf-8?B?c01qcmkybGlwVUI0RFZTSzdMZFJIWHlCQlJlWlhxbDNEZjZBZi9adURhVk9D?=
 =?utf-8?B?eGhhV0V4L2lxUGlMRjV6aXpCbXMrdm4zeXFaOU0rK1BYTXRYVzRLVGNNVUcx?=
 =?utf-8?Q?JDcQDXx5h4BZcJDNoBK2NTfxt2j2Mlj4TfFK4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Yk94S0xDU2pOcnA2bVB4VjF5UlJSM1ZLMnpQQkNmemxPTFNjS0xxRE5pdVUx?=
 =?utf-8?B?TmNvVXU4ODNJVVJYU1BCYTZ6UWNadUpiRVJUcFVXMXQyZ0VremZxTGtWVkNh?=
 =?utf-8?B?UjF1dXBWcE9mMVJkczFEWUlGcHlETGhmZlR6TXp3TmM0L2ZDVDMrQm14ZXdO?=
 =?utf-8?B?VFJETkwwL3d3WndZd2xaa1p0T0wzZkZJNUYvTExNWGlnMTN0d2YrOEkxaTNu?=
 =?utf-8?B?S0s4dEdxZnZqUE5IcVZqVGxTUjRJS0xGaTExd2svbEN5UUZIQUNYS1ZRenZF?=
 =?utf-8?B?eHhNZHB2SVQ4TGN1OUJTZjBmZ09hY05zYkZjR0x3Y2psT1Z6RWxZTm4xRUpZ?=
 =?utf-8?B?WCtOK1U5S0YwcjFPeXdrbVJMbndkMjZ4UTFTd0xUcWNoak1KSTZXT1ZFM0hB?=
 =?utf-8?B?UUF6enlNcXUrbUZLQ0ZpekhDSitnUmpYb3BYUi9LZlYxeVFNd3hSQnZmR0Nw?=
 =?utf-8?B?dXFoNDlQc1I2Z01EN2M4QnFhbHo2V0ZXNDZlKzJ2dnF0V3YzSzdvaHl3UDJK?=
 =?utf-8?B?OWVVTnFwd2N6dGRFckRxVjJFN2JnSUY0R0VoWVRRSkNHaTZheFZZK3htdjBn?=
 =?utf-8?B?dW5SUmRYdFFtd0g5TE54QVNSZ3puRThNdUZ1TDJJRnhmMk03ZXhQcVh5ZWNr?=
 =?utf-8?B?dENKTnh4emJPSXYvWUxoVkl3a1lvZ25hR2dacGZSTjNpSTlSNytBNWJFd1dH?=
 =?utf-8?B?aDlJTHZITmlCdGtOWlN6V2VmL0ZZZ2Y0QVRtdDE2U3pOVytEWExWWEVvY005?=
 =?utf-8?B?Wmh5RkY0aXYveTFuczZ0d3N1aVpBci9hSlhZUnBJWkYwZmh2cUNwZkQ2aGZn?=
 =?utf-8?B?dHVSRkFLVXZpM3lsb3hlSmZYeHBHd3dmZFViTG45WXVJUE1WMk11TVBDSm9w?=
 =?utf-8?B?Rmg3UWMrTW92M2cxR0l3dEp1NjYwNHFEcDVQTWN5VWRrV05WU0FKeEYyNGM2?=
 =?utf-8?B?NXhZQ0JFdHFPUHVOdS9wbmQyNUhhWXhjWU5wYnQ2RXJ1bWQwNjB2aGpWaHp0?=
 =?utf-8?B?TXdUTG9YclVpeXIxdjFQd01YQXZVSExVYm5RV3hnbFJIT2o0YW1aV0dSVlZX?=
 =?utf-8?B?WUF3OWlxY1hVcmZWanYxbUIxLzZKTnZGNTFOQ1BpSE1zQmJneXphbS8yNnRa?=
 =?utf-8?B?dEY3bkhBOU5VZ0NLUW05ZVZNK2NUQnRoNmdxSjhmRlJYdTZIZ24xWE82RGRP?=
 =?utf-8?B?UWdMekhFMmkwVGhsNFZxUGRONENvMUJtZVpJelY1MWFHL1JHbkl6eUZqd3dH?=
 =?utf-8?B?QkpYNGs1aU5jdTNxN2NSVmFjMXJTODRVRTdSSit3Tm1OTVJsUHpCcGRWU1BT?=
 =?utf-8?B?VGZSczBjc1ZXV0RXZ3FJY0dxNXpsa0hqL2tvOHVBTVl3KzhlVVN2K0pVT2VJ?=
 =?utf-8?B?UzZTbGZPM3doRUdzeUJuRHgxU3JwaStKMnl6aEpWSnhPUHBONkhwOGJGZHhQ?=
 =?utf-8?B?cGNzd003elB5SzJwZE1PaWhIelAySXBuZ3ZrQlgyY3J5UEJuQWpkTEwxV2Iy?=
 =?utf-8?B?S0kvRmxvcXdpT2xHOENXT21qMnFWODhXMXg2T0k4ZkpEQ3NvUDgzOFNaQTRV?=
 =?utf-8?B?Y05mRWxWWjhweGYwbnIwYUF5Z0FIZzkzbFRBdTlRZFpNTXJSVGtjcy9oTFo4?=
 =?utf-8?B?TDZsODFPSXhYSlVub2FRcFgvTWVDMHlJU0RXSHJUcW0zZzJYWXVpZ3BPQ01y?=
 =?utf-8?B?UTNTazArbXdoMHRybXlqM1VxczFReEJDWGtabEFNVzJxY2t4dnZRcUJucUhm?=
 =?utf-8?B?dkZmSFUxa2NMTEZnZWM2dGpiVmZXNjJTc0hnNnhIZlRIbjJreU11SE80WWls?=
 =?utf-8?B?ZE0vTmNUM2NSakxtTjdhZXhITDJDa3NXTFZzWWV3U0thSlVZWnl2aWJ1UlQ1?=
 =?utf-8?B?L0RhaVdGZis1akxIaDAzY1ExcXAzZFNoSjAyaFR4cjZvMlEzbVAxM1V0TFZT?=
 =?utf-8?B?TGE0amV3WnJxakVYRmZMY2xJYkhuSkNTU1JSNlZrNDM3V1ZUZmlpNTR6S28w?=
 =?utf-8?B?UmlEOW1qTmt4TXJUV000TThmelJFTnJzTHJtVUNEVC9aZW5taUE4djNoRVZO?=
 =?utf-8?B?OEc1YlhuQlVXaVUwYTlQc0g1Z21HSjlqNUxGbkJFZXBuOWk3RndDU0Vic3Nz?=
 =?utf-8?Q?EqPg=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 655f3337-9030-4b5c-00a9-08dc8cf4503b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2024 04:33:32.5497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nxnj0mEvsuoQxBS6oI/yXODOt93L0HLL9HX/uEm1aDZxmv6UMgfPsIlMKDRYRu0QPAcLqLChyWeAbMX7g99gYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5611

PiBGcm9tOiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBhbWQuY29tPg0KPiBTZW50OiBUaHVy
c2RheSwgSnVuZSAxMywgMjAyNCAzOjI5IFBNDQo+IA0KPiBPbiA2LzEzLzIwMjQgMTo1OCBQTSwg
RGF2aWQgU3RldmVucyB3cm90ZToNCj4gPiBPbiBXZWQsIEp1biAxMiwgMjAyNCBhdCA5OjIw4oCv
UE0gTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gd3JvdGU6DQo+ID4+IE9u
IFdlZCwgSnVuIDEyLCAyMDI0IGF0IDExOjI2OjM5QU0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90
ZToNCj4gPj4+IE5vIGxvY2tzIGFyZSBuZWVkZWQuIEh5cGVydmlzb3IgaXMgYWNjZXNzaW5nIHRo
ZSBhZG1pbiB2cSBvbiB0aGUgUEYuDQo+ID4+IEknbSBub3QgZXZlbiBnb2luZyB0byB0cnkgYW5k
IGdldCB0aHJvdWdoIGEganVtYmxlIG9mIHRoaXMgdGhyZWFkDQo+ID4+IGhlYXZpbHkgY29ycnVw
dGVkIGJ5IG91dGxvb2sgYW5kIHdoYXRub3QsIGJ1dCBmcm9tIHRoZSBnbGltcHNlcyBJIGdvdA0K
PiA+PiB0aGlzIGRpc2N1c3Npb24gbG9va3MgbGlrZSBqdXN0IHR3byBwZW9wbGUgdGFsa2luZyBw
YXN0IGVhY2ggb3RoZXIuDQo+ID4+IExpbmdzaGFuLCBQYXJhdidzIG5vdCB0aGUgb25seSBvbmUg
Ym90aGVyZWQgYnkgaG93IHRoZSBkZXZpY2UNCj4gPj4gc2VlbWluZ2x5IGhhcyB0byBibG9jayBh
IHRyYW5zYWN0aW9uIHVudGlsIGl0IGNvbXBsZXRlcyBzdXNwZW5kLg0KPiA+PiBQYXJhdiwgSSBm
ZWVsIGhvdyB0byBhZGRyZXNzIHRoaXMgaXMgdXAgdG8gdGhlIGF1dGhvciB0byByZXNvbHZlIHJl
YWxseSwgbGVhdmUNCj4gaXQgYXQgdGhhdC4NCj4gPiBJSVVDLCBQcmF2YSdzIGNvbmNlcm4gaGVy
ZSBpcyB0aGF0IHdpdGggdGhlIGN1cnJlbnQgcHJvcG9zYWwsIHRoZQ0KPiA+IGRldmljZSdzIHN0
YXRlIGNhbid0IGJlIGRldGVybWluZWQgdW5hbWJpZ3VvdXNseSBieSByZWFkaW5nIHRoZSBkZXZp
Y2UNCj4gPiBzdGF0dXMgZmllbGQuIElmIHRoZSBTVVNQRU5EIGJpdCBpcyAwLCBpdCdzIGFtYmln
dW91cyBhcyB0byB3aGV0aGVyDQo+ID4gdGhlIGRldmljZSBpcyBydW5uaW5nIG5vcm1hbGx5IG9y
IGlmIGl0J3MgaW4gdGhlIHByb2Nlc3Mgb2YNCj4gPiBzdXNwZW5kaW5nLCBhbmQgdGhlcmUgaXMg
YSBjb3JyZXNwb25kaW5nIGlzc3VlIGZvciBzdXNwZW5kZWQgdnMNCj4gPiByZXN1bWluZy4gVGhl
IGRldmljZSBhbmQgZHJpdmVyIGNhbiBrbm93IGJhc2VkIG9uIHRoZWlyIGludGVybmFsDQo+ID4g
aW5mb3JtYXRpb24gd2hhdCBzdGF0ZSB0aGUgZGV2aWNlIGlzIGluLiBIb3dldmVyLCBzb21lIGh5
cG90aGV0aWNhbA0KPiA+IGFkbWluIHRvb2wgaW4gZ3Vlc3QgdXNlcnNwYWNlIHdvdWxkbid0IGJl
IGFibGUgdG8gdGVsbCBzaW1wbHkgYnkNCj4gPiByZWFkaW5nIHRoZSB2YWx1ZXMgaW4gdGhlIFBD
SSBCQVIuDQo+ID4NCj4gPiBBc3N1bWluZyB0aGF0J3MgYWN0dWFsbHkgYSBwcm9ibGVtIHRoYXQg
d2Ugd2FudCB0byBzb2x2ZSwgdGhlbiBJIHRoaW5rDQo+ID4gdGhlIG1vc3Qgc3RyYWlnaHRmb3J3
YXJkIHdheSB0byBhZGRyZXNzIHRoaXMgd291bGQgYmUgdG8gdXNlIGFub3RoZXINCj4gPiBiaXQg
aW4gdGhlIHN0YXR1cyBmaWVsZCBhcyBhIFNVU1BFTkRfVFJBTlNJVElPTiBiaXQsIHdpdGggc29t
ZXRoaW5nDQo+ID4gbGlrZToNCj4gPg0KPiA+ICJBZnRlciB0aGUgZHJpdmVyIHdyaXRlcyBvciBj
bGVhcnMgdGhlIFNVU1BFTkQgYml0LCB0aGUgZGV2aWNlIE1VU1QNCj4gPiBwcmVzZW50IHRoZSBT
VVNQRU5EX1RSQU5TSVRJT04gYml0IHVudGlsIGl0IGNvbXBsZXRlcyB0aGUgcmVxdWVzdGVkDQo+
ID4gc3VzcGVuZCBvciByZXN1bWUgdHJhbnNpdGlvbi4gSWYgdGhlIGRldmljZSBpcyB1bmFibGUg
dG8gc3VjY2Vzc2Z1bGx5DQo+ID4gY29tcGxldGUgdGhlIHRyYW5zaXRpb24sIGl0IE1VU1QgcHJl
c2VudCBERVZJQ0VfTkVFRFNfUkVTRVQuIg0KPiA+DQo+ID4gRG9pbmcgdGhhdCB3b3VsZCBnaXZl
IGRpc3RpbmN0IHZhbHVlcyBmb3IgZWFjaCBvZiB0aGUNCj4gPiBydW5uaW5nL3N1c3BlbmRpbmcv
c3VzcGVuZGVkL3Jlc3VtaW5nIHN0YXRlcy4gVGhhdCBzYWlkLCBhbHRob3VnaCB0aGUNCj4gPiBk
ZXZpY2Ugc3RhdHVzIGZpZWxkIGRvZXNuJ3QgaGF2ZSBhIGRlZmluZWQgd2lkdGgsIGJvdGggdGhl
IFBDSSBhbmQNCj4gPiBjaGFubmVsIHRyYW5zcG9ydHMgYXNzdW1lIHRoYXQgaXQncyBhIHNpbmds
ZSBieXRlLCBzbyB3ZSdkIGJlIHVzaW5nDQo+ID4gdGhlIGxhc3QgcmVtYWluaW5nIGJpdHMgdGhv
c2UgdHJhbnNwb3J0cyBoYXZlIGF2YWlsYWJsZS4NCj4gQ3VycmVudCBzcGVjIGRvZXMgbm90IGhh
bmRsZSBzdGF0dXMgdHJhbnNpdGlvbnMgd2VsbCwgbm90IG9ubHkgZm9yIFNVU1BFTkQNCj4gYW5k
IHJlc3VtaW5nLg0KPiBvdGhlciBzdGF0dXMgdHJhbnNpdGlvbnMgbWF5IGFsc28gdGFrZSBsb25n
ZXIgdGltZSB0aGFuIGV4cGVjdCBkZXBlbmRzIG9uDQo+IGhvdyB0aGUgZGV2aWNlIGlzIGltcGxl
bWVudGVkLCBpdCBjYW4gYmUgc2x1Z2dpc2ggaWYgaW1wbGVtZW50ZWQgYnkgU1cNCj4gZHVyaW5n
IGhpZ2ggdHJhZmZpYywgZXZlbiB3aGVuIGhhbmRsaW5nIEZFQVRVUkVTX09LIG9yIHByZXNlbnQN
Cj4gTkVFRFNfUkVTRVQuDQo+IA0KPiBUaGlzIHBhdGNoIHdhbnRzIHRvIGNvcHkgdGhlIG1lY2hh
bmlzbSBvZiBoYW5kbGluZyBGRUFUVVJFU19PSywgYnV0IGlmIHdlDQo+IHdhbnQgdG8gcmVzb2x2
ZSB0aGUgcHJvYmxlbSBvZiBkZXZpY2Ugc3RhdHVzIHRyYW5zaXRpb24sIEkgYWdyZWUgdG8gYWRk
IGEgbmV3DQo+IHN0YXR1cyBiaXQ6IFRSQU5TSVRJT04uDQo+IA0KPiBUaGUgZGV2aWNlIHNob3Vs
ZCBwcmVzZW50IFRSQU5TSVRJT04gdW50aWwgaXQgY29tcGxldGUgdGhlIHJlcXVlc3RlZCBzdGF0
dXMNCj4gdHJhbnNpdGlvbi4NCj4gQ29tYmluaW5nIHRoZSBrbm93bGVkZ2Ugb2YgdGhlIGRldmlj
ZSwgdGhlIGRyaXZlciBjYW4gdGVsbCB0aGUgZXhhY3QgZGV2aWNlDQo+IHN0YXR1cy4NCj4gDQpZ
ZXMsIHRoaXMgd2lsbCBiZSBnb29kIGlkZWEuDQpUaGUgVFJBTlNJVElPTiBiaXQgd2hpY2ggbXVz
dCB0dXJuIHZlcnkgcXVpY2tseSB0byAxIG9uIGFuIE1NSU8gd3JpdGUgcmVxdWlyZXMgdmVyeSBz
cGVjaWFsIGNpcmN1aXRyeS4NCkl0IG5lZWRzIHRvIHR1cm4gMSBqdXN0IGJlZm9yZSB0aGUgbmV4
dCByZWFkIGFycml2ZXMgZnJvbSB0aGUgZ3Vlc3QgZHJpdmVyLg0KVGhpcyBpcyByb3VnaGx5IDEw
bnNlYyBvZiB0aW1lICh3cml0ZSBmb2xsb3dlZCBieSBhIHJlYWQpLg0KDQpUbyBzaW1wbGlmeSB0
aGlzIGFzcGVjdCwgYSBiZXR0ZXIgYXBwcm9hY2ggY2FuIGJlLA0KMS4gZGV2aWNlX3N0YXR1cyB0
byBoYXZlIFNVU1BFTkRFRCBiaXQsIHdoaWNoIHN0YXJ0cyB3aXRoIDAuDQoyLiBhIG5ldyBjdHJs
X3JlZ2lzdGVyIGlzIGFkZGVkLiBXaGVuIGNtZCBpcyB3cml0dGVuIHRoZXJlLCBpdHMgc3RhdHVz
IHJlZmxlY3RzIGluIGRldmljZV9zdGF0dXMuDQoNCjMuIFNvIGV2ZW4gaWYgdGhlIGRldmljZSB0
YWtlcyAzMG5zZWMgb3IgMzB1c2VjIHRvIHJlc3BvbmQsIHRoaW5ncyBkb27igJl0IGJyZWFrLg0K
DQpGb3IgZXhhbXBsZSwNCmEuIGRyaXZlciB3cml0ZXMgZGV2aWNlX2N0cmwgPSAweDEgKGNtZD1z
dXNwZW5kKQ0KYi4gZHJpdmVyIHJlYWRzIGRldmljZV9zdGF0dXMgPSAoc3VzcGVuZGVkPTApIC0+
IG5vdCB5ZXQgc3VzcGVuZGVkDQpjLiBkcml2ZXIgbG9vcHMgb24gI2IgZmV3IG1vcmUgbnNlY3Mu
DQpkLiBmaW5hbGx5IGRldmljZSB0dXJucyBpdCBzdXNwZW5kZWQuICBTbyAjYiByZXR1cm5zIHN1
cGVuZGVkPTEuDQoNCkFuZCB3ZSBjYW4gZXh0ZW5kIGl0IG1vcmUgdG8gYmV0dGVyIHJlc3RydWN0
dXJlIHRoZSBvdGhlciBvcGVyYXRpb25zIHRvbyBzdWNoIGFzIGZlYXR1cmVzX29rLCBkcml2ZXJf
b2sgZXRjLg0KQW5kIGNhbiBhbHNvIG1ha2UgdGhlIGN1cnJlbnQgInJlc2V0IiBmcm9tIFNIT1VM
RCB0byBNVVNULg0KDQpJdHMgb25lIHRpbWUgcHJpY2UgdG8gcGF5IGZvciB0aGUgZXh0cmEgcmVn
aXN0ZXIgYnV0IGl0IGlzIGZhciBlYXNpZXIgdG8gaW1wbGVtZW50IGZvciB0aGUgZGV2aWNlcyAo
YW5kIHdvcmtzIGZpbmUgZm9yIHN3IGJhY2tlbmQgdG9vKS4NCg0KDQoNCg0K
