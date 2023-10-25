Return-Path: <virtio-comment-return-7953-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE4DC25B47
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 09:55:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 39F582AEEF
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 09:55:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1CA1F9869F0
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 09:55:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F35B49869E2; Wed, 25 Oct 2023 09:55:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E2B6B9869E3
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 09:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TU3gWY0Dbcf5WBTfYI9wvC/i4MQ40GgPB1tZ/EpGSqKt8IMJ2z/u3vJPIZTZmTZ/xGRBZYMN+eLMF7kGUfti7XpQ5e7ID+DXKPy8554GxDCdPHQIvmGj/7sXBmZcAJCkpT2ATkF/xrlBxsinRxVLPrD1+0E7H3waIwfAMS0JAs+ZIOoH4ePK5UtbckT4oH7JOlhspm7gaD/5cFdIaCffeO6U7jH70sK4oTVp5ILxJMo03ljx/A6bN8IVQMC/4ZSnrd0dW7Jyy23swnplEqRYlhFNWsj8Yo6TGRLB+H5afy+e/R2nxH5u5LFwT1D1lOq2dzB3u8xt/A5OThIayL44bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Berii8rBopiGq9iJFEsDt2M7f3Lo7P4FfAhbLYxAN1Q=;
 b=ge1uH85zYLJYwR9o7kKb3lCs2edwuAgUCf0pEy6+7b/LtsWsKB3G1Rtayt9nuXwtZmkmLCCKx969mTGlgpoLBFyFK0fHze5YdafOtGMM5ArR1prJVLPOhMoowbkTHYI1axqbxRPpMTPky1/9/s6sgbeLZR6MKssnjRyHwiSpy5tL24hS7tcNrE7yHxd8GGN4tpS5sRbiZK3fGEwQqFvtjMevQz4fC+nEaWshTepHc0ebAKF3+g1lx4vnHQL//99o/G0RlHjlf6voVGEmNJY9wDlAj3jg4X2yi5cqlZddF6qdCzJq/+EMhIEA4RU36+0qQKNkc2V62YWMM+tswYjL8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFwgAAH/ICAAAX5IIAAA0oAgAADzbCAAss+gA==
Date: Wed, 25 Oct 2023 09:55:20 +0000
Message-ID:
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231002051601.6626-1-parav@nvidia.com>
 <20231002051601.6626-3-parav@nvidia.com> <871qdte8r6.fsf@redhat.com>
 <PH0PR12MB54812DF4DB53917D4895FFCADCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87sf68cjn0.fsf@redhat.com> <20231018062704-mutt-send-email-mst@kernel.org>
 <87pm1cchuq.fsf@redhat.com>
 <PH0PR12MB5481DB9D38E58522F0B15EEFDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548188345E2CF3B8AA5E2DEDDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481D21AD4CD4C649C4E023FDCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87zg09bfwg.fsf@redhat.com>
 <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87wmvdbehg.fsf@redhat.com>
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ0PR12MB7033:EE_
x-ms-office365-filtering-correlation-id: f1763cb5-1c10-4a04-6420-08dbd5408003
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 P2rZ6KUYLyL4p5ULos2Du5izt2CqVcX1OKt6OPGxc2nwrhA4bldchhcDwpbrrJbUxync/XxmyI9g44V0VI+bJxUwtXXY+umNVSlHu76Rjn0PaiD0piS0nBDo9llCR/aNYWU6ykpzeVHm/UdohpQcRAq7aee7tnzHdEg9cTQ967Q26EAiJSTwPMr4RUPu+DZnP9fR926HXcVqBt4l+JQIZb6vqjdR76Zr+QnBbiwXcJknMkFHiUxtOFME9do3zg7lyAy81K5kgtE8ZE4NEomtAJZ6PEyqRvJPxFMf4/i/JnySYBdLn9Y1rZus24vkqdOlP5sDmgqzKSYPUgFojrsXOOn7uCfux572ih5PAUJbMbjbKmieGGkslN7jHIyW+QnrTP9oMV5J3ovH9v/iP9a6ZSqv7fN+BUXWONHVETgyGQ9mobsmEQlAfpg0vkXMHzKACAdjnYYqU3vX0gekPrgr8/2mXILxbUFDb7wIOeFWRSlcQ3FLcj1/P9uyyf9c87pWXjr+4goahl6UXjMUBGQCdFTprWh+GbqhI6EY2x298UlQ6WDmVzpfcNghtRo8VR4c/aukttZWHpQwgURrO9ggB8EmNG65F0D22HIO/9B0q2/U5a0uOt8ZIhlG5FEbPoFefdIvfoeytcDt4mSooSnxXHBJWBZ0gATt5sGsMN+GC+4vFvfPbkI695keK+MSmVmTSLOM92C7XosAyjuY8QiLhw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(478600001)(316002)(76116006)(66446008)(66476007)(66556008)(66946007)(110136005)(38070700009)(8676002)(8936002)(4326008)(64756008)(54906003)(966005)(52536014)(55016003)(71200400001)(5660300002)(53546011)(7696005)(6506007)(86362001)(38100700002)(33656002)(122000001)(9686003)(26005)(2906002)(83380400001)(41300700001)(107886003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cjlQOVoydWUxL3R2NGpnbGMwUnk3YTFhU1FiQkxUUno4QmRuOFF1MmpRZmNQ?=
 =?utf-8?B?RDhxaDZQUkZ4MnVndWZDNGpJbUxWYzRUd2VzNGozY21WTGc5b0JCRGh2Tlhz?=
 =?utf-8?B?WEpaSVl6bFNmSUNpS09qS0w3WmRRaFVIT0hnUmFKVTM1SGdIWUZnRTVqMVFC?=
 =?utf-8?B?VTNZL2JGNGttdkdTUHFOeXdqSDZIdTFKOGRVanpxWkJRUjJocjBWa0NwTFJU?=
 =?utf-8?B?cGdzQUVkaFI3Rnp4QlE0VTU5ajVSUml5bFYxd3l5L01mdytucy9GeURuYjFa?=
 =?utf-8?B?NCszWjdKV2NGaHdRS1ptdS9UQm5ORE1vS3hrYzh6Y0krQ2hsWVE1NTBJYklY?=
 =?utf-8?B?U3BBTEZwUCtzbVlxOCt1eFdtTXZSdlNUY0JFYUJoRUFmbW40MzQ1L21CaVAy?=
 =?utf-8?B?VmMvVHkrUlBJNHl6RjFUYkYwUENtRkpZR1pLRWx6bGlpblUwYVVRcUU5aGFW?=
 =?utf-8?B?d2Z3c0k4WWExLzJFZGNQT2RHdnlSMWo5OVZVM2NjcDdXdU9ibXorNzFrSThn?=
 =?utf-8?B?ODVSaGtyTGkzSWRkdFJKUjZ6ZHRUTm9kYnpQc2U0cmJLVy9GVkpuYWtMbUJj?=
 =?utf-8?B?UHV0NGdZZjF6bjhVZ0FnRDdGblFJWnhpM2JtOERBZ3hsWTJyUVU2bGRIVm8y?=
 =?utf-8?B?ek5hdzhYY1pYRy9VeVpJNCs0YVloY3lZTWE3NlZSUi9KOHRMWlc0QlEvYXBJ?=
 =?utf-8?B?MWFtTXozUXo1WnR2b3ZFZ2ZDT3VtVWExdSthR0Vabm1RK3A4QjI5S2wxTDI5?=
 =?utf-8?B?bVpRTkVMU3VtZHdEVXFLdVRnOHh0dFdqUzl3QVpNZmVsKzhWVE9mZ0pmdStX?=
 =?utf-8?B?KzArVHBuaTZkZTJTV0lsOVhoMGdoeHo4Um5VVnhYZGNjOUhnMFFBYzhEaXI1?=
 =?utf-8?B?c0hER01kcnpaeDdTSVhuNi9ZK2lVQmZSVXRFU3B2OXh5VFh3dkdDS0F6M1BC?=
 =?utf-8?B?S1hHdHpQUmZNUHZWWlloNElNR1pqOU5sVzlZbTgxOTdkUERmVnVkU1lHSVJK?=
 =?utf-8?B?dG8rdk92bDVSZTAvTDdvKzVWeEhJV1pXYVJxVjNUWm8yRFozTVg0RnQ2aDJ2?=
 =?utf-8?B?NEpCTFcyY0RaS0FESmk1dUFtSS84bVZuK2VYVEIrSVlteHlaejhObGsxVlEr?=
 =?utf-8?B?YTZ5YVJvRDJWQzRER1h6Z0gwcjJ3RXhnSDFYVzhCMDlLZlZGSmhSSDZMcjZI?=
 =?utf-8?B?a3BhREJEZnZ0aGFYRnRHN2JmS3dvVkIzaTFuWTFabFE3YzN2MldSbjZIYkZs?=
 =?utf-8?B?Ny9sSkwwNUl2Q01UWjFoUnAxTlZNMVgva29lNzJMQldibWVIUUVDdUFSNnBa?=
 =?utf-8?B?eFZnMTNPNlZQTURYRGY4dS9XUDhsaCtXaDdUeTVpVTVUc083Ky9CdVNMVHpR?=
 =?utf-8?B?Mlg2RnFYNTVQZllqYmJ2WU91VmhQaGRwOTBwM1JER2h5UndjWFIxMEVYakZ6?=
 =?utf-8?B?OUpsSHVZcU0xOTZ6WW55cnBYYTlYOVNFbEpPeVVKUnA5Q0l0UCtXRENqMVZK?=
 =?utf-8?B?T2ppNkZEdHBCaGFvUENkZXdIUWpOVlBZL2JGNndJTWtLQ1oycnc5QXQ4TVRZ?=
 =?utf-8?B?U3J5ajNZbC9ZMHM2ZVk5NitUSkJCS3YyMTJKditsRXlPVm9RK25xOXdtMlRy?=
 =?utf-8?B?R3QzOXF0REx0bnViLzJSdzQveDlURGlTTXljRzdodE1DaXc1d01DYzZNV0N6?=
 =?utf-8?B?R3FUOHBuRHFnbVlyTUlqaG9zbmZVN05sUTFCZk02RXYvOGFMWVlEWUVwWnls?=
 =?utf-8?B?b0h3UC8rZjF5dTFlSlhScHNjN2VTcTFKbzVmNDRvWHI4bmM0em1CUXFyTFM3?=
 =?utf-8?B?MkJwMzRyTnplWkNad1M1bXduaTllUmxoK3VZWWdKQnlPc1BoL1RvR2pjWWJV?=
 =?utf-8?B?WkI4NFdKS09HUW1CSDhROUR2Wkd6eXREaTArR2ZOZnJGQXp6aXZ1YXlMWlFM?=
 =?utf-8?B?bTh6bzczbUJ2OWVWVzFJMTBIa2tQcmM5WnJONzdXeUlMQ0s0UVJhS0kzdytz?=
 =?utf-8?B?N0g3Z3grZzlXeTdWOGNwWklFZFFSSlRWa0NKdlI5ZTk5VE4rK2pBeFNDSFNu?=
 =?utf-8?B?L05IZEtPQnRkWGpiYzBzenRYQ0hiekgxbFRhMlFYT0Nlc1A2d1B0dkErYmV0?=
 =?utf-8?Q?6LEQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1763cb5-1c10-4a04-6420-08dbd5408003
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 09:55:20.5038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gi1BEfcAdjqsaA/oNFUicAYQCo19vNd+928EC9qAMKQfuDPX2fSIW8pds7G064vqrc6NjNmJ+VTv3Mk58JlgwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7033
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

SGkgQ29ybmVsaWEsDQoNCj4gRnJvbTogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0K
PiBTZW50OiBNb25kYXksIE9jdG9iZXIgMjMsIDIwMjMgODo1MiBQTQ0KPiBUbzogQ29ybmVsaWEg
SHVjayA8Y29odWNrQHJlZGhhdC5jb20+OyBNaWNoYWVsIFMuIFRzaXJraW4NCj4gPG1zdEByZWRo
YXQuY29tPg0KPiBDYzogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc7IGhlbmdx
aUBsaW51eC5hbGliYWJhLmNvbTsNCj4geHVhbnpodW9AbGludXguYWxpYmFiYS5jb207IFNoYWhh
ZiBTaHVsZXIgPHNoYWhhZnNAbnZpZGlhLmNvbT4NCj4gU3ViamVjdDogUkU6IFt2aXJ0aW8tY29t
bWVudF0gUkU6IFtQQVRDSCB2MyAyLzJdIGNvbnRlbnQ6IFN1cHBvcnQgZW5hYmxpbmcNCj4gdmly
dHF1ZXVlIGFmdGVyIERSSVZFUl9PSyBzdGFnZQ0KPiANCj4gDQo+ID4gRnJvbTogdmlydGlvLWNv
bW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcgPHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLQ0K
PiA+IG9wZW4ub3JnPiBPbiBCZWhhbGYgT2YgQ29ybmVsaWEgSHVjaw0KPiA+IFNlbnQ6IE1vbmRh
eSwgT2N0b2JlciAyMywgMjAyMyA4OjMxIFBNDQo+ID4NCj4gPiBPbiBNb24sIE9jdCAyMyAyMDIz
LCBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gPj4gRnJv
bTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+DQo+ID4gPj4gU2VudDogTW9uZGF5
LCBPY3RvYmVyIDIzLCAyMDIzIDc6NTggUE0NCj4gPiA+DQo+ID4gPj4gT24gTW9uLCBPY3QgMjMg
MjAyMywgUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90ZToNCj4gPiA+Pg0KPiA+
ID4+ID4+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnDQo+ID4gPj4g
Pj4gPHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLSBvcGVuLm9yZz4gT24gQmVoYWxmIE9mIENv
cm5lbGlhDQo+ID4gPj4gPj4gSHVjaw0KPiA+ID4+ID4+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAy
MywgMjAyMyA3OjI3IFBNDQo+ID4gPj4gPg0KPiA+ID4+ID4+IFdlbGwsIHRoZXJlIGFyZSAgc3Rp
bGwgY29tbWVudHMgZnJvbSBtZSBoZXJlIHRoYXQgcG9zdC1kYXRlIHY0DQo+ID4gPj4gPj4gKHBs
ZWFzZSB3YWl0IGZvciBhIGJpdCBiZWZvcmUgcG9zdGluZyBhbm90aGVyIHZlcnNpb24hKSwgc28g
SSdsbA0KPiA+ID4+ID4+IGNvbnRpbnVlIHdhaXRpbmcgZm9yIHRoZW0gdG8gYmUgYWRkcmVzc2Vk
IGZpcnN0Lg0KPiA+ID4+ID4gVGhlIGxhc3Qgb25lIHdhcyBbMV0uDQo+ID4gPj4gPiBXaGljaCBJ
IHJlcGxpZWQgZmV3IGRheXMgYWdvIGF0IFsyXS4NCj4gPiA+PiA+DQo+ID4gPj4gPiBbMV0NCj4g
PiA+PiA+IGh0dHBzOi8vbGlzdHMub2FzaXMtb3Blbi5vcmcvYXJjaGl2ZXMvdmlydGlvLWNvbW1l
bnQvMjAyMzEwL21zZzAwDQo+ID4gPj4gPiAyNA0KPiA+ID4+ID4gMC5oDQo+ID4gPj4gPiB0bWwg
WzJdDQo+ID4gPj4gPiBodHRwczovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hpdmVzL3ZpcnRp
by1jb21tZW50LzIwMjMxMC9tc2cwMA0KPiA+ID4+ID4gMjQNCj4gPiA+PiA+IDIuaA0KPiA+ID4+
ID4gdG1sDQo+ID4gPj4NCj4gPiA+PiBJIHN0aWxsIGhhdmUgc29tZSBvcGVuIHF1ZXN0aW9ucyBm
cm9tIDw4N3NmNjhjam4wLmZzZkByZWRoYXQuY29tPg0KPiA+ID4+IChmaXJzdCBhbmQgbGFzdCBw
YXJhZ3JhcGguKQ0KPiA+ID4NCj4gPiA+IEFib3ZlIGxpbmsgaXMgbm90IGFjY2Vzc2libGUgdG8g
bWUuIOKYuQ0KPiA+DQo+ID4gVGhhdCdzIG5vdCBhIGxpbmssIGJ1dCBhIG1lc3NhZ2UgaWQuLi4g
bWFueSBtYWlsIGNsaWVudHMgc3VwcG9ydA0KPiA+IHNlYXJjaGluZyBieSBpdCwgYW5kIHlvdSBj
YW4gYWxzbyBnZXQgaXQgZnJvbSBsb3JlOg0KPiA+DQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzg3c2Y2OGNqbjAuZnNmQHJlZGhhdC5jb20vDQo+ID4NCj4gPiA+IEkgYWRkcmVzc2Vk
IHlvdXIgY29tbWVudHMvcXVlc3Rpb25zIGluIHY0Lg0KPiA+ID4gQ2FuIHlvdSBwbGVhc2UgY2hl
Y2sgdjQgaWYgdGhleSBhcmUgYWRkcmVzc2VkPyBJIHJld3JvdGUgYXMgeW91DQo+ID4gPiBzdWdn
ZXN0ZWQgaW4NCj4gPiB2My4NCj4gPg0KPiA+IFRoaXMgd2FzIGZvciBwb2ludHMgeW91IGRpZCBu
b3QgYWdyZWUgd2l0aC4gKEFnYWluLCBpdCBtaWdodCBiZQ0KPiA+IGhlbHBmdWwgdG8gd2FpdCB3
aXRoIHBvc3RpbmcgYSBuZXcgdmVyc2lvbiB1bnRpbCBkaXNjdXNzaW9uIGhhcw0KPiA+IHNvbWV3
aGF0DQo+ID4gY29uY2x1ZGVkLikNCj4gU3VyZSwgd2lsbCB3YWl0IG5leHQgdGltZS4NCj4gDQo+
IFlvdXIgY29tbWVudCB3YXMsDQo+ID09PT09DQo+IFRoaXMgaXMgbm90IHJlYWxseSBjbGVhciB0
byBtZSBqdXN0IGZyb20gdGhpcyB0ZXh0LCBlc3BlY2lhbGx5IGlmIHlvdSBqdXN0IHdyb3RlDQo+
IGFib3ZlIHRoYXQgZW5hYmxpbmcgb3IgcmUtZW5hYmxpbmcgaXMgc29tZXRoaW5nIGRpZmZlcmVu
dC4uLiBteSB1bmRlcnN0YW5kaW5nDQo+IHdvdWxkIGJlOg0KPiANCj4gLSBpZiBuZWl0aGVyIGR5
bmFtaWMgdnFzIG5vciBxdWV1ZSByZXNldCBhcmUgc3VwcG9ydGVkIG9yIG5lZ290aWF0ZWQsDQo+
ICAgdGhlIG9ubHkgd2F5IHRvIGVuYWJsZSBhIHZxIGlzIGJlZm9yZSBEUklWRVJfT0ssIGR1cmlu
ZyBzZXR1cA0KPiAtIGJvdGggb2YgdGhlc2UgZmVhdHVyZXMgcmVseSBvbiB0aGUgdHJhbnNwb3J0
IHN1cHBvcnRpbmcgZW5hYmxpbmcNCj4gICBpbmRpdmlkdWFsIHF1ZXVlcyAoZWl0aGVyIGEgcXVl
dWUgdGhhdCBoYXMgbm90IGJlZW4gZW5hYmxlZCBiZWZvcmUsIG9yDQo+ICAgYSBxdWV1ZSB0aGF0
IGhhcyBiZWVuIHJlc2V0KQ0KPiAtIHRoZSB0cmFuc3BvcnQgaXMgc3VwcG9zZWQgdG8gdXNlIHRo
ZSBzYW1lIG1lY2hhbmlzbSBmb3IgZWl0aGVyDQo+IA0KPiBEaWQgSSBnZXQgaXQgcmlnaHQ/IElm
IHNvLCBJIHRoaW5rIHdlIHNob3VsZCBtYWtlIGl0IGEgYml0IG1vcmUgY2xlYXIuDQo+ID09PT09
DQo+IA0KPiBBYm92ZSBpcyBjbGFyaWZpZWQgaW4gYmVsb3cgd29yZGluZyB3aXRob3V0IGNvbXBs
aWNhdGluZyB0aGUgcXVldWVfcmVzZXQgaGVyZS4NCj4gDQo+IERvZXMgdGhhdCBsb29rIG9rIHRv
IHlvdT8NCj4gDQo+ICtXaGVuIFZJUlRJT19GX1JJTkdfRFlOQU1JQyBpcyBub3QgbmVnb3RpYXRl
ZCwgdGhlIGRyaXZlciBlbmFibGVzIHRoZQ0KPiArdmlydHF1ZXVlcyBkdXJpbmcgdGhlIGRldmlj
ZSBpbml0aWFsaXphdGlvbiBzZXF1ZW5jZSwgaS5lLiBhZnRlciB0aGUNCj4gK2RldmljZSBzZXRz
IHRoZSBGRUFUVVJFU19PSyBzdGF0dXMgYml0IGFuZCBiZWZvcmUgdGhlIGRyaXZlciBzZXR0aW5n
IHRoZQ0KPiBEUklWRVJfT0sgc3RhdHVzIGJpdC4NCj4gKw0KPiArV2hlbiBWSVJUSU9fRl9SSU5H
X0RZTkFNSUMgaXMgbmVnb3RpYXRlZCwgdGhlIGRyaXZlciBpcyBub3QgcmVxdWlyZWQgdG8NCj4g
K2VuYWJsZSBldmVyeSB2aXJ0cXVldWUgaXQgd2FudHMgdG8gdXNlIGJlZm9yZSBzZXR0aW5nIHRo
ZSBEUklWRVJfT0sNCj4gK3N0YXR1cyBiaXQ7IHRoZSBkcml2ZXIgY2FuIGNob29zZSB0byBlbmFi
bGUgYSB2aXJ0cXVldWUgZXZlbiBhZnRlciB0aGUNCj4gK2RyaXZlciBoYXMgc2V0IHRoZSBEUklW
RVJfT0sgc3RhdHVzIGJpdC4gVGhlIHZpcnRxdWV1ZSBlbmFibGUgbWVjaGFuaXNtIGlzDQo+IHRy
YW5zcG9ydCBzcGVjaWZpYy4NCj4gKw0KDQpDYW4geW91IHBsZWFzZSByZXNwb25kPw0KV2UgbXVz
dCBtYWtlIHByb2dyZXNzIHdpdGggdGhpcyBhbmQgdGhlIGZsb3cgZmlsdGVycyB3aGljaCBhcmUg
ZGVwZW5kaW5nIG9uIHRoaXMgZm9yIGEgbG9uZyB0aW1lIG5vdy4NCg==

