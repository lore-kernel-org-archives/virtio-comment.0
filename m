Return-Path: <virtio-comment-return-6273-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D85C7EE23
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 02:06:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BDF991FF69
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 02:06:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B0F1F98668F
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 02:06:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A12299842E9; Fri,  9 Jun 2023 02:06:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F30598668D
	for <virtio-comment@lists.oasis-open.org>; Fri,  9 Jun 2023 02:06:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMRWlw0husgyhV0KouPbrt2veNYmVdfYX5KBYYg5h7sVJzepRB+mtXSsmsEKhUqLjCbemZr13WJK11G6F2KdgKg/cKBiv3rTF0R7iVNuQKnrOXdeSvkVR6Hq6sTec/RHwxux4NUXD+v6mb4CsCW4WJ68CRZe94/qkaYOJseqLJm5szle9xrVHEg5eqGj/k0MyCkHDJu3LsbJ3T+vuK5VbrK883Aagb9U5nOoE6ddzTE8Z4PjLDP/pdh76Z5hd4HFtEBVZWqHpx+SFshUDTycqRxY33z5X5z/Mhzz3Wgsv6t502tKJ+fpsVfaka03lRkJ3arRc4O8c21RLqiF+iabBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vh0b4XqSEgn5SYLitygt86g6t4IBpldA6EHvC3hd4Ds=;
 b=EzCKee7wJL55EmBaMIyiSJlaDFs0xATxVB/9HgEVkPfuRfjmJIFGscS5j2Sv9SzHdBKZpMSqh+xVpVqGbk8O4qSYbwk4ac49A+MsTNwQd9uihjk623dFsFmXLOikgG8+8ri6rG2nYrLEHzo5a2SNxBiyY+dN0oks27XORhV5pxKf9jsaQ19lwI9Rg6ypjN+hSeLjffI16SSNPpFKgLfSD1BKplpB9lx1GqOfx8yEWh+26it7YIOIr4cPR0JbwjtBfcOVHj6uvTOQ9bGu+uxA97wTKzfzHB/KGekJ1KIhJvJvTC+D6mlwB/za+uJRP0a7Q5epdTkp4kmqPEkJPMar3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: zhenwei pi <pizhenwei@bytedance.com>, Stefan Hajnoczi
	<stefanha@redhat.com>
CC: "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "houp@yusur.tech" <houp@yusur.tech>,
	"helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
	"xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
Thread-Topic: RE: Re: Re: Re: [PATCH v2 06/11] transport-fabrics: introduce
 command set
Thread-Index:
 AQHZfmF2m1yu3FfKeUGpsXWnsx3M9K90yN4AgAJcugCABXPNAIAAlxGAgADKFQCAAOCkgIACeCyAgAADBvCAAJNGgIAABt4Q
Date: Fri, 9 Jun 2023 02:06:31 +0000
Message-ID:
 <PH0PR12MB548134F882F3B725749BED05DC51A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-7-pizhenwei@bytedance.com>
 <20230531171036.GH1248296@fedora>
 <8cfdc9bf-03c9-92fc-f2e0-d59b180b0d82@bytedance.com>
 <20230605163046.GB1624556@fedora>
 <54bb85af-7979-8226-cfef-d72c1cf2332f@bytedance.com>
 <20230606133444.GC1958291@fedora>
 <86978fc3-c065-5a64-2996-28b4eb2b40bd@bytedance.com>
 <20230608164123.GB2240319@fedora>
 <PH0PR12MB5481C447A5FCA25A6D5B28E0DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d3455f74-c0a8-5285-0b07-caa99e17ce44@bytedance.com>
In-Reply-To: <d3455f74-c0a8-5285-0b07-caa99e17ce44@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA0PR12MB4350:EE_
x-ms-office365-filtering-correlation-id: bea2e956-be97-4057-0306-08db688e2488
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 JkvQk3WHAh54dC/yJWm2myQCLYhYc9YIKV0FhksGFkuQg1P2saXz1e79XF7z7lqY6LxfgwMKq8NLH1NIOAemRWT2T0iWsB16qK17wP5KThk9sbL+D2ZpSoeO2MmrzLA3bNa6wiNtTiqsKlSO+fQogrQE0UK7afs4FXxYdlpAb4uzBnoHnu7pl12XzPPgB08dbS3KsjU3KvlSS/iEk/zB/AxXNAf7AqIrRf5i3P6r3KbY88vX+vZ3p91UjYUxp1bfZgsnxMwD+nH22JiW0rk1Lexu5hfszVUYkfGU2XbIbZrJcEbLt8o7g32x/yTpy3/stwh42JaSvZHG1z5Ahcm2aw10ssmDcaBCS6dPkX9ZqT7qzgTbdYoFEPcJkI6qomwtD1f19E+H9RYhakDwoUMpMZBCFbZktaII6JagewMrTWUl0Y2u0GOsEFYec416rGzNaaBgfHoj3EKEXwNU8LXpg4MJXEIe+lDrF8TfKieuGAdOx11qm8YLoyeh4JntB1TR6IZFM7uyS75ssnS/0rS6fL0pE7slGGnyOW309at9zXrJg1nNyC078YHWi8zdqHyvuIWZC17b2k+jd0jDD0rQxkQiTPcoSSOG6msXCNIF5JsR0mwZGnY3ZkAn4exa30MZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(86362001)(186003)(55016003)(9686003)(26005)(6506007)(33656002)(7696005)(83380400001)(8936002)(8676002)(71200400001)(5660300002)(478600001)(54906003)(110136005)(52536014)(38070700005)(38100700002)(2906002)(316002)(41300700001)(66946007)(4326008)(64756008)(122000001)(76116006)(66556008)(66476007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aHB2T00ybm9CNm5sdUlOb2ZrZW5pdDg3aXhNUmllYXBuSWZRemJGWkE3WDZ6?=
 =?utf-8?B?ZEx0M3hpbzUzcWhwaTBhaHdDMzRtRmM0a0lyaXFOUHBzYzJHZXJDWE0wYzdi?=
 =?utf-8?B?TERXOGVxVjlZeStoeHNIcDNlUXI5SS9RUTA4dktnK0FUM1cxOHhRaWFKZWF5?=
 =?utf-8?B?TW9LU0JWUXpuZXRWaUd5TDBDNXdvZ2dMS0xVMi9kQ3Q3SjZTK2lHRXM1aHZZ?=
 =?utf-8?B?YlRUMjNzWm1haVFpQ2ZnN1lIcnVMeTZtdGNRSjRHZThiME1TVGFOZHdLeG5N?=
 =?utf-8?B?djI3V3RONkZobUlRQ0ppaGVEU09CZTVoMlhqZFlXZnBPWjdqQXVGbFBPckp0?=
 =?utf-8?B?Vk1mNHBZcytlLzNyY0U0QzVkWjdJU2FQMktuWGxVM0JMV2RLSithZXhxcnRD?=
 =?utf-8?B?NVpvNE5kNTVMSHZQTlYxRUlubWd3NGFDQVV5ZEhPRzQrTmFjSU5vNlRyNFBm?=
 =?utf-8?B?VU5JTWVqRzZvQVY4WUFkZDdqY0xWMUtBNUhXTlVyS1VUYkpzT3Y4aXhSQm4w?=
 =?utf-8?B?NWJod0JaWFRxbU1UODgyL3IyaGxheERreGxkc1NkeE94RjlMTVFaanBIeVFm?=
 =?utf-8?B?RXVLUXp1WnQrNnlTcllJbmE2QlZaRHlTSjd0WVJLY1E0ZFFIbHNSKzVZM01p?=
 =?utf-8?B?WFVnUENhUGxYQmxISFRKRFNZRU01UUl1VUVpakVYYTdIMXJ3RjFtNUVYUG1q?=
 =?utf-8?B?VUZUUlk5QWp5NHliN3BzWngray9UYmZiL0lLUlNOT2g3WFRNVmxvZXQ1QWxi?=
 =?utf-8?B?SjhPeVJKYndlTlhRUGZXNXVDSDZ1c1J4VTE2dW85dEdqTW1kamhnRm9OOEpu?=
 =?utf-8?B?dUxIa1BzaW8rZysvRklDdXlwaldSQ3JnS01wcUttMDh0U3I4QksrNjBvaEsv?=
 =?utf-8?B?cGgxaGFneHJadlRUcUt5OUtscTRLdG9Xc2JCYmxHWTFXWC9DVmJ4RkpyeVpL?=
 =?utf-8?B?dlVqZW1JOGlTMytkZEZUdTRPcjdaaCsrend4MSs3UWlTV2pjTzhENmw0d0Rk?=
 =?utf-8?B?WW1rbVNoUkhvMy9NcDM3M01Cd0ZIL09WN2dvVkwzclVGTnBud0dQSCtlRXJY?=
 =?utf-8?B?S0gwaGgvNVRuWFMzMEIwd0x2QTVIMW5LZ1J5MUlhdWdiRzByaWI0SzAxMVJD?=
 =?utf-8?B?NVhIM0tvZVRNVkRUdjJrMkFoQjRpbGpXLzFZcHpTZkN6S2dveWtNeGtCMkVX?=
 =?utf-8?B?RUp3Y2d3NkI4YTk1ZHBTNU91NDBDOUpSd1kzakRRaGdQeXJPbVorUlhSM2hU?=
 =?utf-8?B?R2U4bTd1UE9BdTUvT0txK0dRUzhNMVJDNnErYWk1ZkxtMDlRT01sQ20wWjc0?=
 =?utf-8?B?WERwcHJldGM4QnhtaHZYYWlVM0JodTJCYVF6ZXp0YTRVSGZ4OVVyTVBPZ1cw?=
 =?utf-8?B?RlhBNlFKRzRWWDFSc0owUk5KUU9KMnNtbWErTTRCMStMa3gwQWFnTjh3a3Jk?=
 =?utf-8?B?QzdMa2hUM0ozZmRReEZiL3d0b2FSKzFUNWJtTGk1UTQweGZGaTZJQnJXTmo2?=
 =?utf-8?B?ZUxoWG5LL3p5V29uRXhNVyt0V1BnVWZiTTdUQVVpOFZxanR1M3RldUFPSzha?=
 =?utf-8?B?SGJMTDRucThpYTJCdGRtVWdvWDRPc00rV3RTQlhBRzZsSnA1cldQZm94TWp3?=
 =?utf-8?B?WWNmZHdBQnVkdzUzRTlQZ3VGYXJRUzU3YSttODUrbjl5M1FJdHNGUUZndXVr?=
 =?utf-8?B?SDNzNk5sYlRPZWcrN0VkL1ZnWG1CTzNzRjgxQ1Z6OVJIYmdMTGE1OWh2OVU3?=
 =?utf-8?B?VkxXM1BTUHdhcjJqRmFxK2dVWUd5S1V1Uk14Y2RvSFdkSUNNQStvNy9Cd2NP?=
 =?utf-8?B?TFQyUE9XcXRZTFFQTjhGMDkreG91QUtJMjlUanh0WHFMeGpVS0t6dEFRekM5?=
 =?utf-8?B?UUxXSWQxVGVBb1d4c3RFVVRYZEJ3MGEvVEE5QWQ3MlFYZU5YeEtLdjZFSGxw?=
 =?utf-8?B?QW9pQXBja3FDZUVOUTkvZ3VRUzc4NmFJUy9xb01xZUJoMlJrYjNPTkNHLzJ3?=
 =?utf-8?B?cllpcDNMSVU2Z2xyYis0Vk8xU1IxaTZwTXR0R2tYUUVJTDNmSmNKanVNOEl3?=
 =?utf-8?B?WTlBa2NvSmpxM1k1M0VVeklDR2hRYnE0akVRR3pkdlB6WnllRTZ1MllXc2pI?=
 =?utf-8?Q?gsSI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea2e956-be97-4057-0306-08db688e2488
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 02:06:31.0560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tIhIgPMzS2PJHtrDjMNewjryyNkeyqtjNAMYonr/IGe2RaDhfIIdOAFVzFSOxpjp95MwTfyVvfLNJb0lIKN3Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4350
Subject: [virtio-comment] RE: RE: Re: Re: Re: [PATCH v2 06/11] transport-fabrics: introduce
 command set

DQo+IEZyb206IHpoZW53ZWkgcGkgPHBpemhlbndlaUBieXRlZGFuY2UuY29tPg0KPiBTZW50OiBU
aHVyc2RheSwgSnVuZSA4LCAyMDIzIDk6MzkgUE0NCg0KDQo+ID4gV2Ugc2hvdWxkIHN0YXJ0IHdp
dGggZmlyc3QgZXN0YWJsaXNoaW5nIHRoZSBkYXRhIHRyYW5zZmVyIG1vZGVsIGNvdmVyaW5nIDUx
MkINCj4gdG8gMU0gY29udGV4dCBhbmQgdGFrZSB1cCB0aGUgb3B0aW1pemF0aW9ucyBhcyBleHRl
bnNpb25zLg0KPiA+DQo+ID4NCj4gDQo+IEhpLCBQYXJhdg0KPiANCj4gV2hhdCBkbyB5b3UgdGhp
bmsgYWJvdXQgYW5vdGhlciBSRE1BIGlubGluZSBwcm9wb3NhbCBpbiAnW1BBVENIIHYyIDExLzEx
XQ0KPiB0cmFuc3BvcnQtZmFicmljczogc3VwcG9ydCBpbmxpbmUgZGF0YSBmb3Iga2V5ZWQgdHJh
bnNtaXNzaW9uJz8NCj4gDQo+IDEsIHVzZSBmZWF0dXJlIGNvbW1hbmQgdG8gZ2V0IHRoZSB0YXJn
ZXQgbWF4IHJlY3YgYnVmZmVyIHNpemUsIGZvciBleGFtcGxlIDE2aw0KPiAyLCB1c2UgZmVhdHVy
ZSBjb21tYW5kIHRvIHNldCB0aGUgaW5pdGlhdG9yIG1heCByZWN2IGJ1ZmZlciBzaXplLCBmb3Ig
ZXhhbXBsZQ0KPiAxNmsgSWYgdGhlIHNpemUgb2YgcGF5bG9hZCBpcyBsZXNzIHRoYW4gbWF4IHJl
Y3YgYnVmZmVyIHNpemUsIHVzaW5nIGEgc2luZ2xlIFJETUENCj4gU0VORCBpcyBlbm91Z2guIGZv
ciBleGFtcGxlLCB2aXJ0aW8tYmxrIHdyaXRlcyA4azogMTYgKyA4MTkyIDwgMTYzODQsIHRoaXMN
Cj4gbWVhbnMgYSBzaW5nbGUgUkRNQSBTRU5EIGlzIGZpbmUuDQoNCkxldCBtZSByZWFkIGl0Lg0K
RnJvbSBhYm92ZSBzaG9ydCBkZXNjcmlwdGlvbiwgaXQgYXBwZWFycyB0aGF0IGV2ZXJ5IHJlY2Vp
dmUgYnVmZmVyIHBvc3RlZCBtdXN0IGJlIG9mIHNpemUgMTZLLg0KQW5kIGlmIHNlbmRlciBjaG9v
c2Ugbm90IHRvIGRvIGlubGluZSwgdGhlcmUgaXMgc3VwZXIgYnVmZmVyIHdhc3RlZC4NCg0KSWYg
aXQgaXMgcmVhZCBvbmx5IG9yIHJlYWQgd29ya2xvYWQsIHRhcmdldCBtYWpvcml0eSBidWZmZXIg
d2FzdGFnZSBpcyBjbG9zZSB0byA5OCUgb3Igc28gYXNzdW1pbmcgNjRCIGNvbW1hbmQgc2l6ZS4N
Cg0KQW5kIHdoZW4gYnVmZmVyIGlzIGZ1bGwsIHRoZSBzZW5kZXIgaXMgc3RhbGxlZCBmb3IgdGhl
IGZ1bGwgcm91bmQgdHJpcCB0byBlbnF1ZXVlIHRoZSBjb21tYW5kLg0K

