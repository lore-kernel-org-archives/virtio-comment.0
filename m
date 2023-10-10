Return-Path: <virtio-comment-return-7642-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3462CD68EC
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 04:57:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 37F047C3CA
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 04:57:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2579098654A
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 04:57:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 11BED986478; Tue, 10 Oct 2023 04:57:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EF429986512
	for <virtio-comment@lists.oasis-open.org>; Tue, 10 Oct 2023 04:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aoWr8H3Y5/tUQEDYWNzoG6nXuqHHX++lsZMiFYVXhGrRkEaMTR5+vZLeNaPCbqs1mjpydQwMAnIFeOKeeUw9ABGvxKQ6f616FTv6251q6x6B6pk+1Quk/OSTs2z9/DVQMqZe3wxdKIK9hlq7Bs/dHjJbnHTSIZG4G9+sQvzs6hvRvmYgqj2yzd5UQq0UF8SkHGC6xJugWdPCFSex01HrWj6q6F8O7Dhs1a4b4WYgSXjsmiN0ot6YC+xRk/Zybz69/iu9i6FGbD0xyuHcfcam79S/WqmigIbwrLSK6XxjoXA3vJ+4D8Kd/64A8doCSpwFZ0Y29H0qQ/oq9C8fQS+Y2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rfpcRuF28OXgSu7aCg9Wa5KuppPARiZIqhPc3zOOqw=;
 b=OinF7zK12xx3PuBbzEwStX4TZ+drXRa/iAQLNuoE78eGzDhnM1EF9a+ywXOvIuFtTc0nYlHobQE03dR0168sqPj/iTfQOCcpmge4TP/vceq0UeK+zXgyMw5217+rjN/a+4d93sJB+KN4y8lltTPQyaERU7snbxchQZuc2Gq6H6Z675gJuJBH6Qj4dFiES/iIgxIbN8MCFn3we1UDoPEGTW0QT4rMVCjXUe/rDu4LSoYITUxe3fnqOuYuzffQfoLqyWt0anOpWlnrdubLpgKcLgSTordZ3FzizWWfUa/UT5ezfjkrBd8FSm3tOUAe/XZOuaw1KY3DesEUzQs7RmJ5TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>
Thread-Topic: [PATCH v3 0/2] Support enabling virtqueue after DRIVER_OK
Thread-Index: AQHZ9O+aMt9Foa96jkaKzO+VCfy5erA19cYggAyMF4A=
Date: Tue, 10 Oct 2023 04:57:24 +0000
Message-ID:
 <PH0PR12MB54817941AFA95235ECEE745ADCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231002051601.6626-1-parav@nvidia.com>
 <PH0PR12MB5481828A211C0EE78AB63113DCC5A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB5481828A211C0EE78AB63113DCC5A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB7774:EE_
x-ms-office365-filtering-correlation-id: fc5f47fa-f51e-4a5c-a7eb-08dbc94d64f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3QCCak39Cd1ZaUf5znAnI+oHyGgZT5vZNGoyxbPYLsJR7QUP/GH5r8pVviqzzdTge3FHqujpVpx/fFGiu5nmtUssAB/DS/b5Arbu253EbA1/3Hl1HAkki4lf9o9J631S0AC03OP6hnAleCfbX1nbC5pEWLUl3vT3VATlWDc1UxOFqSr8nsTSHNEbg7vZMmpBa8nrUP+NXYuhRYtyRUpkofI0AM/v7Os02/nruPtQ+GKPAfUZyB17EO8WOhrBhpSnlmkncOa2YQzAjVDF+I6UX2T3WbAUsupAZ/hL1tuoX4vsBPDTzgQudRT+53ulYsvL9ougPjq2t22K9sADTnev1F+FHov4PWggvgDGOW1PeXlVZxCG0gQhpBZUsgqVE/hO2vuVUpOipElPkmYFgfNubeovcPjTmE4hMfcpQjphDMOawQ3DsR17c91zvMwJTn4CAmuco9iOYWK9d40tlfaYiMxAnIDOCHDvEmPVfiQwpS/rDO4yOxNRJbnYdAFJ1uPhIEm365406fkqF7UudM7rr5kvAw0NSE0Rjrlx3bXrGxLOgrh4Lk/Cwwv5Z2+zJLaldikQv94kwSehM2UZ4MlVxsRcXKqXmW3/S7RxSn3MPW9HGpVB/fP4tDRAKhj+h/pDtnXMF16y2oAt0524obGYbNlubcwvKU/Mllp6U0W8THk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(376002)(366004)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38100700002)(7696005)(6506007)(478600001)(966005)(71200400001)(26005)(107886003)(9686003)(66946007)(2906002)(54906003)(5660300002)(52536014)(4326008)(8936002)(76116006)(110136005)(8676002)(66446008)(64756008)(66476007)(66556008)(38070700005)(122000001)(33656002)(316002)(86362001)(41300700001)(83380400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFdSOUxYa2x5UEhDeFhRMUN4U01uVzRMVDYrNlVPVW1JZXpTYllDZUdwbi9Y?=
 =?utf-8?B?bHJLZVpaTjlMcU1kSHc5VXhFYzRtUUVBajRvdWs0eVo5Q05PQnpJRkdwYm9Z?=
 =?utf-8?B?blVCTTRTMEkvdFNGeTgwVXMrM3pmTmZNRWROeDNSd3NRTXhIMmlHUEpGb2di?=
 =?utf-8?B?WnJTbnJ1UzZnVy9Na3VXV3Zndy9YUlR5ajM1cEQzYzZVNmRNU0dzeEM2UGFm?=
 =?utf-8?B?YU11TTV5bkZ2NGVXeFRHd3RSclI0dnE0TWwzZzlWUHdzWGgyVFQ2WkF3Szlp?=
 =?utf-8?B?WnhWeGd5ak9oaC9zREpJOFpndlhZeWE4Z3JzanN5YVUzdjgvTUJOdHdxYWlr?=
 =?utf-8?B?ZkdKUGVtYjk4SEk3L3czcDNpUGkreVkwWVVGSHZGWisvcEtCdWtuQkh3czlB?=
 =?utf-8?B?U1o1bzJlZkF3WXcycHg4c2JSZzRIOW81Mm5WVUYwUjRtdzUzWU12YVJ4d01y?=
 =?utf-8?B?VXNaWHk2dXdHc2huMFJ2K0dMUmJodTQveU9mWnFxQ0VBakpvWk9FaEtQcy94?=
 =?utf-8?B?WTEyMDZmcllxMENMNnkyL3FxSkozd3pDWnRBcmYzK2xRUVpHSTF3WXpya25p?=
 =?utf-8?B?MXdweE9IMTVONytUenIySDkrSE5uYTdFb0FZTWdERnVMR1d0ekhwcGhJaUV1?=
 =?utf-8?B?Z2NBclh2Zk9lQWNJb3hDdEwrUTU3am1tQWUxcktCL1kvZEJtVWxpT0Z5TmtT?=
 =?utf-8?B?Z1hkS2NTOXdMMEdFR0hYelByZFUrclBRUm1uN1pwRlo5VTl5eUtueXZkTW9G?=
 =?utf-8?B?cktaSVZnK2JJdGJZazRIUnM1aGNSZXFKUUo1RlBNVUpmZlpxTkREdTRPamdX?=
 =?utf-8?B?QXlmQmdxZlJkNkVhcFdsemtVWTIwem1JZGxGbUt2ZWozbG55b2JJVUhNMU5L?=
 =?utf-8?B?N1RJZGhuQTl6V2J1WUxBclBPcjdjRTNYWWRNR3Vxa0ppV2RFM203TmFWTXZL?=
 =?utf-8?B?bXZZdnMwbWZ3SGhzdU04bnE5S2d5cnd4VWk1T2laa01SUkFSNm5PdDU4UzVV?=
 =?utf-8?B?b2ZZeW5GVTVvTVh6b0NCN0J3RGM2aFIrV0UxWDNzM0twQVArQ2wva1R6M1VW?=
 =?utf-8?B?ei9sUTBXenJVTnVyNHRtblNtT0dzVU9nOG4yR3RlWmxyaFVlcXJFT3hGMkw5?=
 =?utf-8?B?OGRFSmhMZkRndFNUaW5qSTQ3UG4rYXV3THpPUkVTbGlEakhJdmVNT1AxRTQv?=
 =?utf-8?B?VE15SHY1Z3Q3U1FIVExIYisrRWpQVW9sNEV4a1MvaEFYUUZ5RDBhd3JQNC8w?=
 =?utf-8?B?RTFIOGhkT2lMVFNQME9EaUc1NWNLNXk4VW55QTlJeVpVME9kQU5kUDkzNlV0?=
 =?utf-8?B?c0VyV1RURWlyaXN0bVpNSnk1NWZiVXc4UlNtcVRzbDZUZnA4ai9jeU05Smw1?=
 =?utf-8?B?SThiS3dGeVRVYWJwaE90cWh5S2ZDaEFJNVFWNDJ4cnBHTU5TRitPRkNwaS9B?=
 =?utf-8?B?VVhpV1FhUXc5ODhjcjB5N2QvQ0lGT1UzR1hFelAxcnczRFphaHQxaU5JQTFZ?=
 =?utf-8?B?MHVRS0diR29lWldibDAwVGZTSjBLUFljWmFjWGkwRVcvb3hjb3pKOVllYm1v?=
 =?utf-8?B?dVpkM2VwZERKcXdWQ092QWdLOVByazZHS0Q3MVdkSHhLRUJXS2QvS1NIRW9u?=
 =?utf-8?B?TUtXd2lHVndBZlBvS2ltc0x3TWtaUjZFMURmS05GQ2x3YW5RU1RsWkZ5ZGxJ?=
 =?utf-8?B?S215U3NHb1F3NmwvR2x1b05CRXlsbE9NUnNLV0hnWkpHM1JPdGtQaU9nUHUx?=
 =?utf-8?B?RGlpMlBlam40RW9ocWFNOVA4S1FndytDZ29KRWZSSDhiUml2ZUFiMmJDcC9h?=
 =?utf-8?B?blBDNWNWeGJteHR5ZGc2b3oySFUvc0dUOVhrcDVxaW1BekNJcGh0b2ZNdUdM?=
 =?utf-8?B?azNsS0YvR2p6eXFqekY0L202UExqTmR2dVFsUTlWQWpvSzlTQ0EvbThRdkJE?=
 =?utf-8?B?RFpYMWJKdDVGdmxxdWMyd1cyaWRQK1YzaytRUEJrVERad2FEQ2pEWHQ2aDZu?=
 =?utf-8?B?UnNIdGczNkRFc0tNZjJiZEVSc3RDVDRqNnV3T0hmUnN5bDFWN2p5VHpvakQ2?=
 =?utf-8?B?bkhteUgxSk1OeXcyQjFDc2pnRjlRemtJcVpjWVNpcVkvK1VqbVg4WHlzdzdK?=
 =?utf-8?Q?DdIw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5f47fa-f51e-4a5c-a7eb-08dbc94d64f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 04:57:24.6547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G1CnVfOEpADQNkJOdFTY4erKXwnr1IHnyXs+iOwYiD0HV1P8nlQ2s0Q/qOAsaQe90uiZfxxegEMn80MpJTyIMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7774
Subject: [virtio-comment] RE: [PATCH v3 0/2] Support enabling virtqueue after DRIVER_OK

SGkgTWljaGFlbCwgQ29ybmVsaWEsDQoNCj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2Fz
aXMtb3Blbi5vcmcgPHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLQ0KPiBvcGVuLm9yZz4gT24g
QmVoYWxmIE9mIFBhcmF2IFBhbmRpdA0KPiBTZW50OiBNb25kYXksIE9jdG9iZXIgMiwgMjAyMyAx
MDo1MCBBTQ0KDQo+IEhpIE1pY2hhZWwsIENvcm5lbGlhLA0KPiANCj4gDQo+ID4gRnJvbTogUGFy
YXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiA+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAy
LCAyMDIzIDEwOjQ2IEFNDQo+ID4NCj4gPiBTdW1tYXJ5Og0KPiA+ID09PT09PT09DQo+ID4gVGhp
cyBwYXRjaCBlbmFibGVzIGRyaXZlciB0byBjcmVhdGUgdmlydHF1ZXVlcyBhZnRlciBEUklWRVJf
T0sgc3RhdHVzIGJpdCBpcw0KPiBzZXQuDQo+ID4NCj4gPiBUaGlzIHBhdGNoIHRha2UgdGhlIGlu
c3BpcmF0aW9uIGZyb20gdGhlIHRocmVhZCBbMl0gd2l0aCBjcmVkaXRzIHRvIEV1Z2VuaW8NCj4g
UMODcmV6Lg0KPiA+DQo+ID4NCj4gPiBVc2UgY2FzZXM6DQo+ID4gPT09PT09PT09DQo+ID4gMS4g
RHluYW1pY2FsbHkgY3JlYXRlIGFxIHdoZW4gYWRtaW5pc3RyYXRpdmUgY29tbWFuZHMgdG8gYmUg
dXNlZC4NCj4gPiBhdGUgdGhlIG5ldCBkZXZpY2UgdHgvcnhxIHdoZW4gZGV2aWNlIGlzDQo+ID4g
ICAgb3BlbmVkIHdoZW4gZGVwbG95aW5nIGZvciBhIGNvbnRhaW5lci4NCj4gPiAgICBJbiBhIGNv
bnRhaW5lciwgbnVtYmVyIG9mIHZpcnRxdWV1ZXMgdG8gYmUgdXNlZCBtYXkgYmUgPD0gbWF4IHF1
ZXVlcy4NCj4gPiAzLiBEeW5hbWljYWxseSBjcmVhdGUgZmxvdyBmaWx0ZXIgcXVldWVzIG9mIG5l
dGRldmljZSB3aGVuDQo+ID4gICAgQVJGUyBvciBldGh0b29sIGZpbHRlcnMgYXJlIGVuYWJsZWQg
YXMgbGlzdGVkIGluIFsxXS4NCj4gPiA0LiBEeW5hbWljYWxseSBjcmVhdGUgcnRjIGZ1bmN0aW9u
YWxpdHkgcmVsYXRlZCByZWFkIHZpcnRxdWV1ZSBvbmx5DQo+ID4gICAgd2hlbiBuZXQgZGV2aWNl
IHdoZW4gdGltZXN0YW1waW5nIHRvIGJlIHVzZWQuDQo+ID4gNS4gV2hlbiBYRFAgcHJvZ3JhbSBp
cyBzZXQsIG9uZSBjYW4gY3JlYXRlIGFkZGl0aW9uYWwgWERQIHNwZWNpZmljDQo+ID4gICAgcXVl
dWVzIHdpdGhvdXQgYWZmZWN0aW5nIGV4aXN0aW5nIHF1ZXVlcy4NCj4gPg0KPiA+IEhlbmNlLCBU
aGlzIHBhdGNoIGludHJvZHVjZXMgYW4gZXhpc3RpbmcgcXVldWUgZW5hYmxlIGFuZCBkaXNhYmxl
IChha2ENCj4gPiByZXNldCkgZmFjaWxpdHkgYW5kIGEgbmV3IGZlYXR1cmUgYml0IHRvIGV4cGxp
Y2l0bHkgaW5kaWNhdGUgc3VjaCBzdXBwb3J0IGJ5IHRoZQ0KPiBkZXZpY2UuDQo+ID4NCj4gPiBX
aXRoIHRoaXMgZmVhdHVyZSwgZHJpdmVycyBjYW4gc2tpcCBvcHRpb25hbCBxdWV1ZXMgY3JlYXRp
b24gZHVyaW5nDQo+ID4gZHJpdmVyIGluaXQgdGltZS4gRm9yIGV4YW1wbGUsIGEgTGludXggbmV0
IGRldmljZSBkcml2ZXIgY2FuDQo+ID4gY3JlYXRlL2Rlc3Ryb3kgdGhlIHRyYW5zbWl0IGFuZCBy
ZWNlaXZlIHF1ZXVlcyB3aGVuIG5ldCBkZXZpY2Uncw0KPiA+IG5kb19vcGVuKCkgYW5kIG5kb19z
dG9wKCkgY2FsbGJhY2tzIGFyZSBpbnZva2VkIHJlc3BlY3RpdmVseS4NCj4gPg0KPiA+IFsxXSBo
dHRwczovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hpdmVzL3ZpcnRpby0NCj4gPiBjb21tZW50
LzIwMjMwOC9tc2cwMDI2My5odG1sDQo+ID4gWzJdIGh0dHBzOi8vbGlzdHMub2FzaXMtb3Blbi5v
cmcvYXJjaGl2ZXMvdmlydGlvLQ0KPiA+IGNvbW1lbnQvMjAyMzA2L21zZzAwMDk3Lmh0bWwNCj4g
Pg0KPiA+IFBhdGNoIHN1bW1hcnk6DQo+ID4gPT09PT09PT09PT09PT0NCj4gPiBwYXRjaC0xIGZp
eGVzIHRvIGFkZCB2aXJ0cXVldWUgcmVzZXQgY29uZm9ybWFuY2UgcmVmZXJlbmNlcw0KPiA+IHBh
dGNoLTIgYWRkcyBWSVJUSU9fRl9SSU5HX0RZTkFNSUMgZmVhdHVyZSBiaXQsIHJlcXVpcmVtZW50
cw0KPiA+DQo+ID4gUGxlYXNlIHJldmlldy4NCj4gPg0KPiA+IEZpeGVzOiBodHRwczovL2dpdGh1
Yi5jb20vb2FzaXMtdGNzL3ZpcnRpby1zcGVjL2lzc3Vlcy8xNzcNCiANCj4gSSBoYXZlIHVwZGF0
ZWQgdjMgdG8gbGluayB0byB0aGUgZ2l0aHViIGlzc3VlLg0KPiBOb3cgdGhhdCB0aGlzIHNtYWxs
IGZlYXR1cmUgd2FzIHVwIGZvciBmZXcgd2Vla3MsIGNhbiB5b3UgcGxlYXNlIGNyZWF0ZSB0aGUN
Cj4gYmFsbG90IHJldmlldz8NCg0KQ2FuIHlvdSBwbGVhc2UgY3JlYXRlIGJhbGxvdCByZXZpZXcg
Zm9yIDEuND8NCg==

