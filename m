Return-Path: <virtio-comment-return-7821-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1F0CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 17:00:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 02716790F0
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 17:00:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C95869868B1
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 17:00:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A4C2B9868AB; Wed, 18 Oct 2023 17:00:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 94B4E9868AC
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 17:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1697648412.184000
X-TM-MAIL-UUID: 229924e8-32a3-443b-b702-b06232ac618e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqB2jr4tpK8U0PzQ1uiCXJ/4VojjV8RBwvBloG5DvkLQem30zgWG2XFTIpW1aprPmI7zgCff81y5JgYmFLnFhcUqtC/ZTg18+0bM6tOGl3ipcLtHBA5qngEOtOWEBGbEbo6Px4lY3PEOBh50Aa5Keki0kpeN4gyg4Ah6hA3gAGEyPGDCYm+Gx9zboqsC6UhgRIHZ/jgtGc0GXnV/LV05xIAigbwDWgaEjRHYgnWsbRO+DnHWyiwVkCKGJopJV3EeB6rrgMkVr98bfou3WVcUbw9+Y0o/XUI/oQc6v/TDmlgfkqp2VuXSjK8dJLQV18HbBdmM+GEIt/hCoDCts2Lkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yw9Z482StjdEhekY6gZefm+6MkPXuERnBSOgtysUcpI=;
 b=cPPYcX3bk1fJlTTfqRrphtacFOLqFQJJv641sTZKfmfPx9P6BmN+K42+AiZ3cH0ErkKk2osvcrwt+9GKRWABJGDboye0MuzlcnOmr8WvQIc7XV2uQSgU9+e3sz6t/2jT0hdUQpkY6elquDDfqC1/hirOo+U6sFxDq+RBzig2yR4ZbPXFf4/c6l2s55x2otlgYcmZrxAXw8DCdmialwsMsxU3WiDCwJ3QbhjANyR7sIiPSFZFU88QbodE50slOztJz08Pes6B8w2HsnNEgG92qaAsWjRxBYk9Ytnhehj6yyCEGAfZcINnzzL+/XWDZWUtJQaeeXI+NIyiJcon34W1lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <520b95c5-0295-4d36-85cd-48e5021f0579@opensynergy.com>
Date: Wed, 18 Oct 2023 19:00:09 +0200
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Cornelia Huck <cohuck@redhat.com>
References: <20230630092959.392381-1-peter.hilber@opensynergy.com>
 <PH0PR12MB5481F7AD21A871DE5660A948DC1EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com>
 <PH0PR12MB5481BA022FC2CA834264CC47DCFCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9da5f426-0099-8b58-bb24-fdbfeb02b4fc@opensynergy.com>
 <PH0PR12MB5481DDD6D022617D6F615429DCC6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <026c8242-7dae-4ee9-b9e9-bb52af07c063@opensynergy.com>
 <PH0PR12MB54815BDBEA7E4DE1074B167DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0c7bec47-8a21-4a1e-80e9-43740a72d427@opensynergy.com>
 <PH0PR12MB54812437DFD91F0F3E3CFBFFDCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <5fd2682c-6479-4750-b0e1-d74070453b31@opensynergy.com>
 <PH0PR12MB54816E8AEE2AE89148076542DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6d6f0c19-9a08-4b1f-9796-bf9c1ce09eb8@opensynergy.com>
 <PH0PR12MB54812685ED1723B7049FF6E4DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Peter Hilber <peter.hilber@opensynergy.com>
Autocrypt: addr=peter.hilber@opensynergy.com; keydata=
 xsDNBFuyHTIBDAClsxKaykR7WINWbw2hd8SjAU5Ft7Vx2qOyRR3guringPRMDvc5sAQeDPP4
 lgFIZS5Ow3Z+0XMb/MtbJt0vQHg4Zi6WQtEysvctmAN4JG08XrO8Kf1Ly86Z0sJOrYTzd9oA
 JoNqk7/JufMre4NppAMUcJnB1zIDyhKkkGgM1znDvcW/pVkAIKZQ4Be3A9297tl7YjhVLkph
 kuw3yL8eyj7fk+3vruuEbMafYytozKCSBn5pM0wabiNUlPK39iQzcZd8VMIkh1BszRouInlc
 7hjiWjBjGDQ2eAbMww09ETAP1u38PpDolrO8IlTFb7Yy7OlD4lzr8AV+a2CTJhbKrCJznDQS
 +GPGwLtOqTP5S5OJ0DCqVHdQyKoZMe1sLaZSPLMLx1WYAGN5R8ftCZSBjilVpwJ3lFsqO5cj
 t5w1/JfNeVBWa4cENt5Z0B2gTuZ4F8j0QAc506uGxWO0wxH1rWNv2LuInSxj8d1yIUu76MqY
 p92TS3D4t/myerODX3xGnjkAEQEAAc07cGV0ZXIuaGlsYmVyQG9wZW5zeW5lcmd5LmNvbSA8
 cGV0ZXIuaGlsYmVyQG9wZW5zeW5lcmd5LmNvbT7CwQ4EEwEIADgCGwMFCwkIBwIGFQoJCAsC
 BBYCAwECHgECF4AWIQTj5TCZN1jYfjl5iwQiPT9iQ46MNwUCXXd8PQAKCRAiPT9iQ46MN1PT
 C/4mgNGlWB1/vsStNH+TGfJKt3eTi1Oxn6Uo0y4sXzZg+CHXYXnrG2OdLgOa/ZdA+O/o1ofU
 v/nLKki7XH/cGsOtZ6n3Q5+irkLsUI9tcIlxLCZZlgDPqmJO3lu+8Uf2d96udw/5JLiPyhk/
 DLtKEnvIOnn2YU9LK80WuJk7CMK4ii/bIipS6WFV6s67YG8HrzMKEwIzScf/7dC/dN221wh0
 f3uUMht0A7eVOfEuC/i0//Y+ytuoPcqyT5YsAdvNk4Ns7dmWTJ8MS2t2m55BHQnYh7UBOIqB
 BkEWLOxbs2zZnC5b/yjg7FOhVxUmSP4wU1Tp/ye+MoVhiUXwzXps5JmOuKahLbIysIpeRNxf
 B8ndHEjKRl6YglPtqwJ45AF+BFEcblLe4eHk3Gl43jfoBJ43jFUSkge9K7wddB2FpaXrpfwM
 KupTSWeavVwnjDb+mXfqr4e7C4CX3VoyBQvoGGPpK/93cVZInu5zV/OAxSayXt6NqZECkMBu
 mg7W7hbcQezOwM0EW7IdMwEMANZOEgW7gpZr0l4MHVvEZomKRgHmKghiKffCyR/cZdB5CWPE
 syD0QMkQCQHg0FUQIB/SyS7hV/MOYL47Zb+QUlBosMGkyyseEBWx0UgxgdMOh88JxAEHs0gQ
 FYjL13DFLX/JfPyUqEnmWHLmvPpwPy2Qp7M1PPYb/KT8YxQEcJ0agxiSSGC+0c6efziPLW1u
 vGnQpBXhbLRdmUVS9JE390vQLCjIQWQP34e6MnKrylqPpOeaiVSC9Nvr44f7LDk0X3Hsg3b4
 kV9TInGcbskXCB9QnKo6lVgXI9Q419WZtI9T/d8n5Wx54P+iaw4pISqDHi6v+U9YhHACInqJ
 m8S4WhlRIXhXmDVXBjyPvMkxEYp9EGxT5yeu49fN5oB1SQCf819obhO7GfP2pUx8H3dy96Tv
 KFEQmuh15iXYCxgltrvy9TjUIHj9SbKiaXW1O45tjlDohZJofA0AZ1gU0X8ZVXwqn3vEmrML
 DBiko3gdBy7mx2vl+Z1LJyqYKBBvw+pi7wARAQABwsD2BBgBCAAgAhsMFiEE4+UwmTdY2H45
 eYsEIj0/YkOOjDcFAl13fD0ACgkQIj0/YkOOjDfFhwv9F6qVRBlMFPmb3dWIs+QcbdgUW9Vi
 GOHNyjCnr+UBE5jc0ERP3IOzcgqavcL5YpuWadfPn4/LyMDhVcl5SQGIdk5oZlRWQRiSpqS+
 IIU8idu+Ogl/Hdsp4n9S8GiINNwNh5KzWoCNN0PpcrjuMTacJnZur9/ym9tjr+mMvW7Z0k52
 lnS9L+CRHLKHpVJSnccpTpShQHa335c5YvRC8NN+Ygj1uZL/98+1GmP1WMZ6nc1LSFDUxR60
 cxnlbgH7cwBuy8y5DBeCCYiPHKBglVIp5nUFZdLG/HmufQT3f4/GVoDEo2Q7H0lq3KULX1xE
 wHFeXHw4NXR7mYeX/eftz/9GFMVU29c72NTw8UihOy9qJgNo19wroRYKHLz1eWtMVcqS3hbX
 m0/QcrG9+C9qCPXVxpC/L0YLAtmdvEIyaFtXWRyW7UQ3us6klHh4XUvSpsQhOgzLHFJ1Lpfc
 upeBYECJQdxgIYyhgFAwRHeLGIPxjlvUmk22C0ualbekkuPTQs/m
In-Reply-To: <PH0PR12MB54812685ED1723B7049FF6E4DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::18) To BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:77::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB3267:EE_|BEUP281MB3544:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa16241-62e4-4915-f6c0-08dbcffbb055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HOF1PylPQaoQKvVzrQwbsYMw36xj9ou6Ny9BTdv9ragfnyxtmMHGQJ08bEnI3Z5cDTmnZplJKSuT8wO6VGLEi20oy9SK2RLI2FE/lwmnsu0kmyt2UjRgQP26NTKVivK3H0V6VyGI6yF/Enx+VVEjXAiO6sTqJR8JQ/tWY7vHqtLmnKXa3WO66FrHvdcQ1EJPTzk643e8saZrTp4OVep9QIMt6xdH7OiZsLVRqQrDfNCtngWd5iAlhGgryh6QdIIdr3n0jYxrDxwgS/TcUooBGmIlZUMu+jVtFjh5Z6jFqmeAsj7JxyEVYKA44MAzia/MYQX+maxa1LJNE2GxY5ledSxrkH+w1KdVVBh1jyBtBuDrdfzeLPe9fYu9O2pC7Hy7oz4MFHF1nDM+yCF5TZK1j1Gw9pPMIKCI+twE2YiaU6LsqGKj6bxodeCOuIfWX6i3S1ynqGO3kV2mMsiRUyoov2h6A+2q0ZbM2I6IwXKScmabqmee/DVhqqZTJTv74zU23aFSuwMBUA78vJzfJcfdkoWAc0WDkualZdOle9OxfstSUGyT3x19khMkp3dbJKEEDM7MVYrgpVdiKFEyiJiE4el52wupt01jjhsr8NfBIyw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(39840400004)(376002)(366004)(136003)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(26005)(83380400001)(2616005)(41300700001)(44832011)(53546011)(31686004)(38100700002)(966005)(478600001)(316002)(66556008)(66476007)(66946007)(42186006)(110136005)(2906002)(36756003)(86362001)(4326008)(8936002)(8676002)(31696002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnkvaGFGaENOSUcxaWdsYVJBUHRoV1dxaFNGM1U4QnJNQmZ6ZTdNYm9nMUIx?=
 =?utf-8?B?eUZGYVZsck1udXB3M2REUTFOZkVndklXUFpweGd5elNNUDlBeFRKNWs3R25E?=
 =?utf-8?B?d3pNYjcxditvb3lKYUF0QUtGQkEwQUxyelJCbm1qMkM5OG5IaHB5UXJrd2gy?=
 =?utf-8?B?V2dRZjNGZ0dpT0RsU2ErK1J3N2kvL3JIZk5qdW5NQ0hNekpBZUZjZkpvMDB0?=
 =?utf-8?B?YjRUNTBNNkhVSEtlcWt3MnoxMjIvbGlORUprZ1dZbTRYQ1FoSDcwMGNXV3FR?=
 =?utf-8?B?ZVJRVmNLVnFIVURNTnhUWVFqeGJYdld0cDVIblMxWXBLbWNVUldtbFFnLzMr?=
 =?utf-8?B?akltUmhzRVViMVZuR2lIN0hicWgyaHFkUW05bXYyclVLK2E5U1J6MHoyd1VG?=
 =?utf-8?B?QTBzZUtORXhIUkkvbmkxOUpibWNTVDBJdWMwRjh0ZUhxZkRiS0I1aGxsMnlH?=
 =?utf-8?B?T0MydFRwVmx2a2RXRmFaM3V2bVpYYjhTSGZpaHRqWE1jcE5TNUo4cjgxQSs4?=
 =?utf-8?B?RHQyRGZybjVleW1jL0tiUmkzbnlhNENzeDlJVzBFSENJZlRuODNWZTA1QzFs?=
 =?utf-8?B?K01TUkhuUVF1UlNwbFJNa3ZTTkRpdGZZa2ZIT3pTUmp4QWdVQUpJY1RiK25T?=
 =?utf-8?B?ei84TGh6QllJU2Fpd0pIV28rbWhETlB0TXJSV1hYTUFNSlV6NnNRc0tDRHRM?=
 =?utf-8?B?anE2anpmY2l6YjM3Z3FGSDlOOHhRYSs2MHpIazQ0d2ptdXNPRDJvL0N6MnZu?=
 =?utf-8?B?QVBRUjRZa0F1ZEEvSjZnR0pNYUI0RUhRTndaNy8zb1VabHlJR2l6a3AxZjRW?=
 =?utf-8?B?NTJhSkYwY0o0MDZ3bXBXN2N2N1A0V3BpQnVVaXJUSmdaUzVaa2NMbkxqdFVw?=
 =?utf-8?B?eURmNEUva1pYR0pRTHNRMG5PaVdoTmdSRnFJQzR0YUR1NWlnaC9Mczl1Z0NE?=
 =?utf-8?B?bWRNY2w3a0pGSitrWkRUdUw5aXRIYWxTbFNkUWlvby9GV2lFWHh4RU94VE9w?=
 =?utf-8?B?Sm5ZZDRDUzF4OHM3UEQ4TWRoeEtEUkpZTUlqYlc0WUtUQXZoMis0VGphS0Yy?=
 =?utf-8?B?emg2NTBOQlYvWDV4ZzN1OGVCeFNTQ3UyZ3AwbkZGelc3c2xjZ3BFQktKU1Ur?=
 =?utf-8?B?MWhmR1RNYWFEZWkvYlBNMHZoWTBRV0Yzd2YvSEZ3MTBvemlreU9nZnphb0tL?=
 =?utf-8?B?eDdRRzBqS0xWSzh4ZWhQMTJGeXZmblhxTEpuY0JONWxSUFdKVGFZdVRNN0dW?=
 =?utf-8?B?UTBuWHI3Y3NpN0dxdkpwWWM3Y3RNcmhMUTV6cGs4Q2QyNkgvMXJ0Z1BYMGNz?=
 =?utf-8?B?NjRCODYrMER6N3QrZys3cXdmYUZFa0dURGlWUlBudmpLdEhibnNvbTNpVzRq?=
 =?utf-8?B?UHh5WUhxOGU1dGNVWm8raEdyTHJBazVmaDJ1bytVNTdiZGYyVmdvVHg4NE1m?=
 =?utf-8?B?MGRDUXhTNDR6Vk1rYldPYTlPVm9oWm5HSk5KUzFqSVI1c2hSbVhuV2NUTC9X?=
 =?utf-8?B?YjFjMEdNMGJoQ09NN1U5aFV0T0c5UVN4TEpMVllCTUxYdk9xMlRlNUwzKzlU?=
 =?utf-8?B?ZVhTNGVSU1hibnp4VHA0Wis0N2wrYnliUVpHenVZTnVSRlZXZDdNSWRSOFhF?=
 =?utf-8?B?VG4ya0p2R2lUdERDcU02WVkrZUNFaklsYXgyS1JRZjh0MEFMODRVM1Q1MXZT?=
 =?utf-8?B?S2RVenpiZitUT1BoTGljL0F3NDRnT0dhY1Vsa0ptdXVISTJPUytPWTRoM3o1?=
 =?utf-8?B?VC9kYUlhTTJla0taOGRwSnZ0M3JKaFpOSGNzUWxqRWx2UHRGV0hGLzA4Nkdx?=
 =?utf-8?B?WUtLNk9HeE13T0FtSVBQcTBxTHBHZHNDRFBmZ1NzWEsvK2VkZmcyUFZzeEEv?=
 =?utf-8?B?SXFBb2xXZWZ5UjhCbDB5ai9KOFhtWFV5YzRFcG9zdTFEY04yc1pXQkpuVXpX?=
 =?utf-8?B?Sk1Qd1I4OUpPc3hyT3gvc3ZRTnZFbUwwSTNtZkErbFB2YmlDUXBPZHRDaUVY?=
 =?utf-8?B?WGRYM2hwUnVnUUVvc3Z2UDFzMW1nOGNrSW0rcVVaaUg1YTBRSzJ2RXM5SGtP?=
 =?utf-8?B?QWR2ay8zVmt6UER6OGhYQ3JVbDUxeDRnQVp6L0JKQnNDWC9qSC9GUHQxM1Bj?=
 =?utf-8?Q?69fsoPiHFOavvgQHeucgkGMbm?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa16241-62e4-4915-f6c0-08dbcffbb055
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB3267.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 17:00:10.7060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grr7gPduAK9zfZjjxkeP3vOKq8DKv7mozMFc4nmsRN3N67QxEgJtq04jcpTHsLD9R+BFoWHZuyvekxdzxwjESQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEUP281MB3544
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-27944.000
X-TMASE-Result: 10--22.694200-4.000000
X-TMASE-MatchedRID: 9d2LtCNB3NL5ETspAEX/non73EnA6dC3lR7tN56aWVW0sdSrJZyyxtgR
	BrBRegKW/j56JLOIRjdEQu05apQ9ObpPJQ7/EpmFemm/1TaRdd00G+oRqSgejmNukPSmYL0qZnF
	tz4+XvXJ1xglApGAkmssLlBdcaQrmMHEJTrZQlmixfhoVgAwhgwIBZV+EzjMyFEzixQQX0lGZoJ
	He3NJpJWrQQL9WwbaWn7ZnyvecgshCQ2VgO+URvA6YSU90/Qbk1ZiTRyv0xwFiWXoT/A/ILwgVY
	uX4aS1DZFxFbHf2Iod6ubm5QV1rgOO8RSyDDOVDrA4NI70W5zVLwhl1oBS9nhxt8J0TFx3mHE1y
	HPxjKoZIUPusmNDDlwXKMY/zPSGZSTmG+cbqzLhtcb+ehWKUy4lrr1+rqm9aB+MucjuBARtnBat
	pBzLKGtkBXXtskDpbHnt1uo9OfSSONV4SA046N4ruruLIWfnxcnxszfxH2Ckmx8kl1Wnd+q+eCS
	MeOiOkA/lH/MvdoiYmkrgX3CciJpBlLa6MK1y4
X-TMASE-XGENCLOUD: 0c30328c-e7fb-4b73-9078-682bba1c0882-0-0-200-0
X-TM-Deliver-Signature: CC5F0F95BA553826FBC3A85F578F3B7B
X-TM-Addin-Auth: OkokZDx23qFrIDwsbxrvWg6Td0WE/FkpD2x4i2q825ymkv8X7vdCE+gj1Uc
	ZCZPKSE0JjKLV1mzK5UpggJCIriGMdCKL7ngrZvvmH9QTWB0DANSenhdeLSD9v0PQE9MALMD0qS
	3FJp9b3bLpkMXMwveF+55sZVnzvVGaiGpjaWpwxSed71x5R9H9Nv9lxCK5ENLuqOAwvqJIS0gwH
	tW8Q85CO+LbYiwLt6lKPFnlZd+lTUPgaFv5yI+fkUT8TRC+lW7+W4BADzfojduJL2//+kInoqGO
	RXF+1ymqjes+f1g=.C/WPXj+toSB4i200mBPdeazlhH9lG6IqftdeEBD4exicRiYUj2UMXU6AWi
	HWtgA1ozQA5m+ObcqAnsCBWPjYdqaD6A35KgRtKAaE3/OQfcPbjhfFxon3ydRLo7VGPaY8yKNay
	ZmKFompeVXCn7ScA2XjB6EkVsaTE+4rp2ZHdaddR/neben1MGHzVtWcy5Z9BC04SsZ++OhOgUX1
	cENWFGFMyCnIZ7kcD+O+P/gj7Bf+nsBwCtqJMV4jjOQd8uR10LTjeZkvGGKDdiF3LcNKTqtpBoE
	qUiGWSjXbvzd5Aylv2gA1r1zZx+pWKQG7l1EtGK2JS7B2BxFnmcMS/tKMNA==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.

On 18.10.23 18:24, Parav Pandit wrote:
> 
> 
>> From: Peter Hilber <peter.hilber@opensynergy.com>
>> Sent: Wednesday, October 18, 2023 9:44 PM
>>
>> On 18.10.23 07:36, Parav Pandit wrote:
>>>
>>>>>>>>>> With "unclear responsibility" I meant to refer to the
>>>>>>>>>> responsibility for drafting a spec extension for virtio-net,
>>>>>>>>>
>>>>>>>>> You can count me to draft the virtio-net spec for responsibility.
>>>>>>>>> I am sure others would join as there is common interest across
>>>>>>>>> multiple device
>>>>>>>> implementors to support it.
>>>>>>>>> We know at least 4 stake holders have interests in it in
>>>>>>>>> virtio-net (Alibaba,
>>>>>>>> google, marvell, nvidia).
>>>>>>>>>
>>>>>>>>
>>>>>>>> OK, thank you for the information.
>>>>>>>>
>>>>>>>> I think the arguments on how to have the RTC spec interact with
>>>>>>>> the net device are now on the table. Maybe the discussion could
>>>>>>>> continue on a draft spec extension for the net device?
>>>>>>>>
>>>>>>> I didn’t follow the comment.
>>>>>>> My suggestion is lets draft the spec _now_ that covers rtc
>>>>>>> functionality as part
>>>>>> of virtio-net device and as independent rtc device.
>>>>>>> And if that requires me to work and draft the net part for you, I
>>>>>>> am here to
>>>>>> draft it.
>>>>>>>
>>>>>>> Would it work for you?
>>>>>>>
>>>>>>
>>>>>> Of course, work on the net part could also start now.
>>>>>>
>>>>>> I would prefer if the net part could be discussed as a dedicated
>>>>>> patch, on top of the patch(es) introducing the RTC device (and
>>>>>> referring to
>>>> those).
>>>>>>
>>>>> It will be separate patch (or patches) in device-type/net/description.tex.
>>>>> It should be part of same patch series as rtc and net so both
>>>>> devices agree
>>>> and reserve necessary opcode ranges etc to utilize same infra.
>>>>>
>>>>
>>>> I plan to send out RTC spec RFC v3, which should contain all the
>>>> agreed changes from the v2 discussion, in November. Maybe the net
>>>> related changes could then be put on top of that (and become part of a
>> common RFC v4)?
>>>>
>>> Sure, we can possibly converge before posting v3 itself so that v4 does not
>> require rewrite due to net.
>>> This can be done by drafting v3 in such a way that it fits the v4 scenario.
>>
>> AFAIU the only interoperability issue which was brought up in this discussion so
>> far, for which there was no explicit agreement on resolution, is how to
>> encapsulate RTC messages in the net controlq.
>>
>> For this I propose to encapsulate the RTC requests resp. responses in the net
>> controlq pseudo-fields command-specific-data resp.
>> command-specific-result. (command-specific-result is being introduced through
>> [1].)
>>
>> This handles natural alignment of the payload in a way which is compatible with
>>
>> - existing virtio-net controlq commands (including those being introduced
>>   by [1]), and
>>
>> - with the standalone virtio-rtc messages.
> 
> I will need to re-read the rtc v2, but the generic approach I had in mind is to take the ctrl vq opcode being common between net and rtc.
> And follow the net's cvq command response format (don’t recall if fullfils rtc or not).
> And that’s it. Rtc and net gets both same command, same response.
> Net will have feature bit to indicate this functionality exists, for rtc it is implicit as its being and rtc device.
>  

But that would force virtio-rtc to use the not padded request/reply headers
which the virtio-net controlq has, implying dedicated descriptors for
class/command and ack to still have natural alignment in
command-specific-data and command-specific-result.

	struct virtio_net_ctrl {
		u8 class;
		u8 command;
		u8 command-specific-data[];
		u8 ack;
		u8 command-specific-result[];
	};

To me, this looks like a net legacy issue, so it should be addressed in net
by encapsulating the aligned RTC request/response.

Thanks for your feedback,

Peter

>> [1] https://lore.kernel.org/virtio-comment/20231009013135.55890-1-
>> xuanzhuo@linux.alibaba.com/#iZ31device-types:net:description.tex

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

